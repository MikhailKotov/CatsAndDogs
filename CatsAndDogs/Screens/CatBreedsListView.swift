//
//  CatBreedsListView.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//

import SwiftUI

struct CatBreedsListView: View {
    @StateObject var viewModel: CatBreedsViewModel

    // Two-column flexible layout
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.breeds) { breed in
                            NavigationLink(destination: CatBreedDetailView(breed: breed)) {
                                CatBreedCardView(breed: breed)
                                    .frame(width: (geometry.size.width - 32 - 16) / 2, height: (geometry.size.width - 32 - 16) / 2)
                                    .onAppear {
                                        viewModel.loadNextPageOfBreeds()
                                    }
                            }
                        }
                    }
                }
                .padding(16)
            }
            .navigationTitle("Cat Breeds")
            .onAppear {
                guard viewModel.breeds.isEmpty, !viewModel.isLoadingPage else { return }
                viewModel.loadNextPageOfBreeds()
            }
            .alert(isPresented: $viewModel.error.isNotNil()) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.error?.localizedDescription ?? "Something went wrong"),
                    dismissButton: .default(Text("Ok"))
                )
            }
            Text("No Selection")
                .font(.headline)
        }
    }
}
