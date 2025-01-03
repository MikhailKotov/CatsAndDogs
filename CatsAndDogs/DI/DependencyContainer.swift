//
//  DependencyContainer.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//

import Foundation

final class DependencyContainer {
    init() {}

    // MARK: - Environment / Config

    private let apiKey = "API_KEY"
    private let baseURL = "https://api.thecatapi.com/v1/breeds"

    // MARK: - URLSession

    // Customize your URLSession if you want to enable system URLCache or custom headers.
    private lazy var urlSession: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData

        return URLSession(configuration: configuration)
    }()

    // MARK: - Service

    private lazy var catService: CatServiceProtocol = CatService(session: urlSession, apiKey: apiKey, baseURL: baseURL)

    // MARK: - Repository

    @MainActor
    private lazy var catRepository: CatRepositoryProtocol = CatRepository(service: catService)

    // MARK: - ViewModel Factory

    @MainActor
    func makeCatBreedsViewModel() -> CatBreedsViewModel {
        return CatBreedsViewModel(repository: catRepository)
    }
}
