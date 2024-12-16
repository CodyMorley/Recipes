//
//  PreviewDataFetcher.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import Foundation


class PreviewDataFetcher: RecipeFetching {
    func fetchRecipes() async throws -> [Recipe] {
        RecipeList.testData
    }
}

