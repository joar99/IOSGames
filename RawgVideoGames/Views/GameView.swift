//
//  GameView.swift
//  RawgVideoGames
//
//  Created by Jonas on 09/07/2023.
//

import SwiftUI

struct GameView: View {
    let fakeGame = Game(id: 1,
                        name: "Example Game",
                        released: "2023-07-01",
                        background_image: "https://store-images.s-microsoft.com/image/apps.11650.13510798887356280.235dc311-b50e-403c-af16-ceffcc2c2399.99b85445-285f-4bc9-a0ec-53e5c36b1ae3",
                        rating: 4.5,
                        ratings_count: 1000)
    
    var body: some View {
        VStack {
            if let imageURL = fakeGame.background_image,
               let url = URL(string: imageURL) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color.gray
                }
            } else {
                Color.gray
            }
            
            Text(fakeGame.name)
                .font(.title)
            
            Text("Rating: \(fakeGame.rating ?? 0.0)")
                .font(.headline)
        }
        .padding()
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}

