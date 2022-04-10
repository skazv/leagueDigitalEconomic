//
//  CoreDataManager.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 09.04.2022.
//

import CoreData
import UIKit

protocol LocalDataProtocol {
    
}

enum UpdateSetup: String {
    case deletePerson
    case changeSection
}

class CoreDataManager: LocalDataProtocol {
    
    private init() {}
    public static let shared = CoreDataManager()
    
    static func fetchCategories() throws -> [Category] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { throw CoreDataErrors.contextNotFound }
        let context = appDelegate.persistentContainer.viewContext
        
        var categories = [Category]()
        
        let fetchRequest = NSFetchRequest<Category>(entityName: "Category")
        let sort = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
        do {
            categories = try context.fetch(fetchRequest)
        } catch {
            print(error)
        }
        return categories
        
    }
    
    static func fetchPersonsByCategory(category: Category) throws -> [Person] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { throw CoreDataErrors.contextNotFound }
        let context = appDelegate.persistentContainer.viewContext
        
        var persons = [Person]()
        
        
        let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
        let sort = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        let predicate = NSPredicate(format: "category = %@", category)
        fetchRequest.predicate = predicate
        do {
            persons = try context.fetch(fetchRequest)
        } catch {
            print(error)
        }
        return persons
        
    }
    
}

//MARK: - Categories
extension CoreDataManager {
    
    static func createCategory(name: String) throws -> Category {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { throw CoreDataErrors.contextNotFound }
        let context = appDelegate.persistentContainer.viewContext
        
        let newCategory = Category(context: context)
        newCategory.name = name
        newCategory.isOpened = true
        
        let categories = try fetchCategories()
        newCategory.id = (categories.last?.id ?? 0) + 1
        do {
            try context.save()
        } catch {
            print(error)
        }
        return newCategory
        
    }
    
    static func deleteCategory(section: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        guard var categories = try? CoreDataManager.fetchCategories() else { return }
        
        //categories[section].pers
        updateSectionId(section: section, context: context, categories: &categories)
        
        context.delete(categories[section])
        do {
            try context.save()
        } catch {
            print(error)
        }
        
        //DELETE
        print("\nARR:")
        for item in categories {
            print(item.id)
        }
        
    }
    
}

//MARK: - Persons
extension CoreDataManager {
    
    static func createPerson(name: String, section: Int) throws -> Person {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { throw CoreDataErrors.contextNotFound }
        let context = appDelegate.persistentContainer.viewContext
        guard let categories = try? CoreDataManager.fetchCategories() else { throw CoreDataErrors.contextNotFound  }
        let newPerson = Person(context: context)
        newPerson.name = name
        newPerson.id = Int64((categories[section].persons?.count ?? 0) + 1)
        categories[section].addToPersons(newPerson)
        do {
            try context.save()
        } catch {
            print(error)
        }
        return newPerson
        
    }
    
    static func deletePerson(indexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        guard let categories = try? CoreDataManager.fetchCategories() else { return }
        guard var persons = try? CoreDataManager.fetchPersonsByCategory(category: categories[indexPath.section]) else { return }

        updatePersonId(context: context, section: indexPath.section, row: indexPath.row, update: .deletePerson, persons: &persons)
        context.delete(persons[indexPath.row])
        do {
            try context.save()
        } catch {
            print(error)
        }
        
        //DELETE
        print("\nARRPersons:")
        for item in persons {
            print(item.id)
        }
    }
    
    static func movePerson(sourceIndexPath: IndexPath, destinationIndexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        
        let ss = sourceIndexPath.section
        let sr = sourceIndexPath.row
        let ds = destinationIndexPath.section
        let dr = destinationIndexPath.row
        
        guard let categories = try? CoreDataManager.fetchCategories() else { return }
        guard let persons = try? CoreDataManager.fetchPersonsByCategory(category: categories[sourceIndexPath.section]) else { return }
        
        if ss != ds {
            guard let sourceCell = CoreData.shared.categoryArray[ss].personsArray?[sr] else { return }
           // updateId(section: ds, row: dr, update: .changeSection)
            sourceCell.id = Int64(dr) + 1
            CoreData.shared.categoryArray[ds].addToPersons(sourceCell)
        } else {
            guard let sourceCell = CoreData.shared.categoryArray[ss].personsArray?[sr] else { return }
            guard let destCell = CoreData.shared.categoryArray[ds].personsArray?[dr] else { return }
            let sourcId = sourceCell.id
            sourceCell.id = destCell.id
            destCell.id = sourcId
            CoreData.updateModelWithPersons()
        }
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    //MARK: - updateId methods
    //MARK: - updateId methods
    //MARK: - updateId methods
    static private func updatePersonId(context: NSManagedObjectContext, section: Int, row: Int, update: UpdateSetup, persons: inout [Person]) {
        var id: Int64 = 1
        
        switch update {
        case .deletePerson: id = -1
        case .changeSection: id = 1
        }
        
        for person in persons {
            if person.id > row {
                person.id += id
            }
        }
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
}

//MARK: - Private methods
extension CoreDataManager {
    
    static private func updateSectionId(section: Int, context: NSManagedObjectContext, categories: inout [Category]) {
        for category in categories {
            if category.id > section {
                category.id -= 1
            }
        }
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    static private func fetchCategoryById(id: Int64) throws -> Category {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { throw CoreDataErrors.contextNotFound }
        let context = appDelegate.persistentContainer.viewContext
        
        var category = Category()
        
        let fetchRequest = NSFetchRequest<Category>(entityName: "Category")
        let predicate = NSPredicate(format: "id = %@", id)
        fetchRequest.predicate = predicate
        
        do {
            if let fechedCategory = try context.fetch(fetchRequest).first {
                category = fechedCategory
            }
        } catch {
            print(error)
        }
        
        return category
        
    }
    
}
