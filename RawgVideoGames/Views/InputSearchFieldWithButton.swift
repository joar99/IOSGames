//
//  InputSearchFieldWithButton.swift
//  RawgVideoGames
//
//  Created by Jonas on 28/06/2023.
//

import SwiftUI

struct InputSearchFieldWithButton: View {
    
    @Binding var inputText: String
    
    var viewModel: GameViewModel
    
    var body: some View {
        
        HStack {
            
            TextField("Search Games", text: $inputText)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Image(systemName: "xmark.circle.fill")
                .onTapGesture {
                    inputText = "";
                    viewModel.resetList()
                    viewModel.fetchGames()
                }
            
            Button("Search") {
                inputText = inputText.lowercased()
                
                inputText = inputText.replacingOccurrences(of: " ", with: "-")
                
                viewModel.fetchGame(with: inputText)
            }
            .padding()
        }
        
    }
}
