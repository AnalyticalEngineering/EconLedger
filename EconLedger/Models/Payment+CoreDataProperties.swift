//
//  Payment+CoreDataProperties.swift
//  EconLedger
//
//  Created by J. DeWeese on 11/28/23.
//
//

import Foundation
import CoreData


extension Payment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Payment> {
        return NSFetchRequest<Payment>(entityName: "Payment")
    }

    @NSManaged public var amount: Double
    @NSManaged public var title: String?
    @NSManaged public var reminderDate: Date?
    @NSManaged public var reminderTime: Date?
    @NSManaged public var note: String?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var id: String?
    @NSManaged public var budget: Budget?

    public var wrappedDate: Date {
        reminderDate ?? Date( )
    }
}

extension Payment : Identifiable {

}
