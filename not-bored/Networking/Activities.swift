//
//  Activities.swift
//  not-bored
//
//  Created by Flavio Andres Gomez on 03/01/2022.
//

import Foundation

struct Activities: Codable {
    let activity: String
    let accessibility: Double
    let type: String
    let participants: Int
    let price: Double
    let link: String
    let key: String
}

struct ActivitesError: Codable {
    let error: String 
}
