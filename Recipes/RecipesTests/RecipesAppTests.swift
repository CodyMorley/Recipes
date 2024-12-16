//
//  RecipesAppTests.swift
//  RecipesTests
//
//  Created by Cody Morley on 12/15/24.
//

import SwiftUI
import XCTest
@testable import Recipes


final class RecipesAppTests: XCTestCase {
    func testRecipesAppBody() {
        let app = RecipesApp()
        
        let body = app.body
        
        XCTAssertNotNil(body, "The app's body should not be nil")
        XCTAssertTrue(body is WindowGroup<RecipesListView>, "The body should be a WindowGroup containing RecipesView")
    }
}
