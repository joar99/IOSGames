//
//  GameViewModel.swift
//  RawgVideoGames
//
//  Created by Jonas on 27/06/2023.
//

import Foundation

class GameViewModel: ObservableObject {
    
    @Published var nextURL: String? = "https://api.rawg.io/api/games?key=7bbbada8de52433a9e42723388e8b802"
    
    @Published var games: [Game] = []

    func fetchGames() {
        let url = URL(string: nextURL ?? "")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {

                let decoder = JSONDecoder()
                do {
                    let gameList = try decoder.decode(GameList.self, from: data)
                    DispatchQueue.main.async {
                        self.games.append(contentsOf: gameList.results)
                        self.nextURL = gameList.next
                    }
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }

        task.resume()
        
    }
    
    func isLastGame(_ game: Game) -> Bool {
        
        guard let lastGame = games.last else {
            return false
        }
        return lastGame.id == game.id
    }
    
    func fetchGame(with query: String) {
        let url = URL(string: "https://api.rawg.io/api/games/\(query)?key=7bbbada8de52433a9e42723388e8b802")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let game = try decoder.decode(Game.self, from: data)
                    DispatchQueue.main.async {
                        self.games.removeAll()
                        self.games.append(game)
                    }
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
        
    }
    
    func resetList() {
        
        self.games.removeAll()
        
    }


    
}
