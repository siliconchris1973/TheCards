//
//  FileHandling.swift
//  CardEditor
//
//  Created by Christian Guenther on 30.10.16.
//  Copyright © 2016 Christian Guenther. All rights reserved.
//

import Foundation

class FileSaveHelper {
	// MARK:- Error Types
	private enum FileErrors:Error {
		case JsonNotSerialized
		case FileNotSaved
	}

	// MARK:- File Extension Types
	enum FileExension:String {
		case TXT = ".txt"
		case JPG = ".jpg"
		case PNG = ".png"
		case JSON = ".json"
	}

	// MARK:- Private Properties
	private let directory:FileManager.SearchPathDirectory
	private let directoryPath: String
	private let fileManager = FileManager.default
	private let fileName:String
	private let filePath:String
	private let fullyQualifiedPath:String
	private let subDirectory:String

	var fileExists:Bool {
		get {
			return fileManager.fileExists(atPath: fullyQualifiedPath)
		}
	}

	var directoryExists:Bool {
		get {
			var isDir = ObjCBool(true)
			return fileManager.fileExists(atPath: filePath, isDirectory: &isDir )
		}
	}


	init(fileName:String, fileExtension:FileExension, subDirectory:String, directory:FileManager.SearchPathDirectory){
		self.fileName = fileName + fileExtension.rawValue
		self.subDirectory = "/\(subDirectory)"
		self.directory = directory

		self.directoryPath = NSSearchPathForDirectoriesInDomains(directory, .userDomainMask, true)[0]
		self.filePath = directoryPath + self.subDirectory
		self.fullyQualifiedPath = "\(filePath)/\(self.fileName)"

		print(self.directoryPath)
	}

	private func createDirectory(){
		if !directoryExists {
			do {
				try fileManager.createDirectory(atPath: filePath, withIntermediateDirectories: false, attributes: nil)
			}
			catch {
				print("An Error was generated creating directory")
			}
		}
	}

	func saveFile(string fileContents:String) throws{
		do {
			try fileContents.write(toFile: fullyQualifiedPath, atomically: true, encoding: String.Encoding.utf8)
		}
		catch  {
			throw error
		}
	}

	func saveFile(dataForJson:AnyObject) throws{
		do {
			let jsonData = try convertObjectToData(data: dataForJson)
			if !fileManager.createFile(atPath: fullyQualifiedPath, contents: jsonData as Data, attributes: nil){
				throw FileErrors.FileNotSaved
			}
		} catch {
			print(error)
			throw FileErrors.FileNotSaved
		}
	}

	private func convertObjectToData(data:AnyObject) throws -> NSData {
		do {
			let newData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
			return newData as NSData
		}
		catch {
			print("Error writing data: \(error)")
		}
		throw FileErrors.JsonNotSerialized
	}
}
