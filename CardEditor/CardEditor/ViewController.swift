//
//  ViewController.swift
//  CardEditor
//
//  Created by Christian Guenther on 30.10.16.
//  Copyright © 2016 Christian Guenther. All rights reserved.
//

import Cocoa


class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

	@IBOutlet weak var CreateCard: NSButton!
	@IBOutlet weak var EndButton: NSButton!

	@IBOutlet weak var CardOverviewTable: NSTableView!
	
	@IBOutlet weak var ChapterTextField: NSTextField!
	@IBOutlet weak var CardTextField: NSTextField!
	@IBOutlet weak var QuestionTextField: NSTextField!
	@IBOutlet weak var AnswerTextField: NSTextField!
	@IBOutlet weak var HintTextField: NSTextField!
	@IBOutlet weak var TagsTextField: NSTextField!
	@IBOutlet weak var LinkTextField: NSTextField!
	

	// Retreive the managedObjectContext from AppDelegate
	let managedObjectContext = (NSApplication.shared().delegate as! AppDelegate).managedObjectContext

	// an array to hold the data
	var data = [NSManagedObject]()
	// a selected item
	var selectedCard : NSManagedObject?
	var managedContext : NSManagedObjectContext?

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.

		// Print it to the console
		print(managedObjectContext)
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}

	func fetchDataAndRefreshTable() {
		// create a fetch request that retrieves all items from the "Item" entity
		let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CardItem")
		do {
			// retrieve the data
			data = try managedContext!.fetch(fetchRequest) as! [NSManagedObject]
			// reload the table
			CardOverviewTable.reloadData()
		} catch {
			Swift.print(error)
		}
	}

	func blankOutField(field : NSTextField) {
		field.stringValue = ""
	}

	func blankOutFields() {
		/*
		blankOutField(field: ChapterTextField)
		blankOutField(field: CardTextField)
		blankOutField(field: QuestionTextField)
		blankOutField(field: AnswerTextField)
		blankOutField(field: HintTextField)
		blankOutField(field: TagsTextField)
		blankOutField(field: LinkTextField)
		*/
	}
}

