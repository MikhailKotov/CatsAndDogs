//
//  CatImageView.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 28/12/2024.
//

import SwiftUI

struct CatImageView: View {
    @State var breed: Breed

    var body: some View {
        // Show breed image (if available)
        if let urlString = breed.image?.url,
           let url = URL(string: urlString)
        {
            AsyncImage(url: url) { image in
                ZStack {
                    image
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 9)
                        .opacity(0.5)
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                }
            } placeholder: {
                ProgressView()
            }
        } else {
            // No image
            Rectangle()
                .fill(.gray)
//                .frame(width: 300, height: 300)
                .overlay {
                    Image(.cat)
                        .resizable()
                        .scaledToFit()
                        .padding(16)
                }
        }
    }
}
