//
//  RecipeHeaderView.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import SwiftUI


struct RecipeHeaderView: View {
    let name: String
    let cuisine: String
    
    var body: some View {
        Text(name)
            .font(.largeTitle)
            .bold()
            .multilineTextAlignment(.center)
        
        Text("\(cuisine) Cuisine")
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(.secondary)
            .frame(alignment: .center)
    }
}


#Preview {
    RecipeHeaderView(name: RecipeList.sample.name, cuisine: RecipeList.sample.cuisine)
}
