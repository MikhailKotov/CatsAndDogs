//
//  CatBreedsViewModel.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//

import SwiftUI

@MainActor
class CatBreedsViewModel: ObservableObject {
    @Published var breeds: [Breed] = []
    @Published var isLoadingPage = false

    private let repository: CatRepositoryProtocol

    init(repository: CatRepositoryProtocol) {
        self.repository = repository
    }

    func loadInitialBreeds() {
        Task {
            isLoadingPage = true
            breeds = await repository.getInitialBreeds()
            isLoadingPage = false
        }
    }

    func loadNextPageIfNeeded(currentItem item: Breed?) {
        guard !isLoadingPage else { return }

        if let item = item, let lastItem = breeds.last {
            // If we are at the last item, load next page
            if item.id == lastItem.id {
                loadNextPage()
            }
        }
    }

    private func loadNextPage() {
        Task {
            isLoadingPage = true
            breeds = await repository.getNextPage()
            isLoadingPage = false
        }
    }
}
