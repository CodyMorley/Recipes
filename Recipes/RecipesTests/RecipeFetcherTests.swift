//
//  RecipeFetcherTests.swift
//  RecipesTests
//
//  Created by Cody Morley on 12/15/24.
//

import XCTest
@testable import Recipes


final class RecipeFetcherTests: XCTestCase {
    override func setUpWithError() throws {}
    
    override func tearDownWithError() throws {}
    
    func testFetchRecipesSuccess() async throws {
        let expectedRecipes = RecipeList.testData
        let mockData = try JSONEncoder().encode(RecipesResponse(recipes: expectedRecipes))
        let mockResponse = HTTPURLResponse(url: URL(string: "https://example.com")!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)!
        
        MockURLProtocol.requestHandler = { request in
            (mockResponse, mockData)
        }
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: config)
        let fetcher = RecipeFetcher(session: session)
        let recipes = try await fetcher.fetchRecipes()
        
        XCTAssertEqual(recipes, expectedRecipes)
    }
    
    func testFetchRecipesInvalidURL() async {
        let fetcher = RecipeFetcherInvalidURL()
        
        do {
            _ = try await fetcher.fetchRecipes()
            XCTFail("Expected to throw URLError.badURL, but succeeded.")
        } catch let error as URLError {
            XCTAssertEqual(error.code, .badURL)
        } catch {
            XCTFail("Expected URLError.badURL, got \(error)")
        }
    }
    
    func testFetchRecipesServerError() async throws {
        let mockResponse = HTTPURLResponse(url: URL(string: "https://example.com")!,
                                           statusCode: 500,
                                           httpVersion: nil,
                                           headerFields: nil)!
        MockURLProtocol.requestHandler = { request in
            return (mockResponse, Data())
        }
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: config)
        let fetcher = RecipeFetcher(session: session)
        
        do {
            _ = try await fetcher.fetchRecipes()
            XCTFail("Expected to throw, but succeeded.")
        } catch {
            XCTAssertEqual(error as? URLError, URLError(.badServerResponse))
        }
    }
    

    
    func testFetchRecipesHTTPErrorStatus() async {
        let mockData = Data()
        let mockResponse = HTTPURLResponse(url: URL(string: "https://example.com")!,
                                           statusCode: 404,
                                           httpVersion: nil,
                                           headerFields: nil)!
        
        MockURLProtocol.requestHandler = { request in
            (mockResponse, mockData)
        }
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: config)
        let fetcher = RecipeFetcher(session: session)
        
        do {
            _ = try await fetcher.fetchRecipes()
            XCTFail("Expected to throw URLError.badServerResponse, but succeeded.")
        } catch let error as URLError {
            XCTAssertEqual(error.code, .badServerResponse)
        } catch {
            XCTFail("Expected URLError.badServerResponse, got \(error)")
        }
    }
    
    func testFetchRecipesDecodingFailure() async {
        let invalidJSONData = "Invalid JSON".data(using: .utf8)!
        let mockResponse = HTTPURLResponse(url: URL(string: "https://example.com")!,
                                           statusCode: 200,
                                           httpVersion: nil,
                                           headerFields: nil)!
        
        MockURLProtocol.requestHandler = { request in
            return (mockResponse, invalidJSONData)
        }
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: config)
        let fetcher = RecipeFetcher(session: session)
        
        do {
            _ = try await fetcher.fetchRecipes()
            XCTFail("Expected to throw decoding error, but succeeded.")
        } catch {
            XCTAssertTrue(error is DecodingError)
        }
    }
}
