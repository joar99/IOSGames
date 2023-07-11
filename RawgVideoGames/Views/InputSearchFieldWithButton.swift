//
//  InputSearchFieldWithButton.swift
//  RawgVideoGames
//
//  Created by Jonas on 28/06/2023.
//

import SwiftUI

struct InputSearchFieldWithButton: View {
    
    let customGold = Color("customGold", bundle: nil)
    let customWhite = Color("customWhite", bundle: nil)
    let customBlack = Color("customBlack", bundle: nil)
    let customDarkGray = Color("customDarkGray", bundle: nil)
    
    @Binding var inputText: String
    
    var viewModel: GameViewModel
    
    var body: some View {
        
        HStack {
            
            TextField("Search Games", text: $inputText)
                .textFieldStyle(.roundedBorder)
                .padding()
                .foregroundColor(customWhite)
            
            Spacer()
            
            Image(systemName: "xmark.circle.fill")
                .onTapGesture {
                    inputText = "";
                    viewModel.resetList()
                    viewModel.fetchGames()
                }
                .foregroundColor(customWhite)
            
            Spacer()
            
            Button(action: {
                inputText = inputText.lowercased()
                inputText = inputText.replacingOccurrences(of: " ", with: "-")
                viewModel.fetchGame(with: inputText)
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(customWhite)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(customGold, lineWidth: 2)
            )
        }
        .background(.black)
        //.foregroundColor(.white)
        
    }
}
