//
//  Container.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//

import Foundation
import Factory

extension Container {
    // MARK: - Service
    private var catService: Factory<CatServiceProtocol> {
        Factory(self) {
            CatService(apiKey: Config.shared.apiKey, baseURL: Config.shared.baseURL)
        }
    }

    // MARK: - Repository
    var catRepository: Factory<CatRepository> {
        Factory(self) {
            CatRepositoryImpl(service: self.catService())
        }
    }

    // MARK: - Use Cases
    var nextBreedUseCase: Factory<GetNextBreedsUseCase> {
        Factory(self) {
            GetNextBreedsUseCaseImpl(repository: self.catRepository())
        }
    }

}
