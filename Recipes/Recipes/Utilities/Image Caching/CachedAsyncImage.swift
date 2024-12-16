//
//  CachedAsyncImage.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import SwiftUI

struct CachedAsyncImage<Content: View>: View {
    private let url: URL
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
    
    
    init(url: URL, scale: CGFloat = 1.0, transaction: Transaction = Transaction(), @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    
    var body: some View {
        if let cachedImage = ImageCache[url] {
            content(.success(cachedImage))
        } else {
            AsyncImage(url: url, scale: scale, transaction: transaction) { phase in
                cacheAndRenderImage(phase: phase)
            }
        }
    }
    
    
    func cacheAndRenderImage(phase: AsyncImagePhase) -> some View {
        if case .success(let image) = phase {
            ImageCache[url] = image
        }
        
        return content(phase)
    }
}


#Preview {
    CachedAsyncImage(url: RecipeList.sample.smallPhotoURL!) { phase in
        switch phase {
        case .empty:
            ProgressView()
        case .success(let image):
            image
        case .failure(let error):
            ImageErrorView(error: error)
        @unknown default:
            fatalError("An unknown asynchronous image phase was encountered.")
        }
    }
}
