//
//  RecipeTests.swift
//  RecipesTests
//
//  Created by Cody Morley on 12/15/24.
//

import XCTest
@testable import Recipes


final class RecipeTests: XCTestCase {
    func testRecipeDecodingWithAllFields() throws {
        let json = """
        {
            "uuid": "123E4567-E89B-12D3-A456-426614174000",
            "cuisine": "Italian",
            "name": "Spaghetti Bolognese",
            "photo_url_large": "https://example.com/large.jpg",
            "photo_url_small": "https://example.com/small.jpg",
            "source_url": "https://example.com/recipe",
            "youtube_url": "https://youtube.com/example"
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let recipe = try decoder.decode(Recipe.self, from: json)
        
        XCTAssertEqual(recipe.id, UUID(uuidString: "123E4567-E89B-12D3-A456-426614174000"))
        XCTAssertEqual(recipe.cuisine, "Italian")
        XCTAssertEqual(recipe.name, "Spaghetti Bolognese")
        XCTAssertEqual(recipe.largePhotoURL, URL(string: "https://example.com/large.jpg"))
        XCTAssertEqual(recipe.smallPhotoURL, URL(string: "https://example.com/small.jpg"))
        XCTAssertEqual(recipe.sourceURL, URL(string: "https://example.com/recipe"))
        XCTAssertEqual(recipe.youtubeURL, URL(string: "https://youtube.com/example"))
    }
    
    func testRecipeDecodingWithMissingOptionalFields() throws {
        let json = """
        {
            "uuid": "123E4567-E89B-12D3-A456-426614174001",
            "cuisine": "French",
            "name": "Croissant"
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let recipe = try decoder.decode(Recipe.self, from: json)
        
        XCTAssertEqual(recipe.id, UUID(uuidString: "123E4567-E89B-12D3-A456-426614174001"))
        XCTAssertEqual(recipe.cuisine, "French")
        XCTAssertEqual(recipe.name, "Croissant")
        XCTAssertNil(recipe.largePhotoURL)
        XCTAssertNil(recipe.smallPhotoURL)
        XCTAssertNil(recipe.sourceURL)
        XCTAssertNil(recipe.youtubeURL)
    }
    
    func testRecipeDecodingWithInvalidUUID() {
        let json = """
            {
                "uuid": "invalid-uuid-string",
                "cuisine": "Mexican",
                "name": "Tacos"
            }
            """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        
        XCTAssertThrowsError(try decoder.decode(Recipe.self, from: json)) { error in
            guard case let DecodingError.dataCorrupted(context) = error else {
                XCTFail("Expected dataCorrupted error, got \(error)")
                return
            }
            XCTAssertEqual(context.codingPath.last?.stringValue, "uuid")
            XCTAssertEqual(context.debugDescription, "Invalid UUID")
        }
    }
    
    func testRecipeDecodingWithMissingRequiredFields() {
        let json = """
        {
            "uuid": "123E4567-E89B-12D3-A456-426614174003",
            "cuisine": "Thai"
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        
        XCTAssertThrowsError(try decoder.decode(Recipe.self, from: json)) { error in
            guard case let DecodingError.keyNotFound(key, _) = error else {
                XCTFail("Expected keyNotFound error, got \(error)")
                return
            }
            XCTAssertEqual(key.stringValue, "name")
        }
    }
    
    func testRecipeDecodingWithInvalidCuisineType() {
        let json = """
            {
                "uuid": "123E4567-E89B-12D3-A456-426614174004",
                "cuisine": 123,
                "name": "Pad Thai"
            }
            """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        
        XCTAssertThrowsError(try decoder.decode(Recipe.self, from: json)) { error in
            guard case let DecodingError.typeMismatch(type, context) = error else {
                XCTFail("Expected typeMismatch error, got \(error)")
                return
            }
            XCTAssertTrue(type == String.self)
            XCTAssertEqual(context.codingPath.last?.stringValue, "cuisine")
        }
    }
    
    func testRecipeInitialization() {
        let id = UUID()
        let cuisine = "Greek"
        let name = "Moussaka"
        let largePhotoURL = URL(string: "https://example.com/moussaka_large.jpg")
        let smallPhotoURL = URL(string: "https://example.com/moussaka_small.jpg")
        let sourceURL = URL(string: "https://example.com/moussaka_recipe")
        let youtubeURL = URL(string: "https://youtube.com/moussaka")
        
        let recipe = Recipe(
            id: id,
            cuisine: cuisine,
            name: name,
            largePhotoURL: largePhotoURL,
            smallPhotoURL: smallPhotoURL,
            sourceURL: sourceURL,
            youtubeURL: youtubeURL
        )
        
        XCTAssertEqual(recipe.id, id)
        XCTAssertEqual(recipe.cuisine, cuisine)
        XCTAssertEqual(recipe.name, name)
        XCTAssertEqual(recipe.largePhotoURL, largePhotoURL)
        XCTAssertEqual(recipe.smallPhotoURL, smallPhotoURL)
        XCTAssertEqual(recipe.sourceURL, sourceURL)
        XCTAssertEqual(recipe.youtubeURL, youtubeURL)
    }
}
