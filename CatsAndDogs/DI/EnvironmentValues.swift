//
//  EnvironmentValues.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 28/12/2024.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var imageSession: URLSession = {
        let configuration = URLSessionConfiguration.default

        // Enabling a disk & memory cache and prefer cached data
        configuration.urlCache = URLCache(
            memoryCapacity: 512 * 1024 * 1024, // 512 MB
            diskCapacity: 1024 * 1024 * 1024, // 1 GB
            diskPath: "com.catsanddogs.imagecache"
        )
        configuration.requestCachePolicy = .returnCacheDataElseLoad

        return URLSession(configuration: configuration)
    }()
}
