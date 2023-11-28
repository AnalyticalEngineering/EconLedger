//
//  Budget+CoreDataProperties.swift
//  EconLedger
//
//  Created by J. DeWeese on 11/28/23.
//
//

import Foundation
import CoreData
import UIKit

extension Budget {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Budget> {
        return NSFetchRequest<Budget>(entityName: "EconLedger")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var name: String?
    @NSManaged public var color: UIColor
    @NSManaged public var icon: String?
    @NSManaged public var totalAmount: Double
    @NSManaged public var id: String?
    @NSManaged public var payments: NSSet?

    public var wrappedName: String {
        name ?? "Unknown"
    }
    
    public var paymentArray: [Payment]  {
        let set = payments as? Set<Payment> ?? []
        
        return set.sorted {
            $0.wrappedDate < $1.wrappedDate
        }
    }
}

// MARK: Generated accessors for payments
extension Budget {

    @objc(addPaymentsObject:)
    @NSManaged public func addToPayments(_ value: Payment)

    @objc(removePaymentsObject:)
    @NSManaged public func removeFromPayments(_ value: Payment)

    @objc(addPayments:)
    @NSManaged public func addToPayments(_ values: NSSet)

    @objc(removePayments:)
    @NSManaged public func removeFromPayments(_ values: NSSet)

}

extension Budget : Identifiable {

}
