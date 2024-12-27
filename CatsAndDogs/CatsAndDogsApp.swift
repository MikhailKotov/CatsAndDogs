//
//  CatsAndDogsApp.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//

import SwiftUI

@main
struct CatsAndDogsApp: App {
    var body: some Scene {
        WindowGroup {
            let dependency = DependencyContainer()
            let viewModel = dependency.makeCatBreedsViewModel()
            CatBreedsListView(viewModel: viewModel)
        }
    }
}
