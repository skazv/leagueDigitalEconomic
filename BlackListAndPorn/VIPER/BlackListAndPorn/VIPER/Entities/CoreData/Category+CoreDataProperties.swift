//
//  Category+CoreDataProperties.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 01.04.2022.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var color: String?
    @NSManaged public var name: String?
    @NSManaged public var isOpened: Bool
    @NSManaged public var id: Int64
    @NSManaged public var persons: NSSet?

}

// MARK: Generated accessors for persons
extension Category {

    @objc(addPersonsObject:)
    @NSManaged public func addToPersons(_ value: Person)

    @objc(removePersonsObject:)
    @NSManaged public func removeFromPersons(_ value: Person)

    @objc(addPersons:)
    @NSManaged public func addToPersons(_ values: NSSet)

    @objc(removePersons:)
    @NSManaged public func removeFromPersons(_ values: NSSet)

}

extension Category : Identifiable {

}
