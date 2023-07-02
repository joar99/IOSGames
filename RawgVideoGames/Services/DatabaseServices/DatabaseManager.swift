//
//  DatabaseManager.swift
//  RawgVideoGames
//
//  Created by Jonas on 02/07/2023.
//

import Foundation
import SQLite

class DatabaseManager {
    
    private var db: Connection!
    private let gamesTable = Table("games")
    
    private let id = Expression<Int>("id")
    private let name = Expression<String>("name")
    private let released = Expression<String?>("released")
    private let background_image = Expression<String?>("background_image")
    private let rating = Expression<Double?>("rating")
    private let ratings_count = Expression<Int?>("ratings_count")
    
    static let shared = DatabaseManager()
    
    private init() {
            let path = NSSearchPathForDirectoriesInDomains(
                .documentDirectory, .userDomainMask, true
            ).first!
            
            do {
                db = try Connection("\(path)/db.sqlite3")
            } catch {
                print(error.localizedDescription)
            }
            
            do {
                try db.run(gamesTable.create(ifNotExists: true) { t in
                    t.column(id, primaryKey: true)
                    t.column(name)
                    t.column(released)
                    t.column(background_image)
                    t.column(rating)
                    t.column(ratings_count)
                })
            } catch {
                print(error.localizedDescription)
            }
        }
    
    func getDatabase() -> Connection {
            return db
        }
    
    func saveGame(_ game: Game) {
            do {
                try db.run(gamesTable.insert(or: .replace,
                    id <- game.id,
                    name <- game.name,
                    released <- game.released,
                    background_image <- game.background_image,
                    rating <- game.rating,
                    ratings_count <- game.ratings_count
                ))
            } catch {
                print(error.localizedDescription)
            }
        }
    
    func fetchAllGames() -> [Game] {
        
        var favoriteGames: [Game] = []
        
        do {
                let rows = try db.prepare(gamesTable)
                for row in rows {
                    let game = Game(
                        id: row[id],
                        name: row[name],
                        released: row[released],
                        background_image: row[background_image],
                        rating: row[rating],
                        ratings_count: row[ratings_count]
                    )
                    favoriteGames.append(game)
                }
            } catch {
                print(error.localizedDescription)
            }
        return favoriteGames
        
    }
}
