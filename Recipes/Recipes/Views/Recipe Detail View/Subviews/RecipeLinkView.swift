//
//  RecipeLinkView.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import SwiftUI


struct RecipeLinkView: View {
    let url: URL
    
    var body: some View {
        Link(destination: url) {
            VStack(spacing: 8) {
                Image(systemName: "scroll")
                    .font(.largeTitle)
                Text("View Recipe")
                    .font(.headline)
            }
            .foregroundColor(.primary)
        }
    }
}


#Preview {
    RecipeLinkView(url: RecipeList.sample.sourceURL!)
}

