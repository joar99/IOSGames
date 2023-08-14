//
//  MockDatabaseManagerTests.swift
//  MockDatabaseManagerTests
//
//  Created by Jonas on 16/07/2023.
//

import XCTest

final class MockDatabaseManagerTests: XCTestCase {
    
    var mockDatabaseManager: MockDatabaseManager!
    
    override func setUp() {
        super.setUp()
        mockDatabaseManager = MockDatabaseManager()
    }
    
    override func tearDown() {
        mockDatabaseManager = nil
        super.tearDown()
    }
    
    func testSaveGame() {

        let expectedGame = Game(
            id: 2,
            name: "Another Mock Game",
            released: "2023-02-01",
            background_image: "https://example.com/another_mock.jpg",
            rating: 3.8,
            ratings_count: 50
        )

        mockDatabaseManager.saveGame(expectedGame)

        let actualGame = mockDatabaseManager.fetchGame(withID: expectedGame.id)

        XCTAssertNotNil(actualGame, "Failed to retrieve the game from the database.")

        XCTAssertEqual(actualGame?.id, expectedGame.id, "Game ID mismatch.")
        XCTAssertEqual(actualGame?.name, expectedGame.name, "Game name mismatch.")
        XCTAssertEqual(actualGame?.released, expectedGame.released, "Game release date mismatch.")
        XCTAssertEqual(actualGame?.background_image, expectedGame.background_image, "Game background image URL mismatch.")
        XCTAssertEqual(actualGame?.rating, expectedGame.rating, "Game rating mismatch.")
        XCTAssertEqual(actualGame?.ratings_count, expectedGame.ratings_count, "Game ratings count mismatch.")
    }
    
    func testRemoveGame() {

        let mockGame = Game(
            id: 2,
            name: "Another Mock Game",
            released: "2023-02-01",
            background_image: "https://example.com/another_mock.jpg",
            rating: 3.8,
            ratings_count: 50
        )

        mockDatabaseManager.saveGame(mockGame)

        let expectedGameExistsBefore = true
        let actualGameExistsBefore = mockDatabaseManager.gameExists(withID: mockGame.id)

        XCTAssertEqual(actualGameExistsBefore, expectedGameExistsBefore, "Failed to save the game in the database.")

        mockDatabaseManager.removeGame(withID: mockGame.id)

        let expectedGameExistsAfter = false
        let actualGameExistsAfter = mockDatabaseManager.gameExists(withID: mockGame.id)

        XCTAssertEqual(actualGameExistsAfter, expectedGameExistsAfter, "Failed to remove the game from the database.")
    }
    
    func testFetchAllGames() {

        let mockGame1 = Game(
            id: 1,
            name: "Mock Game 1",
            released: "2023-01-01",
            background_image: "https://example.com/mock1.jpg",
            rating: 4.0,
            ratings_count: 100
        )

        let mockGame2 = Game(
            id: 2,
            name: "Mock Game 2",
            released: "2023-02-01",
            background_image: "https://example.com/mock2.jpg",
            rating: 3.8,
            ratings_count: 50
        )

        let mockGame3 = Game(
            id: 3,
            name: "Mock Game 3",
            released: "2023-03-01",
            background_image: "https://example.com/mock3.jpg",
            rating: 4.2,
            ratings_count: 150
        )

        mockDatabaseManager.saveGame(mockGame1)
        mockDatabaseManager.saveGame(mockGame2)
        mockDatabaseManager.saveGame(mockGame3)

        let expectedGames = [mockGame1, mockGame2, mockGame3]
        let actualGames = mockDatabaseManager.fetchAllGames()

        XCTAssertEqual(actualGames.count, expectedGames.count, "Failed to fetch the correct number of games from the database.")

        for i in 0..<expectedGames.count {
            XCTAssertEqual(actualGames[i].id, expectedGames[i].id, "Game ID mismatch at index \(i).")
            XCTAssertEqual(actualGames[i].name, expectedGames[i].name, "Game name mismatch at index \(i).")
            XCTAssertEqual(actualGames[i].released, expectedGames[i].released, "Game release date mismatch at index \(i).")
            XCTAssertEqual(actualGames[i].background_image, expectedGames[i].background_image, "Game background image URL mismatch at index \(i).")
            XCTAssertEqual(actualGames[i].rating, expectedGames[i].rating, "Game rating mismatch at index \(i).")
            XCTAssertEqual(actualGames[i].ratings_count, expectedGames[i].ratings_count, "Game ratings count mismatch at index \(i).")
        }
    }

    func testGameExists() {

        let mockGame = Game(
            id: 2,
            name: "Another Mock Game",
            released: "2023-02-01",
            background_image: "https://example.com/another_mock.jpg",
            rating: 3.8,
            ratings_count: 50
        )

        let expectedGameExistsBefore = false
        let actualGameExistsBefore = mockDatabaseManager.gameExists(withID: mockGame.id)

        XCTAssertEqual(actualGameExistsBefore, expectedGameExistsBefore, "Failed to check the game existence before saving it in the database.")

        mockDatabaseManager.saveGame(mockGame)

        let expectedGameExistsAfter = true
        let actualGameExistsAfter = mockDatabaseManager.gameExists(withID: mockGame.id)

        XCTAssertEqual(actualGameExistsAfter, expectedGameExistsAfter, "Failed to check the game existence after saving it in the database.")
    }

}

