//
//  RecipeCellDescriptionView.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import SwiftUI


struct RecipeCellDescriptionView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(recipe.name)
                .font(.headline)
                .foregroundColor(.primary)
            Text("\(recipe.cuisine) Cuisine")
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(.secondary)
        }
    }
}


#Preview {
    RecipeCellDescriptionView(recipe: RecipeList.sample)
}
