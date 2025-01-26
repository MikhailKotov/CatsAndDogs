//
//  CatBreedsViewModel.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//

import Factory
import SwiftUI

@MainActor
class CatBreedsViewModel: ObservableObject {
    @Published var breeds: [Breed] = []
    @Published var error: Error?
    @Published var isLoadingPage = false
    @Published var isLastPage: Bool = false

    @ObservationIgnored
    @Injected(\.nextBreedUseCase) private var nextBreedUseCase
    private let limit: Int = 10
    @ObservationIgnored
    private var currentPage: Int = 0


    func loadNextPageOfBreeds() {
        Task {
            guard !isLastPage, !isLoadingPage else {
                return
            }
            isLoadingPage = true
            defer {
                isLoadingPage = false
            }
            do {
                let nextBreeds = try await nextBreedUseCase.execute(page: currentPage, limit: limit)
                guard !nextBreeds.isEmpty else {
                    isLastPage = true
                    return
                }
                currentPage += 1
                breeds.append(contentsOf: nextBreeds)
            } catch {
                self.error = error
            }
        }
    }
}
