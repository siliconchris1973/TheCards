//
//  CardItem+CoreDataProperties.swift
//  CardEditor
//
//  Created by Christian Guenther on 01.11.16.
//  Copyright © 2016 Christian Guenther. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension CardItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CardItem> {
		print("Fetch request for CardItem initiated")
        return NSFetchRequest<CardItem>(entityName: "CardItem");
    }

    @NSManaged public var answerText: String?
    @NSManaged public var cardNumber: Int16
    @NSManaged public var correctAnswers: Int16
    @NSManaged public var hintText: String?
    @NSManaged public var lastAsked: NSDate?
    @NSManaged public var questionText: String?
    @NSManaged public var unsureAnswers: Int16
    @NSManaged public var uuid: String?
    @NSManaged public var wrongAnswers: Int16
    @NSManaged public var chapter: ChapterItem?
    @NSManaged public var deck: NSSet?
    @NSManaged public var link: NSSet?
    @NSManaged public var tag: NSSet?

}

// MARK: Generated accessors for deck
extension CardItem {

    @objc(addDeckObject:)
    @NSManaged public func addToDeck(_ value: DeckItem)

    @objc(removeDeckObject:)
    @NSManaged public func removeFromDeck(_ value: DeckItem)

    @objc(addDeck:)
    @NSManaged public func addToDeck(_ values: NSSet)

    @objc(removeDeck:)
    @NSManaged public func removeFromDeck(_ values: NSSet)

}

// MARK: Generated accessors for link
extension CardItem {

    @objc(addLinkObject:)
    @NSManaged public func addToLink(_ value: LinkItem)

    @objc(removeLinkObject:)
    @NSManaged public func removeFromLink(_ value: LinkItem)

    @objc(addLink:)
    @NSManaged public func addToLink(_ values: NSSet)

    @objc(removeLink:)
    @NSManaged public func removeFromLink(_ values: NSSet)

}

// MARK: Generated accessors for tag
extension CardItem {

    @objc(addTagObject:)
    @NSManaged public func addToTag(_ value: TagItem)

    @objc(removeTagObject:)
    @NSManaged public func removeFromTag(_ value: TagItem)

    @objc(addTag:)
    @NSManaged public func addToTag(_ values: NSSet)

    @objc(removeTag:)
    @NSManaged public func removeFromTag(_ values: NSSet)

}
