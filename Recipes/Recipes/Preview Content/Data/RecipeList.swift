//
//  RecipeList.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import Foundation


struct RecipeList {
    static let sample = Recipe(id: UUID(uuidString: "0c6ca6e7-e32a-4053-b824-1dbf749910d8")!,
                               cuisine: "Malaysian",
                               name: "Apam Balik",
                               largePhotoURL: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg"),
                               smallPhotoURL: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg"),
                               sourceURL: URL(string: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ"),
                               youtubeURL: URL(string: "https://www.youtube.com/watch?v=6R8ffRRJcrg"))
    
    static let testData = [Recipe(id: UUID(uuidString: "0c6ca6e7-e32a-4053-b824-1dbf749910d8")!,
                                  cuisine: "Malaysian",
                                  name: "Apam Balik",
                                  largePhotoURL: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg"),
                                  smallPhotoURL: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg"),
                                  sourceURL: URL(string: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ"),
                                  youtubeURL: URL(string: "https://www.youtube.com/watch?v=6R8ffRRJcrg")),
                           Recipe(id: UUID(uuidString: "599344f4-3c5c-4cca-b914-2210e3b3312f")!,
                                  cuisine: "British",
                                  name: "Apple & Blackberry Crumble",
                                  largePhotoURL: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg"),
                                  smallPhotoURL: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg"),
                                  sourceURL: URL(string: "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble"),
                                  youtubeURL: URL(string: "https://www.youtube.com/watch?v=4vhcOwVBDO4")),
                           Recipe(id: UUID(uuidString: "74f6d4eb-da50-4901-94d1-deae2d8af1d1")!,
                                  cuisine: "British",
                                  name: "Apple Frangipan Tart",
                                  largePhotoURL: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/large.jpg"),
                                  smallPhotoURL: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/small.jpg"),
                                  sourceURL: nil,
                                  youtubeURL: URL(string: "https://www.youtube.com/watch?v=rp8Slv4INLk")),
                           Recipe(id: UUID(uuidString: "eed6005f-f8c8-451f-98d0-4088e2b40eb6")!,
                                  cuisine: "British",
                                  name: "Bakewell Tart",
                                  largePhotoURL: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dd936646-8100-4a1c-b5ce-5f97adf30a42/large.jpg"),
                                  smallPhotoURL: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dd936646-8100-4a1c-b5ce-5f97adf30a42/small.jpg"),
                                  sourceURL: nil,
                                  youtubeURL: URL(string: "https://www.youtube.com/watch?v=1ahpSTf_Pvk")),
                           Recipe(id: UUID(uuidString: "f8b20884-1e54-4e72-a417-dabbc8d91f12")!,
                                  cuisine: "American",
                                  name: "Banana Pancakes",
                                  largePhotoURL: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/large.jpg"),
                                  smallPhotoURL: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/small.jpg"),
                                  sourceURL: URL(string: "https://www.bbcgoodfood.com/recipes/banana-pancakes"),
                                  youtubeURL: URL(string: "https://www.youtube.com/watch?v=kSKtb2Sv-_U")),
                           Recipe(id: UUID(uuidString: "891a474e-91cd-4996-865e-02ac5facafe3")!,
                                  cuisine: "British",
                                  name: "Battenberg Cake",
                                  largePhotoURL: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ec1b84b1-2729-4547-99db-5e0b625c0356/large.jpg"),
                                  smallPhotoURL: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ec1b84b1-2729-4547-99db-5e0b625c0356/small.jpg"),
                                  sourceURL: URL(string: "https://www.bbcgoodfood.com/recipes/1120657/battenberg-cake"),
                                  youtubeURL: URL(string: "https://www.youtube.com/watch?v=aB41Q7kDZQ0"))]
    
    static let emptyData: [Recipe] = []
    
}

