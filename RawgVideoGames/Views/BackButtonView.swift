//
//  BackButtonView.swift
//  RawgVideoGames
//
//  Created by Jonas on 04/07/2023.
//

import SwiftUI

struct BackButtonView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
            Image(systemName: "chevron.left")
                    .foregroundColor(.white)
            }
            Text("Back")
                .foregroundColor(.white)
        }
        
    }
}

struct BackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonView()
    }
}
