//
//  Environment.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 10/01/2025.
//

import Foundation

enum EnvironmentKey {
    case production
    case test

    var container: EnvironmentContainer {
        switch self {
        case .test:
            let baseURL = "https://api.thecatapi.com/v1/breeds"
            let apiKey = "APIKEY"
            return .init(baseURL: baseURL, apiKey: apiKey)
        case .production:
            let baseURL = "https://api.thecatapi.com/v1/breeds"
            let apiKey = "APIKEY"
            return .init(baseURL: baseURL, apiKey: apiKey)
        }
    }
}

struct EnvironmentContainer {
    let baseURL: String
    let apiKey: String
}
