//
//  CatService.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//

import Foundation

protocol CatServiceProtocol {
    func fetchBreeds(limit: Int, page: Int) async throws -> [Breed]
}

final class CatService: CatServiceProtocol {
    private let session: URLSession
    private let baseURL: String
    private let apiKey: String

    init(apiKey: String, baseURL: String) {
        self.session = {
            let configuration = URLSessionConfiguration.default
            configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
            return URLSession(configuration: configuration)
        }()
        self.apiKey = apiKey
        self.baseURL = baseURL
    }

    func fetchBreeds(limit: Int, page: Int) async throws -> [Breed] {
        guard var urlComponents = URLComponents(string: baseURL) else {
            throw URLError(.badURL)
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "page", value: "\(page)"),
        ]
        guard let url = urlComponents.url else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        // The Cat API expects an "x-api-key" header
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        print(request.url?.absoluteString ?? "N/A")
        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            throw URLError(.badServerResponse)
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode([Breed].self, from: data)
        } catch {
            print(error)
            print("\n\n\n")
            print(String(data: data, encoding: .utf8))
            print("\n\n\n")
            throw error
        }
    }
}
