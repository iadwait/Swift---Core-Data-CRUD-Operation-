//
//  Student+CoreDataProperties.swift
//  Core Data
//
//  Created by Adwait Barkale on 18/08/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var city: String?
    @NSManaged public var mobile: String?

}
