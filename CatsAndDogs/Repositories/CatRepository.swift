//
//  CatRepositoryProtocol.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//

import Foundation

protocol CatRepository {
    func get(page: Int, limit: Int) async throws -> [Breed]
}

final class CatRepositoryImpl: CatRepository {
    private let service: CatServiceProtocol

    init(service: CatServiceProtocol) {
        self.service = service
    }

    /// Fetches the next page of breeds if more data is available and return all breeds.
    func get(page: Int, limit: Int) async throws -> [Breed] {
            try await service.fetchBreeds(limit: limit, page: page)
    }
}
