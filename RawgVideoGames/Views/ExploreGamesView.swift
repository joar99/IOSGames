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
    @State private var selectedGame: Game?
    
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
            .accessibilityIdentifier("ExploreGamesHeader")
            
            InputSearchFieldWithButton(inputText: $searchText, viewModel: viewModel)
            
            List {
                ForEach(viewModel.games) { game in
                    Button(action: {
                        selectedGame = game
                    }) {
                        GameRowView(game: game)
                            .frame(height: 100)
                            .background(customDarkGray)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(customBlack)
                            )
                    }
                    .listRowSeparator(.hidden)
                    .onAppear {
                        if viewModel.isLastGame(game) {
                            viewModel.fetchGames()
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        .background(Color.black)
        .onAppear {
            viewModel.fetchGames()
        }
        .navigationBarBackButtonHidden()
        .sheet(item: $selectedGame) { game in
            GameView(game: game)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreGamesView()
    }
}
