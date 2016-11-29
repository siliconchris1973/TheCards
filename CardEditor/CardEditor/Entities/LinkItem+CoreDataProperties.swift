//
//  LinkItem+CoreDataProperties.swift
//  CardEditor
//
//  Created by Christian Guenther on 01.11.16.
//  Copyright © 2016 Christian Guenther. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension LinkItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LinkItem> {
        return NSFetchRequest<LinkItem>(entityName: "LinkItem");
    }

    @NSManaged public var linkName: String?
    @NSManaged public var linkUrl: String?
    @NSManaged public var uuid: String?
    @NSManaged public var card: NSSet?

}

// MARK: Generated accessors for card
extension LinkItem {

    @objc(addCardObject:)
    @NSManaged public func addToCard(_ value: CardItem)

    @objc(removeCardObject:)
    @NSManaged public func removeFromCard(_ value: CardItem)

    @objc(addCard:)
    @NSManaged public func addToCard(_ values: NSSet)

    @objc(removeCard:)
    @NSManaged public func removeFromCard(_ values: NSSet)

}
