//
//  GameRowView.swift
//  RawgVideoGames
//
//  Created by Jonas on 27/06/2023.
//

import SwiftUI

struct GameRowView: View {
    
    let customGold = Color("customGold", bundle: nil)
    let customWhite = Color("customWhite", bundle: nil)
    
    var game: Game
    
    @State private var isFavorite = false
    
    var body: some View {
        
        HStack {
            AsyncImage(url: URL(string: game.background_image ?? "")) { image in
                image.resizable()
            }
        placeholder: {
            ProgressView()
                .tint(customWhite)
            
        }
                .aspectRatio(1, contentMode: .fit)
                //.frame(width: 50, height: 50)
                //.cornerRadius(10)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(customGold, lineWidth: 2)
                )
                Text(game.name)
                .bold()
                .foregroundColor(customWhite)
            
            Spacer()
            
            Button(action: {
                
                if (DatabaseManager.shared.gameExists(withID: game.id)) {
                    DatabaseManager.shared.removeGame(withID: game.id)
                } else {
                    DatabaseManager.shared.saveGame(game)
                }
                isFavorite.toggle()
            }) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(isFavorite ? customGold : customWhite)
            }
            
        }
        .padding()
        .listRowSeparator(.hidden)
        .listRowBackground(
            Color(.black)
                .opacity(0.6))
        .onAppear {
            isFavorite = DatabaseManager.shared.gameExists(withID: game.id)
        }
        
    }
}

struct GameRowView_Previews: PreviewProvider {
    static var previews: some View {
        GameRowView(game: Game(id: 1, name: "PLACEHOLDER"))
    }
}
