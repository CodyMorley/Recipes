//
//  RecipesListView.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import SwiftUI


struct RecipesListView: View {
    @StateObject private var vm: RecipesListViewModel
    
    
    init(viewModel: RecipesListViewModel) {
        _vm = StateObject(wrappedValue: viewModel)
    }

    
    var body: some View {
        VStack {
            if vm.isLoading {
                VStack(spacing: 8) {
                    ProgressView()
                    Text("Loading...")
                }
            } else if vm.failedFetch {
                VStack(spacing: 8) {
                    Text("Failed to fetch recipes from host")
                    Text("Error: \(vm.errorMessage ?? "Unknown error")")
                        .font(.footnote)
                        .padding(.horizontal, 32)
                    Button("Retry") {
                        vm.retry()
                    }
                }
            } else {
                List(vm.recipes) { recipe in
                    Button(action: {
                        vm.selectedRecipe = recipe
                    }) {
                        RecipeCellView(recipe: recipe)
                    }
                    .padding(.vertical, 2)
                }
                .listStyle(InsetGroupedListStyle())
                .sheet(item: $vm.selectedRecipe) { recipe in
                    RecipeDetailView(recipe: recipe)
                }
            }
        }
        .task {
            vm.loadData()
        }
    }
}


#Preview {
    RecipesListView(viewModel: RecipesListViewModel(fetcher: PreviewDataFetcher()))
}
