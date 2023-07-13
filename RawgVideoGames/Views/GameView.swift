//
//  GameView.swift
//  RawgVideoGames
//
//  Created by Jonas on 09/07/2023.
//

import SwiftUI

struct GameView: View {
    let customGold = Color("customGold", bundle: nil)
    let customWhite = Color("customWhite", bundle: nil)
    let customBlack = Color("customBlack", bundle: nil)
    let customDarkGray = Color("customDarkGray", bundle: nil)
    
    var game: Game
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [customBlack, customDarkGray]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                if let imageURL = game.background_image,
                   let url = URL(string: imageURL) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                            .shadow(color: .black, radius: 10, x: 0, y: 5)
                    } placeholder: {
                        Color.gray
                            .opacity(0.7)
                            .cornerRadius(15)
                            .shadow(color: .black, radius: 10, x: 0, y: 5)
                    }
                } else {
                    Color.gray
                        .opacity(0.7)
                        .cornerRadius(15)
                        .shadow(color: .black, radius: 10, x: 0, y: 5)
                }
                
                Text(game.name)
                    .font(.title)
                    .foregroundColor(customWhite)
                    .padding(.top, 10)
                
                if let rating = game.rating {
                    RatingView(rating: rating)
                        .padding(.top, 10)
                }
            }
            .padding()
        }
    }
}

struct RatingView: View {
    let rating: Double
    let maxRating: Int = 5
    
    var body: some View {
        HStack(spacing: 5) {
            ForEach(1...maxRating, id: \.self) { index in
                Image(systemName: index <= Int(rating) ? "star.fill" : "star")
                    .foregroundColor(.yellow)
                    .font(.headline)
            }
        }
    }
}


/*struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}*/

