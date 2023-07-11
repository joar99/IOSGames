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
                        
                        HStack(spacing: geometry.size.width * 0.05) {
                            NavigationLink(destination: FavoriteGamesView()) {
                                VStack {
                                    Spacer()
                                    Image(systemName: "gamecontroller")
                                        .foregroundColor(customGold)
                                        .font(.system(size: geometry.size.width * 0.15))
                                        .background(customBlack)
                                        .cornerRadius(geometry.size.width * cornerRadiusPercentage)
                                    Spacer()
                                    Text("Favorites")
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
                            
                            Spacer()
                            
                            NavigationLink(destination: ExploreGamesView()) {
                                VStack {
                                    Spacer()
                                    Image(systemName: "gamecontroller")
                                        .foregroundColor(customGold)
                                        .font(.system(size: geometry.size.width * 0.15))
                                        .background(customBlack)
                                        .cornerRadius(geometry.size.width * cornerRadiusPercentage)
                                    Spacer()
                                    Text("Explore")
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
                        }
                        .frame(height: min(geometry.size.width, geometry.size.height) * 0.45)
                        
                        HStack(spacing: geometry.size.width * 0.05) {
                            NavigationLink(destination: FavoriteGamesView()) {
                                VStack {
                                    Spacer()
                                    Image(systemName: "gamecontroller")
                                        .foregroundColor(customGold)
                                        .font(.system(size: geometry.size.width * 0.15))
                                        .background(customBlack)
                                        .cornerRadius(geometry.size.width * cornerRadiusPercentage)
                                    Spacer()
                                    Text("Favorites")
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
                            
                            Spacer()
                            
                            NavigationLink(destination: ExploreGamesView()) {
                                VStack {
                                    Spacer()
                                    Image(systemName: "gamecontroller")
                                        .foregroundColor(customGold)
                                        .font(.system(size: geometry.size.width * 0.15))
                                        .background(customBlack)
                                        .cornerRadius(geometry.size.width * cornerRadiusPercentage)
                                    Spacer()
                                    Text("Explore")
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
                        }
                        .frame(height: min(geometry.size.width, geometry.size.height) * 0.45)
                        
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
