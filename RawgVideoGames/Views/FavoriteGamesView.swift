//
//  FavoriteGamesView.swift
//  RawgVideoGames
//
//  Created by Jonas on 02/07/2023.
//

import SwiftUI

struct FavoriteGamesView: View {
    
    let dbManager = DatabaseManager.shared
    
    @State var games: [Game] = []
    
    var body: some View {

            List(games) { game in

                HStack {

                    if let imageUrl = game.background_image {
                        AsyncImage(url: URL(string: imageUrl)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                    }

                    VStack(alignment: .leading) {
                        Text(game.name)
                            .font(.headline)
                        Text("Rating: \(game.rating ?? 0)")
                            .font(.subheadline)
                        Text("Released: \(game.released ?? "Unknown")")
                            .font(.subheadline)
                    }
                }
            }
            .onAppear {
                games = dbManager.fetchAllGames()
            }
        }
}


struct FavoriteGamesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteGamesView()
    }
}
