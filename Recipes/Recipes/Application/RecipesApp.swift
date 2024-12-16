//
//  RecipesApp.swift
//  Recipes
//
//  Created by Cody Morley on 12/15/24.
//

import SwiftUI


@main
struct RecipesApp: App {
    var body: some Scene {
        WindowGroup {
            RecipesListView(viewModel: RecipesListViewModel(fetcher: RecipeFetcher())) ///For end to end testing of behavior with bad or empty data use MalformedDataFetcher or EmptyDataFetcher instead.
        }
    }
}
