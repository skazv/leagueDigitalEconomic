//
//  CoreDataManager.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 26.03.2022.
//

import CoreData
import UIKit

struct CoreData {
    static var shared: CoreData = {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        let coreDataManager = CoreData(context: context)
        return coreDataManager
    }()
    let context: NSManagedObjectContext
    var categoryArray = [Category]()
    
    //MARK: - Вытащить все категории
    static func fetchAllCategories() {
        let fetchRequest = NSFetchRequest<Category>(entityName: "Category")
        let sort = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
        do {
            CoreData.shared.categoryArray = try CoreData.shared.context.fetch(fetchRequest)
        } catch {
            print(error)
        }
        
        do {
            try CoreData.shared.context.save()
        } catch {
            print(error)
        }
    }

    //MARK: - Вытащить людей по категории
    static func fetchPersonsByCategory(category: Category){
        let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
        let sort = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sort]
        let predicate = NSPredicate(format: "category = %@", category)
        fetchRequest.predicate = predicate
        do {
            category.personsArray = try CoreData.shared.context.fetch(fetchRequest)
        } catch {
            print(error)
        }
        do {
            try CoreData.shared.context.save()
        } catch {
            print(error)
        }
    }

    //MARK: - Положить людей по категории в массив
    static func updateModelWithPersons() {
        for item in CoreData.shared.categoryArray {
            fetchPersonsByCategory(category: item)
        }
        
    }
}
