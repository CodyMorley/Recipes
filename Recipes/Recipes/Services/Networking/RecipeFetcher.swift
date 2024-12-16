//
//  RecipeFetcher.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import Foundation


class RecipeFetcher: RecipeFetching {
    let session: URLSession
    
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    
    func fetchRecipes() async throws -> [Recipe] {
        guard let url = constructURL() else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else { throw URLError(.badServerResponse) }
        
        guard  200..<300 ~= httpResponse.statusCode else {
            print("Response Code: \(httpResponse.statusCode)")
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        
        do {
            let recipesResponse = try decoder.decode(RecipesResponse.self, from: data)
            switch recipesResponse.recipes.isEmpty {
            case true: throw URLError(.resourceUnavailable)
            case false: return recipesResponse.recipes
            }
        } catch {
            throw error
        }
    }
    
    fileprivate func constructURL() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "d3jbb8n5wk0qxi.cloudfront.net"
        components.path = "/recipes.json"
        return components.url
    }
}


class RecipeFetcherInvalidURL: RecipeFetcher {
    override func constructURL() -> URL? { nil }
}
