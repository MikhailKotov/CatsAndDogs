//
//  MockCatBreedsService.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//


import Foundation
@testable import CatsAndDogs

final class MockCatService: CatServiceProtocol {
    
    var fetchBreedsCallCount = 0
    var shouldThrowError = false
    
    // You can customize these to simulate various scenarios
    var firstPageBreeds: [Breed] = []
    var secondPageBreeds: [Breed] = []
    var thirdPageBreeds: [Breed] = []

    func fetchBreeds(limit: Int, page: Int) async throws -> [Breed] {
        fetchBreedsCallCount += 1
        
        if shouldThrowError {
            throw URLError(.badServerResponse)
        }

        switch page {
        case 0: return firstPageBreeds
        case 1: return secondPageBreeds
        case 2: return thirdPageBreeds
        default: return []
        }
    }
}
