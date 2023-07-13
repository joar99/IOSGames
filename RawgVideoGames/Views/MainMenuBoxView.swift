//
//  MainMenuBoxView.swift
//  RawgVideoGames
//
//  Created by Jonas on 13/07/2023.
//

import SwiftUI

struct MainMenuBoxView<Destination: View>: View {
    let customGold = Color("customGold", bundle: nil)
    let customWhite = Color("customWhite", bundle: nil)
    let customBlack = Color("customBlack", bundle: nil)
    let customDarkGray = Color("customDarkGray", bundle: nil)
    let cornerRadiusPercentage: CGFloat = 0.05
    
    let geometry: GeometryProxy
    let destination: Destination
    let systemName: String
    let text: String
    
    var body: some View {
        NavigationLink(destination: destination) {
            VStack {
                Spacer()
                Image(systemName: systemName)
                    .foregroundColor(customGold)
                    .font(.system(size: geometry.size.width * 0.15))
                    .background(customBlack)
                    .cornerRadius(geometry.size.width * cornerRadiusPercentage)
                Spacer()
                Text(text)
                    .font(.system(size: geometry.size.width * 0.06))
                    .background(customBlack)
                    .foregroundColor(customWhite)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
            .background(customGold)
            .cornerRadius(geometry.size.width * cornerRadiusPercentage)
        }
        .frame(height: min(geometry.size.width, geometry.size.height) * 0.45)
    }
}

/*struct MainMenuBoxView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuBoxView()
    }
}*/
