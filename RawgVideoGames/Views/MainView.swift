//
//  MainView.swift
//  RawgVideoGames
//
//  Created by Jonas on 02/07/2023.
//

import SwiftUI

struct MainView: View {
    
    let customGold = Color("customGold", bundle: nil)
    let customWhite = Color("customWhite", bundle: nil)
    let customBlack = Color("customBlack", bundle: nil)
    let customDarkGray = Color("customDarkGray", bundle: nil)
    let cornerRadiusPercentage: CGFloat = 0.05
    
    var body: some View {
           NavigationView {
               ZStack {
                   Color.black
                       .ignoresSafeArea()
                   
                   GeometryReader { geometry in
                       VStack(spacing: 0) {
                           Spacer()
                           
                           MainMenuBoxView(geometry: geometry, destination: FavoriteGamesView(), systemName: "gamecontroller", text: "Favorites")
                           
                           Spacer()
                           
                           MainMenuBoxView(geometry: geometry, destination: ExploreGamesView(), systemName: "gamecontroller", text: "Explore")
                           
                           Spacer()
                       }
                       .padding(.horizontal, geometry.size.width * 0.05)
                   }
               }
           }
           .navigationBarTitle(Text("Main View"))
           .navigationViewStyle(StackNavigationViewStyle())
       }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
