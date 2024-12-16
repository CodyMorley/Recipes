//
//  ImageCacheTests.swift
//  RecipesTests
//
//  Created by Cody Morley on 12/15/24.
//

import SwiftUI
import XCTest
@testable import Recipes


class ImageCacheTests: XCTestCase {
    func testStoreAndRetrieveImage() {
        let url = URL(string: "https://example.com/image.png")!
        let image = Image(systemName: "star")
        
        ImageCache[url] = image
        let retrievedImage = ImageCache[url]
        
        XCTAssertNotNil(retrievedImage, "The image should have been stored and retrieved successfully.")
    }
    
    func testUpdateExistingImage() {
        let url = URL(string: "https://example.com/image.png")!
        let originalImage = Image(systemName: "star")
        let updatedImage = Image(systemName: "heart")
        
        ImageCache[url] = originalImage
        ImageCache[url] = updatedImage
        let retrievedImage = ImageCache[url]
        
        XCTAssertEqual(retrievedImage, updatedImage, "The image should have been updated to the new image.")
    }
    
    func testRemoveImage() {
        let url = URL(string: "https://example.com/image.png")!
        let image = Image(systemName: "star")
        
        ImageCache[url] = image
        ImageCache[url] = nil
        let retrievedImage = ImageCache[url]
        
        XCTAssertNil(retrievedImage, "The image should have been removed from the cache.")
    }
    
    func testRetrieveNonExistentImage() {
        let url = URL(string: "https://example.com/nonexistent.png")!
        
        let retrievedImage = ImageCache[url]
        
        XCTAssertNil(retrievedImage, "Retrieving a non-existent image should return nil.")
    }
}
