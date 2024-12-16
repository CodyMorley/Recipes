//
//  RecipeDetailImageView.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import SwiftUI


struct RecipeDetailImageView: View {
    let url: URL
    
    var body: some View {
        CachedAsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(16)
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
        .padding()
    }
}


#Preview {
    RecipeDetailImageView(url: RecipeList.sample.largePhotoURL!)
}
