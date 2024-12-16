//
//  RecipeCellView.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import SwiftUI


struct RecipeCellView: View {
    let recipe: Recipe
    private let imageWidth: CGFloat = 100.0
    private let cellHeight: CGFloat = 130.0
    
    var body: some View {
        if let smallPhotoURL = recipe.smallPhotoURL {
            CachedAsyncImage(url: smallPhotoURL) { phase in
                switch phase {
                case .success(let image):
                    HStack {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageWidth)
                            .cornerRadius(16)
                            .padding(.trailing, 8)
                        
                        RecipeCellDescriptionView(recipe: recipe)
                        
                        Spacer()
                    }
                case .failure(let error):
                    ImageErrorView(error: error)
                case .empty:
                    HStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .red))
                        
                        Spacer()
                    }
                @unknown default:
                    fatalError("An unknown asynchronous image phase was encountered.")
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: cellHeight)
            .padding()
            .listRowSeparator(.hidden)
        }
    }
}


#Preview {
    RecipeCellView(recipe: RecipeList.sample)
}

