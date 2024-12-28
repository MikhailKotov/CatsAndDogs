//
//  CustomAsyncImage.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 28/12/2024.
//


import SwiftUI

struct CustomAsyncImage<Success: View, Placeholder: View>: View {
    // The URL for the image
    let url: URL?

    let success: (Image) -> Success
    // A placeholder view while the image is loading or if it fails
    let placeholder: () -> Placeholder

    // A custom URLSession for handling requests
    let session: URLSession

    @State private var downloadedImage: Image?
    @State private var isLoading = false
    
    var body: some View {
        Group {
            if let image = downloadedImage {
                // SwiftUI Image from the loaded UIImage
                success(image)
            } else {
                // Show placeholder while loading or on failure
                placeholder()
            }
        }
        .task {
            await loadImage()
        }
    }

    private func loadImage() async {
        guard !isLoading else { return }
        isLoading = true
        defer { isLoading = false }
        
        guard let url else { return }
        
        do {
            let (data, _) = try await session.data(from: url)
            if let uiImage = UIImage(data: data) {
                downloadedImage = Image(uiImage: uiImage)
            }
        } catch {
            // Handle error; e.g., silently fail or log it
            print("Image download error:", error)
        }
    }
}
