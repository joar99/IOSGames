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
    
    public init() {
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
    
    func removeGame(withID id: Int) {
        
        let game = gamesTable.filter(self.id == id)
        
        do {
            try db.run(game.delete())
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
    
    func fetchGame(withID id: Int) -> Game? {
        let game = gamesTable.filter(self.id == id)

        do {
            if let row = try db.pluck(game) {
                return Game(
                    id: row[self.id],
                    name: row[name],
                    released: row[released],
                    background_image: row[background_image],
                    rating: row[rating],
                    ratings_count: row[ratings_count]
                )
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }

    func gameExists(withID id: Int) -> Bool {
        
        let game = gamesTable.filter(self.id == id)
        
        do {
            let count = try db.scalar(game.count)
            return count > 0
        } catch {
            print(error.localizedDescription)
            return false
        }
        
    }
    
    //PLEASE NOTE: The code written here is used for Unit Testing purposes with the mock database
    //GETTERS FOR UNIT TESTING PURPOSES AND MOCK DATABASE
    
    func getId() -> Expression<Int> {
        return id
    }
        
    func getName() -> Expression<String> {
        return name
    }
        
    func getReleased() -> Expression<String?> {
        return released
    }
        
    func getBackgroundImage() -> Expression<String?> {
        return background_image
    }
        
    func getRating() -> Expression<Double?> {
        return rating
    }
        
    func getRatingsCount() -> Expression<Int?> {
        return ratings_count
    }
    
    func getGamesTable() -> Table {
            return gamesTable
        }
    
    func setConnection(_ connection: Connection) {
        db = connection
    }
}
