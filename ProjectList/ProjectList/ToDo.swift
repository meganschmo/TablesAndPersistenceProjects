//
//  ToDo.swift
//  ProjectList
//
//  Created by Megan Schmoyer on 11/6/23.
//

import Foundation

struct ToDo: Equatable, Codable {
    var id = UUID()
    var title: String
    var wasEaten: Bool
    var expirationDate: Date
    var notes: String?
    
    init(title: String, wasEaten: Bool, expirationDate: Date, notes: String? = nil) {
        self.id = UUID()
        self.title = title
        self.wasEaten = wasEaten
        self.expirationDate = expirationDate
        self.notes = notes
    }
    static let documentsDirectory =
       FileManager.default.urls(for: .documentDirectory,
       in: .userDomainMask).first!
    static let archiveURL =
       documentsDirectory.appendingPathComponent("toDos")
       .appendingPathExtension("plist")
 

        static func ==(lhs: ToDo, rhs: ToDo) -> Bool {
            return lhs.id == rhs.id
        }
        static func loadToDos() -> [ToDo]? {
                guard let codedToDos = try? Data(contentsOf: archiveURL) else
                   {return nil}
                let propertyListDecoder = PropertyListDecoder()
                return try? propertyListDecoder.decode(Array<ToDo>.self,
                   from: codedToDos)
            }
        static func loadSampleToDos() -> [ToDo] {
            let toDo1 = ToDo(title: "Eggs", wasEaten: true, expirationDate: Date(), notes: "In the fridge")
            let toDo2 = ToDo(title: "Bread", wasEaten: false, expirationDate: Date(), notes: "In the pantry")
            let toDo3 = ToDo(title: "Milk", wasEaten: false, expirationDate: Date(), notes: "In the fridge")
            
            return [toDo1, toDo2, toDo3]
        }
    static func saveToDos(_ toDos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(toDos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
        
    }
  

