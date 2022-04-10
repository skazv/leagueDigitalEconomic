//
//  Person+CoreDataClass.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 01.04.2022.
//
//

import Foundation
import CoreData

@objc(Person)
public class Person: NSManagedObject {
    
    static func createPerson(name: String, category: Category, imageUrl: String) -> Person {
        let newPerson = Person(context: CoreData.shared.context)
        newPerson.name = name
        newPerson.imageUrl = imageUrl
        var id: Int64 = 0
        if let count = category.persons?.count {
            id = Int64(count)
        }
        newPerson.id = id + 1
        category.addToPersons(newPerson)
        do {
            try CoreData.shared.context.save()
        } catch {
            print(error)
        }
        CoreData.fetchAllCategories()
        return newPerson
    }
    
    static func updatePersonUrl(person: Person, imageUrl: String) {
        person.imageUrl = imageUrl
        do {
            try CoreData.shared.context.save()
        } catch {
            print(error)
        }
        //CoreData.fetchAllCategories()
        CoreData.updateModelWithPersons()
    }
    
    static func deletePerson(section: Int, row: Int) {
        let category = CoreData.shared.categoryArray[section]
        updateId(section: section, row: row, update: .deletePerson)
        if let person = category.personsArray?[row] {
            category.removeFromPersons(person)
            CoreData.shared.context.delete(person)
            
            do {
                try CoreData.shared.context.save()
            } catch {
                print(error)
            }
            CoreData.updateModelWithPersons()
        }
    }
    
    static func updatePerson(person: Person, id: Int64) {
        person.id = id
        do {
            try CoreData.shared.context.save()
        } catch {
            print(error)
        }
        CoreData.fetchAllCategories()
        CoreData.updateModelWithPersons()
    }
    
    static func movePerson(sourceIndexPath: IndexPath, destinationIndexPath: IndexPath) {
        let ss = sourceIndexPath.section
        let sr = sourceIndexPath.row
        let ds = destinationIndexPath.section
        let dr = destinationIndexPath.row
        
        if ss != ds {
            guard let sourceCell = CoreData.shared.categoryArray[ss].personsArray?[sr] else { return }
            updateId(section: ds, row: dr, update: .changeSection)
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
            try CoreData.shared.context.save()
        } catch {
            print(error)
        }
        CoreData.fetchAllCategories()
        CoreData.updateModelWithPersons()
    }

}

enum UpdateSetup: String {
    case deletePerson
    case changeSection
}

//MARK: - Private methods
extension Person {
    static private func updateId(section: Int, row: Int, update: UpdateSetup) {
        var id: Int64 = 1
        
        switch update {
        case .deletePerson: id = -1
        case .changeSection: id = 1
        }
        
        if let personArr = CoreData.shared.categoryArray[section].personsArray {
            for person in personArr {
                if person.id > row {
                    person.id += id
                }
            }
            do {
                try CoreData.shared.context.save()
            } catch {
                print(error)
            }
            CoreData.fetchAllCategories()
        }
    }
    
}
