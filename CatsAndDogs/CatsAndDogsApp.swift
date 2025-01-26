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
            let viewModel = CatBreedsViewModel()
            CatBreedsListView(viewModel: viewModel)
        }
    }
}
