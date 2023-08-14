//
//  MainView_UITests.swift
//  RawgVideoGamesUITests
//
//  Created by Jonas on 13/08/2023.
//

import XCTest

final class MainView_UITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        
    }

    func test_MainView_gameExploreButton_shouldMoveToExploreGamesView() {
        
        let button = app.buttons["MainMenuExploreButton"]
        
        button.tap()
        
        let exploreHeader = app.staticTexts["ExploreGamesHeader"]
        
        exploreHeader.tap()
        
        XCTAssertTrue(exploreHeader.exists, "The Explore New Games static text should be visible.")
        
    }

    func test_MainView_gameFavoriteButton_shouldMoveToFavoriteGamesView() {
        
        let button = app/*@START_MENU_TOKEN@*/.buttons["MainMenuFavoriteButton"]/*[[".buttons[\"Favorites\"]",".buttons[\"MainMenuFavoriteButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        button.tap()
        
        let favoriteListView = app.collectionViews["FavoriteListOfGames"]
        
        favoriteListView.tap()
        
        XCTAssertTrue(favoriteListView.exists, "The list of favorite games exists and should be visible.")
        
    }
    
    
}
