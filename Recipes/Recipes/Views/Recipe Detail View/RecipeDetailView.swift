//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import SwiftUI


struct RecipeDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    let recipe: Recipe
    
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
            
            VStack(alignment: .center, spacing: 12) {
                RecipeHeaderView(name: recipe.name, cuisine: recipe.cuisine)
                
                if let imageURL = recipe.largePhotoURL {
                    RecipeDetailImageView(url: imageURL)
                }
                
                Spacer()
                
                if let sourceURL = recipe.sourceURL {
                    RecipeLinkView(url: sourceURL)
                }
                
                if let youtubeURL = recipe.youtubeURL {
                    YoutubeLinkView(url: youtubeURL)
                }
                
                Spacer()
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}


#Preview {
    RecipeDetailView(recipe: RecipeList.testData[0])
}
