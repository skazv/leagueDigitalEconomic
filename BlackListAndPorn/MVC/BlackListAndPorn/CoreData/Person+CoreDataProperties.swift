//
//  Person+CoreDataProperties.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 01.04.2022.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var hateLvl: Int16
    @NSManaged public var imageUrl: String?
    @NSManaged public var name: String?
    @NSManaged public var id: Int64
    @NSManaged public var category: Category

}

extension Person : Identifiable {

}
