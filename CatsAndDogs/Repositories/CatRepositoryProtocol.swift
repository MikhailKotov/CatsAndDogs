//
//  CatBreedsRepositoryProtocol.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//


import Foundation

@MainActor
protocol CatRepositoryProtocol: AnyObject {
    func getInitialBreeds() async -> [Breed]
    func getNextPage() async -> [Breed]
    func resetPagination()
}

final class CatRepository: CatRepositoryProtocol {
    
    private let service: CatServiceProtocol
    private let limit: Int
    private var currentPage: Int
    private var hasMoreData: Bool
    
    // In-memory storage of already fetched breeds
    private var allBreeds: [Breed] = []
    
    init(service: CatServiceProtocol, limit: Int = 10) {
        self.service = service
        self.limit = limit
        self.currentPage = 0
        self.hasMoreData = true
    }
    
    /// Fetches the first page of breeds (page = 0).
    @MainActor
    func getInitialBreeds() async -> [Breed] {
        resetPagination()
        return await getNextPage()
    }
    
    /// Fetches the next page of breeds if more data is available and return all breeds.
    @MainActor
    func getNextPage() async -> [Breed] {
        guard hasMoreData else {
            return allBreeds
        }
        do {
            let fetchedBreeds = try await service.fetchBreeds(limit: limit, page: currentPage)
            if fetchedBreeds.count < limit {
                hasMoreData = false
            }
            currentPage += 1
            print(">> Fetched \(fetchedBreeds.count) breeds, current page: \(currentPage).\n    Ids:\n      \(fetchedBreeds.map(\.id).joined(separator: "\n     "))")
            allBreeds.append(contentsOf: fetchedBreeds)
            return allBreeds
        } catch {
            print("Error fetching next page: \(error)")
            // In case of error, we might assume we can try again, so we won't set hasMoreData = false
            return allBreeds
        }
    }
    
    /// Reset pagination and clear cache
    @MainActor
    func resetPagination() {
        allBreeds = []
        currentPage = 0
        hasMoreData = true
    }
}
