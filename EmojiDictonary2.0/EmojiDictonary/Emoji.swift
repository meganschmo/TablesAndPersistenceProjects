//
//  Emoji.swift
//  EmojiDictonary
//
//  Created by Megan Schmoyer on 10/13/23.
//

import Foundation

struct Emoji: Codable {
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    
    static func saveToDisc() {
        if let dataToWriteToFileURL = try? encoder.encode(emojis) {
            try? dataToWriteToFileURL.write(to: archiveURL, options: .noFileProtection)
        }
    }
    
    static func loadFromDisc() {
        if let emojisJsonData = try? Data(contentsOf: archiveURL),
            let decodedEmojis = try? decoder.decode([Emoji].self, from: emojisJsonData) {
            emojis = decodedEmojis
        } else {
            print("Your emojis really suck")
        }
    }
}
    
    var encoder = JSONEncoder()
    var decoder = JSONDecoder()
    var documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    var archiveURL = documentsDirectory.appendingPathComponent("emoji_data").appendingPathExtension("json")
    

var emojis = [Emoji]() {
    didSet {
        Emoji.saveToDisc()
    }
}
