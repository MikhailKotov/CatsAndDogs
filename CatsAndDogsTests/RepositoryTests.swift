//
//  RepositoryTests.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//

import Testing
@testable import CatsAndDogs

struct RepositoryTests {
    @Test func testGetInitialBreeds() async throws {
        let mockService = MockCatService()
        mockService.firstPageBreeds = [
            Breed(id: "0", name: "Breed1"),
            Breed(id: "1", name: "Breed2"),
            Breed(id: "2", name: "Breed3")
        ]

        let repository = await CatRepository(service: mockService, limit: 3)
        let breeds = await repository.getInitialBreeds()
        
        #expect(breeds.count == 3)
        #expect(breeds.first?.name == "Breed1")
        #expect(breeds.first?.id == "0")
    }

    @Test func testGetNextPage() async {
        let mockService = MockCatService()
        mockService.firstPageBreeds = [
            Breed(id: "0", name: "Breed1"),
            Breed(id: "1", name: "Breed2"),
            Breed(id: "2", name: "Breed3")
        ]
        mockService.secondPageBreeds = [
            Breed(id: "3", name: "Breed4"),
            Breed(id: "4", name: "Breed5")
        ]
        // Arrange
        let repository = await CatRepository(service: mockService, limit: 3)
        var breeds = await repository.getInitialBreeds()
        #expect(breeds.count == 3)
        breeds = await repository.getNextPage()
        #expect(breeds.count == 5)
        #expect(breeds.first?.id == "0")
        #expect(breeds.last?.id == "4")
        #expect(breeds.last?.name == "Breed5")
        breeds = await repository.getNextPage()
        #expect(breeds.count == 5) // Nothing happens
    }

    @Test func testClearPage() async {
        let mockService = MockCatService()
        mockService.firstPageBreeds = [
            Breed(id: "0", name: "Breed1"),
            Breed(id: "1", name: "Breed2"),
            Breed(id: "2", name: "Breed3")
        ]
        mockService.secondPageBreeds = [
            Breed(id: "3", name: "Breed4"),
            Breed(id: "4", name: "Breed5")
        ]
        let repository = await CatRepository(service: mockService, limit: 3)
        var breeds = await repository.getInitialBreeds()
        #expect(breeds.count == 3)
        breeds = await repository.getNextPage()
        #expect(breeds.count == 5)
        await repository.resetPagination()
        breeds = await repository.getNextPage()
        #expect(breeds.count == 3)
    }

    @Test func testLimitPage() async {
        let mockService = MockCatService()
        mockService.firstPageBreeds = [
            Breed(id: "0", name: "Breed1"),
            Breed(id: "1", name: "Breed2"),
            Breed(id: "2", name: "Breed3")
        ]
        mockService.secondPageBreeds = [
            Breed(id: "3", name: "Breed4"),
            Breed(id: "4", name: "Breed5")
        ]
        let repository = await CatRepository(service: mockService, limit: 10)
        var breeds = await repository.getInitialBreeds()
        #expect(breeds.count == 3)
        // we detect that previous request was last because request limit more then number of items in response
        breeds = await repository.getNextPage()
        #expect(breeds.count == 3)
    }

    @Test func testErrorFetching() async {
        let mockService = MockCatService()
        mockService.shouldThrowError = true
        let repository = await CatRepository(service: mockService, limit: 3)
        var breeds = await repository.getInitialBreeds()
        #expect(breeds.count == 0) // nothing was changed because error
        #expect(mockService.fetchBreedsCallCount == 1) // number of calls
        breeds = await repository.getNextPage()
        #expect(breeds.count == 0) // nothing was changed because error
        #expect(mockService.fetchBreedsCallCount == 2) // number of calls

    }
}
