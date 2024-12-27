//
//  CatBreedCardView.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//

import SwiftUI

struct CatBreedCardView: View {
    @State var breed: Breed

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            ZStack {
                // Load image
                if let urlString = breed.image?.url,
                   let url = URL(string: urlString) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: width, height: width)
                } else {
                    // No image
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: width, height: width)
                        .overlay{
                            Image(.cat)
                                .resizable()
                                .padding(16)
                        }
                }
                VStack {
                    Spacer()
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, .gray]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: width/4.0)
                    .frame(maxWidth: .infinity)       // Expand horizontally
                    .overlay(
                        // 3. Text on top of the gradient
                        Text(breed.name)
                            .font(.caption)
                            .lineLimit(2)
                            .foregroundColor(.primary)
                            .padding(.bottom, 8)
                            .padding(.horizontal, 16),
                        alignment: .bottomLeading
                    )
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }

}
