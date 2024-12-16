//
//  RecipesListViewModel.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import SwiftUI


class RecipesListViewModel: ObservableObject {
    @Published private(set)var recipes: [Recipe] = []
    @Published var selectedRecipe: Recipe? = nil
    @Published private(set) var failedFetch: Bool = false
    @Published private(set) var errorMessage: String? = nil
    @Published private(set) var isLoading: Bool = true
    private let fetcher: RecipeFetching
    
    
    init(fetcher: RecipeFetching) {
        self.fetcher = fetcher
    }
    
    
    func loadData() {
        Task {
            do {
                let list = try await fetcher.fetchRecipes()
                await MainActor.run {
                    self.recipes = list
                    self.isLoading = false
                }
            } catch {
                print(error)
                await MainActor.run {
                    self.failedFetch = true
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                    self.recipes = []
                }
            }
        }
    }
    
    func retry() {
        self.failedFetch = false
        self.errorMessage = nil
        self.isLoading = true
        self.recipes = []
        loadData()
    }
}

