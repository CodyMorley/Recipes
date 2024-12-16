//
//  MalformedDataFetcher.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import Foundation


class MalformedDataFetcher: RecipeFetching {
    func fetchRecipes() async throws -> [Recipe] {
        guard let url = constructURL() else { throw URLError(.badURL) }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else { throw URLError(.badServerResponse) }
        
        guard  200..<300 ~= httpResponse.statusCode else {
            print("Response Code: \(httpResponse.statusCode)")
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        
        do {
            let recipesResponse = try decoder.decode(RecipesResponse.self, from: data)
            switch recipesResponse.recipes.isEmpty {
            case true:
                throw URLError(.resourceUnavailable)
            case false:
                return recipesResponse.recipes
            }
        } catch {
            throw error
        }
    }
    
    private func constructURL() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "d3jbb8n5wk0qxi.cloudfront.net"
        components.path = "/recipes-malformed.json"
        return components.url
    }
}

