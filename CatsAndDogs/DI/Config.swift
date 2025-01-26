//
//  Config.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 10/01/2025.
//


import Foundation

struct Config {
    static let shared = Config()

    let apiKey: String
    let baseURL: String

    private init() {
        #if DEV
        apiKey = ""
        baseURL = ""
        #else // PROD
        apiKey = "live_UVs6JegVjd25LLtL7UHNpoQxzszMXaht2pJ9komCPG4KtKkfALFcQGrvc4eErrK8"
        baseURL = "https://api.thecatapi.com/v1/breeds"
        #endif
    }
}
