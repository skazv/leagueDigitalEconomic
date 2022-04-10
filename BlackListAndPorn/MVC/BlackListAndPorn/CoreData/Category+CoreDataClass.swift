//
//  Category+CoreDataClass.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 01.04.2022.
//
//

import Foundation
import CoreData

@objc(Category)
public class Category: NSManagedObject {
    var personsArray: [Person]?
    
    static func createCategory(name: String) {
        let newCategory = Category(context: CoreData.shared.context)
        newCategory.isOpened = true
        newCategory.name = name
        newCategory.id = (CoreData.shared.categoryArray.last?.id ?? 0) + 1
        do {
            try CoreData.shared.context.save()
        } catch {
            print(error)
        }
        CoreData.fetchAllCategories()
    }
    
    static func deleteCategory(section: Int) {
        let category = CoreData.shared.categoryArray[section]
        updateId(section: section)
        Category.removeAllPersons(category: category)
        CoreData.shared.context.delete(category)
        CoreData.shared.categoryArray.remove(at: section)
        do {
            try CoreData.shared.context.save()
        } catch {
            print(error)
        }
        CoreData.fetchAllCategories()
    }
    
    static func moveCategory(section: Int) {
        CoreData.shared.categoryArray[section].id += 1
        CoreData.shared.categoryArray[section + 1].id -= 1
        CoreData.shared.categoryArray.remove(at: section)
        CoreData.shared.categoryArray.insert(CoreData.shared.categoryArray[section], at: section + 1)
        do {
            try CoreData.shared.context.save()
        } catch {
            print(error)
        }
        CoreData.fetchAllCategories()
        CoreData.updateModelWithPersons()
    }
    
    static func updateCategory(category: Category, name: String) {
        category.name = name
        do {
            try CoreData.shared.context.save()
        } catch {
            print(error)
        }
        CoreData.fetchAllCategories()
    }
    
}

//MARK: - Private methods
extension Category {
    static private func updateId(section: Int) {
        for category in CoreData.shared.categoryArray {
            if category.id > section {
                category.id -= 1
            }
        }
        do {
            try CoreData.shared.context.save()
        } catch {
            print(error)
        }
        CoreData.fetchAllCategories()
    }
    
    static private func removeAllPersons(category: Category) {
        if let persons = category.personsArray {
            for person in persons {
                Person.deletePerson(section: Int(category.id), row: Int(person.id - 1))
            }
        }
    }
    
}
