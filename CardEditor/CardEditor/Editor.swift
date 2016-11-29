//
//  Editor.swift
//  CardEditor
//
//  Created by Christian Guenther on 30.10.16.
//  Copyright © 2016 Christian Guenther. All rights reserved.
//

import Foundation
import Cocoa
import CoreData

extension String : Collection {}

class Editor: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

	/*
	{
	"UUID": "11241BB9-FF51-46B1-8FA4-3AB6E01A90AF",
	"Chapter": "4",
	"Card": "9",
	"Complete": "false",
	"Asked": "0",
	"Answered": "0",
	"CorrectAnswers": "0",
	"LastAsked": "30.10.2016 18:19:00",
	"Data": {
		"Question": "Was kennzeichnet nach ICD-10 die Manie mit psychotischen Symptomen?",
		"Hint": "Hat was mit Wahn zu tun"
		"Answer": "Hierbei treten zu dem klinischen Bild der Manie zusätzlich Halluzinationen oder Wahn auf",
		"Tags": ["Manie", "ICD-10", "Wahn"],
		"Picture": "wohlbeklopptwa.png",
		"Links": [
			{"Youtube": "https://www.youtube.com/"},
			{"Webseite": "http://ihrseidjaalleirre.de"}
		]
		}
	}
	*/
	struct CardStructure {
		var UUID: NSUUID = NSUUID.init()
		var Chapter: Int = 0
		var Card: Int = 0
		var CorrectAnswers: Int = 0
		var WrongAnswers: Int = 0
		var Unknown: Int = 0
		var LastAsked: String = ""
		var Question: String = ""
		var Answer: String = ""
		var Hint: String = ""
		var Tags: [String] = []
		var Links: [String] = []
		var Picture: String = ""
	}

	@IBOutlet weak var ChapterNumber: NSTextField!
	@IBOutlet weak var CardNumber: NSTextField!
	@IBOutlet weak var CorrectAnswers: NSTextField!
	@IBOutlet weak var WrongAnswers: NSTextField!
	@IBOutlet weak var UnsureAnswers: NSTextField!
	@IBOutlet weak var QuestionText: NSTextField!
	@IBOutlet weak var AnswerText: NSTextField!
	@IBOutlet weak var Hint: NSTextField!
	@IBOutlet weak var Tags: NSTextField!
	@IBOutlet weak var URLs: NSTextField!
	@IBOutlet weak var Image: NSImageView!
	@IBOutlet weak var SaveButton: NSButton!
	@IBOutlet weak var CancelButton: NSButton!

	// This checks whether or not the user asked to have a new, blank entry window after saving
	// the value is indicated by the checkbox button on the view and worked on via bool var
	var isCreateNewOnSave = true
	@IBOutlet weak var CreateNewOnSave: NSButton!
	@IBAction func ChangeCreateNewOnSave(_ sender: Any) {
		if CreateNewOnSave.state == 1 {
			isCreateNewOnSave = true
		} else {
			isCreateNewOnSave = false
		}
	}

	// initialize a new card structure
	var card = CardStructure()


	override func viewDidLoad() {
		super.viewDidLoad()

		//self.Tags.addTarget(self, action: Selector("checkTags:"), forControlEvents: UIControlEvents.EditingChanged)

		// Check initial state of SaveOnClose Switch button - enabled (checked) or disable (not checked)
		if isCreateNewOnSave {
			CreateNewOnSave.state = 1
		} else {
			CreateNewOnSave.state = 0
		}


	}

	override var representedObject: Any? {
		didSet {
			// Update the view, if already loaded.
		}
	}


	//MARK: object mapping function
	@IBAction func Save(_ sender: Any) {

		// first we need to check, if the user entered data - there is no point in saving, if there is no content
		if QuestionText.stringValue == "" || AnswerText.stringValue == "" ||
			ChapterNumber.intValue == 0 ||
			CardNumber.intValue == 0 {

			print("Q&A and card + chapter number must not be empty")
		} else {

			card.UUID = NSUUID.init()
			card.Chapter = Int(ChapterNumber.intValue)
			card.Card = Int(CardNumber.intValue)
			card.Question = QuestionText.stringValue
			card.Answer = AnswerText.stringValue
			card.Hint = Hint.stringValue
			let tagtext = Tags.stringValue
			let parts = tagtext.components(separatedBy: " ")
			for ele:String in parts {
				card.Tags.append(ele)
			}
			let urls = URLs.stringValue
			let urlparts = urls.components(separatedBy: " ")
			for ele:String in urlparts {
				//let urlele = URL(string: ele)
				card.Links.append(ele)
			}

			print("Card looks like this: ")
			print("UUID: \(card.UUID)")
			print("Chapter-No: \(card.Chapter)")
			print("Card-No: \(card.Chapter)")
			print("Question: \(card.Question)")
			print("Answer: \(card.Answer)")
			print("Hint: \(card.Hint)")
			print("Tags: \(card.Tags)")
			print("Urls: \(card.Links)")


			if isCreateNewOnSave {
				//self.view.window?.close()
				self.view.window?.display()
			} else {
				// maybe we'll do something else here
			}
		}
	}
	@IBAction func Cancel(_ sender: Any) {
		self.view.window?.close()
	}
}
