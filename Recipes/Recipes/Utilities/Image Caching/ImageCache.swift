//
//  ImageCache.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import SwiftUI


class ImageCache {
    static private var store: [URL : Image] = [:]
    
    static subscript(url: URL) -> Image? {
        get { ImageCache.store[url] }
        set { ImageCache.store[url] = newValue }
    }
}
