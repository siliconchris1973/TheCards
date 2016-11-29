//
//  ChapterItem+CoreDataProperties.swift
//  CardEditor
//
//  Created by Christian Guenther on 01.11.16.
//  Copyright © 2016 Christian Guenther. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension ChapterItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ChapterItem> {
        return NSFetchRequest<ChapterItem>(entityName: "ChapterItem");
    }

    @NSManaged public var chapterName: String?
    @NSManaged public var chapterNumber: Int16
    @NSManaged public var uuid: String?
    @NSManaged public var card: NSSet?

}

// MARK: Generated accessors for card
extension ChapterItem {

    @objc(addCardObject:)
    @NSManaged public func addToCard(_ value: CardItem)

    @objc(removeCardObject:)
    @NSManaged public func removeFromCard(_ value: CardItem)

    @objc(addCard:)
    @NSManaged public func addToCard(_ values: NSSet)

    @objc(removeCard:)
    @NSManaged public func removeFromCard(_ values: NSSet)

}
