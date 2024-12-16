//
//  RecipeFetching.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import Foundation

protocol RecipeFetching {
    func fetchRecipes() async throws -> [Recipe]
}





