//
//  MockDatabaseManager.swift
//  RawgVideoGames
//
//  Created by Jonas on 16/07/2023.
//

import Foundation
import SQLite

class MockDatabaseManager: DatabaseManager {
    
    
    override init() {
        super.init()
        
        do {
            let memoryConnection = try Connection(.inMemory)
            setConnection(memoryConnection)
            print("Database created successfully.")
        } catch {
            print(error.localizedDescription)
        }
        
        do {
            try getDatabase().run(getGamesTable().create(ifNotExists: true) { t in
                t.column(getId(), primaryKey: true)
                t.column(getName())
                t.column(getReleased())
                t.column(getBackgroundImage())
                t.column(getRating())
                t.column(getRatingsCount())
            })
            print("Table created successfully.")
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
