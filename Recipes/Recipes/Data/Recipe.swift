//
//  Recipe.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import Foundation


struct Recipe: Identifiable, Equatable, Codable {
    enum CodingKeys: String, CodingKey {
        case cuisine
        case name
        case id = "uuid"
        case largePhotoURL = "photo_url_large"
        case smallPhotoURL = "photo_url_small"
        case sourceURL = "source_url"
        case youtubeURL = "youtube_url"
    }
    
    
    let id: UUID
    let cuisine: String
    let name: String
    let largePhotoURL: URL?
    let smallPhotoURL: URL?
    let sourceURL: URL?
    let youtubeURL: URL?
    
    
    init(id: UUID, cuisine: String, name: String, largePhotoURL: URL?, smallPhotoURL: URL?, sourceURL: URL?, youtubeURL: URL?) {
        self.id = id
        self.cuisine = cuisine
        self.name = name
        self.largePhotoURL = largePhotoURL
        self.smallPhotoURL = smallPhotoURL
        self.sourceURL = sourceURL
        self.youtubeURL = youtubeURL
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let idString = try container.decode(String.self, forKey: .id)
        guard let uuid = UUID(uuidString: idString) else {
            throw DecodingError.dataCorruptedError(forKey: .id, in: container, debugDescription: "Invalid UUID")
        }
        id = uuid
        
        cuisine = try container.decode(String.self, forKey: .cuisine)
        name = try container.decode(String.self, forKey: .name)
        
        largePhotoURL = try container.decodeIfPresent(String.self, forKey: .largePhotoURL).flatMap { URL(string: $0) }
        smallPhotoURL = try container.decodeIfPresent(String.self, forKey: .smallPhotoURL).flatMap { URL(string: $0) }
        sourceURL = try container.decodeIfPresent(String.self, forKey: .sourceURL).flatMap { URL(string: $0) }
        youtubeURL = try container.decodeIfPresent(String.self, forKey: .youtubeURL).flatMap { URL(string: $0) }
    }
}
