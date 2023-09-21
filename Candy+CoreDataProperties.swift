//
//  Candy+CoreDataProperties.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 21.09.2023.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String {
        name ?? "Unknown candy"
    }
}

extension Candy : Identifiable {

}
