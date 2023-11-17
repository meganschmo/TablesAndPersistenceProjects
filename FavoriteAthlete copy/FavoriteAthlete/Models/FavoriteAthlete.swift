//
//  FavoriteAthlete.swift
//  FavoriteAthlete
//
//  Created by Megan Schmoyer on 10/11/23.
//

import Foundation

struct Athlete {
    let name: String
    let age: String
    let league: String
    let team: String
    
    var description: String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)"
    }
}
