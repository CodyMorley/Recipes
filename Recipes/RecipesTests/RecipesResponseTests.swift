//
//  RecipesResponseTests.swift
//  RecipesTests
//
//  Created by Cody Morley on 12/15/24.
//

import XCTest
@testable import Recipes


final class RecipesResponseTests: XCTestCase {
    func testDecodingWithMultipleRecipes() throws {
        let json = """
        {
            "recipes": [
                {
                    "uuid": "123E4567-E89B-12D3-A456-426614174000",
                    "cuisine": "Italian",
                    "name": "Spaghetti Bolognese",
                    "photo_url_large": "https://example.com/spaghetti_large.jpg",
                    "photo_url_small": "https://example.com/spaghetti_small.jpg",
                    "source_url": "https://example.com/spaghetti_recipe",
                    "youtube_url": "https://youtube.com/spaghetti"
                },
                {
                    "uuid": "123E4567-E89B-12D3-A456-426614174001",
                    "cuisine": "French",
                    "name": "Croissant",
                    "photo_url_large": "https://example.com/croissant_large.jpg",
                    "photo_url_small": "https://example.com/croissant_small.jpg",
                    "source_url": "https://example.com/croissant_recipe",
                    "youtube_url": "https://youtube.com/croissant"
                }
            ]
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let response = try decoder.decode(RecipesResponse.self, from: json)
        
        XCTAssertEqual(response.recipes.count, 2)
        XCTAssertEqual(response.recipes[0].name, "Spaghetti Bolognese")
        XCTAssertEqual(response.recipes[1].name, "Croissant")
    }
    
    func testDecodingWithEmptyRecipes() throws {
        let json = """
            {
                "recipes": []
            }
            """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let response = try decoder.decode(RecipesResponse.self, from: json)
        
        XCTAssertEqual(response.recipes.count, 0)
    }
    
    func testDecodingMissingRecipesKey() {
        let json = """
            {
                "data": []
            }
            """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        
        XCTAssertThrowsError(try decoder.decode(RecipesResponse.self, from: json)) { error in
            guard case let DecodingError.keyNotFound(key, _) = error else {
                XCTFail("Expected keyNotFound error, got \(error)")
                return
            }
            XCTAssertEqual(key.stringValue, "recipes")
        }
    }
    
    func testDecodingInvalidRecipesType() {
        let json = """
          {
              "recipes": "This should be an array, not a string"
          }
          """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        
        XCTAssertThrowsError(try decoder.decode(RecipesResponse.self, from: json)) { error in
            guard case let DecodingError.typeMismatch(expectedType, context) = error else {
                XCTFail("Expected typeMismatch error, got \(error)")
                return
            }
            XCTAssertEqual(String(describing: expectedType), String(describing: Array<Any>.self))
            XCTAssertEqual(context.codingPath.last?.stringValue, "recipes")
        }
    }
}
