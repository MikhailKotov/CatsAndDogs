//
//  GetInitialBreedsUseCase 2.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 26/01/2025.
//


protocol GetNextBreedsUseCase {
    func execute(page: Int, limit: Int) async throws -> [Breed]
}

final class GetNextBreedsUseCaseImpl: GetNextBreedsUseCase {
    private let repository: CatRepository

    init(repository: CatRepository) {
        self.repository = repository
    }
    
    func execute(page: Int, limit: Int) async throws -> [Breed] {
        return try await repository.get(page: page, limit: limit)
    }
}
