//
//  GameRowView.swift
//  RawgVideoGames
//
//  Created by Jonas on 27/06/2023.
//

import SwiftUI

struct GameRowView: View {
    
    var game: Game
    
    @State private var isFavorite = false
    
    var body: some View {
        
        HStack {
            AsyncImage(url: URL(string: game.background_image ?? "")) { image in
                image.resizable()
            }
        placeholder: {
            ProgressView()
        }
                .aspectRatio(1, contentMode: .fit)
                //.frame(width: 50, height: 50)
                //.cornerRadius(10)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(game.name)
                .bold()
            
            Spacer()
            
            Button(action: {
                
                if isFavorite {
                    //DatabaseManager.shared.printGamesTable()
                    //DatabaseManager.shared.insertGame(game)
                } else {
                    //DatabaseManager.shared.deleteGame(game)
                    //DatabaseManager.shared.printGamesTable()
                }
            }) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(isFavorite ? .red : .black)
            }
            
        }
        .listRowSeparator(.hidden)
        .listRowBackground(
            Color(.brown)
                .opacity(0.1))
        
    }
}

struct GameRowView_Previews: PreviewProvider {
    static var previews: some View {
        GameRowView(game: Game(id: 1, name: "PLACEHOLDER"))
    }
}
