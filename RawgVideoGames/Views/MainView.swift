//
//  MainView.swift
//  RawgVideoGames
//
//  Created by Jonas on 02/07/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink(destination: FavoriteGamesView()) {
                    Text("Favorites")
                }
                NavigationLink(destination: ExploreGamesView()) {
                    Text("Explore Games")
                }
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
