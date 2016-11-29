//
//  TagItem+CoreDataProperties.swift
//  CardEditor
//
//  Created by Christian Guenther on 01.11.16.
//  Copyright © 2016 Christian Guenther. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension TagItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TagItem> {
        return NSFetchRequest<TagItem>(entityName: "TagItem");
    }

    @NSManaged public var tagText: String?
    @NSManaged public var uuid: String?
    @NSManaged public var card: NSSet?

}

// MARK: Generated accessors for card
extension TagItem {

    @objc(addCardObject:)
    @NSManaged public func addToCard(_ value: CardItem)

    @objc(removeCardObject:)
    @NSManaged public func removeFromCard(_ value: CardItem)

    @objc(addCard:)
    @NSManaged public func addToCard(_ values: NSSet)

    @objc(removeCard:)
    @NSManaged public func removeFromCard(_ values: NSSet)

}
