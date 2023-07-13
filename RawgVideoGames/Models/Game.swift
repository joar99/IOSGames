//
//  Game.swift
//  RawgVideoGames
//
//  Created by Jonas on 27/06/2023.
//

import Foundation

struct Game: Codable, Identifiable, Hashable {
    
    var id: Int
    var name: String
    var released: String?
    var background_image: String?
    var rating: Double?
    var ratings_count: Int?
    
}

struct GameList: Codable {
    
    var count: Int
    var next: String?
    var previous: String?
    var results: [Game]
    
}
