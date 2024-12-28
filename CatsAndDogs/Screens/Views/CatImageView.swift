//
//  CatImageView.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 28/12/2024.
//

import SwiftUI

struct CatImageView: View {
    @Environment(\.imageSession) var imageSession
    @State var breed: Breed

    var body: some View {
        // Show breed image (if available)
        if let urlString = breed.image?.url,
           let url = URL(string: urlString)
        {
            CustomAsyncImage(url: url, success: { image in
                ZStack {
                    image
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 9)
                        .opacity(0.5)
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300, maxHeight: 300)
                }
            }, placeholder: {
                ProgressView()
            }, session: imageSession)
        } else {
            // No image
            Rectangle()
                .fill(.gray)
                .overlay {
                    Image(.cat)
                        .resizable()
                        .scaledToFit()
                        .padding(16)
                }
        }
    }
}
