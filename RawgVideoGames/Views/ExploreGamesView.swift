//
//  ContentView.swift
//  RawgVideoGames
//
//  Created by Jonas on 27/06/2023.
//

import SwiftUI


struct ExploreGamesView: View {
    
    let customGold = Color("customGold", bundle: nil)
    let customWhite = Color("customWhite", bundle: nil)
    let customBlack = Color("customBlack", bundle: nil)
    let customDarkGray = Color("customDarkGray", bundle: nil)
    
    @StateObject var viewModel = GameViewModel()
    @State private var searchText = ""
    
    var body: some View {
        
        VStack {
            HStack {
                BackButtonView()
                
                Spacer()
                
                Text("Explore New Games")
                    .bold()
                    .foregroundColor(customWhite)
                
                Spacer()
                
            }
            InputSearchFieldWithButton(inputText: $searchText, viewModel: viewModel)
                List {
                    ForEach(viewModel.games) { game in
                        GameRowView(game: game)
                            .frame(height: 100)
                            .background(customDarkGray)
                            .cornerRadius(20)
                            .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(customBlack)
                            )
                                .onAppear {
                                    if viewModel.isLastGame(game) {
                                        viewModel.fetchGames()
                                    }
                                }
                        }
                    }
                .listStyle(PlainListStyle())
                }
                .background(.black)
                //.padding()
                .onAppear {
                    viewModel.fetchGames()
                }
                .navigationBarBackButtonHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreGamesView()
    }
}
