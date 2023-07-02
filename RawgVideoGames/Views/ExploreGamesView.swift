//
//  ContentView.swift
//  RawgVideoGames
//
//  Created by Jonas on 27/06/2023.
//

import SwiftUI


struct ExploreGamesView: View {
    
    @StateObject var viewModel = GameViewModel()
    @State private var searchText = ""
    
    var body: some View {
        
        VStack {
            Text("Explore New Games")
                .bold()
            InputSearchFieldWithButton(inputText: $searchText, viewModel: viewModel)
                List {
                    ForEach(viewModel.games) { game in
                        GameRowView(game: game)
                            .frame(height: 100)
                                .onAppear {
                                    if viewModel.isLastGame(game) {
                                        viewModel.fetchGames()
                                    }
                                }
                        }
                    }
                }
                .padding()
                .onAppear {
                    viewModel.fetchGames()
                }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreGamesView()
    }
}
