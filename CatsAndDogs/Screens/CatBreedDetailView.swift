//
//  CatBreedDetailView.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//


import SwiftUI

struct CatBreedDetailView: View {
    let breed: Breed
    
    var body: some View {
        VStack(spacing: 16) {
            
            // Show breed image (if available)
            if let urlString = breed.image?.url,
               let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(maxWidth: .infinity, maxHeight: 300)
            } else {
                // No image
                Rectangle()
                    .fill(Color.gray)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .overlay{
                        Image(.cat)
                            .resizable()
                            .scaledToFit()
                            .padding(16)
                    }
            }

            // Breed name
            Text(breed.name)
                .font(.title)
                .padding(.horizontal)
            
            // Description
            Text(breed.description ?? "No Description Available")
                .font(.body)
                .padding(.horizontal)

            // MARK: - Fun Facts Section
            VStack(alignment: .leading, spacing: 12) {
                Text("Fun Facts")
                    .font(.headline)
                    .underline()

                if let temperament = breed.temperament {
                    HStack (alignment: .top) {
                        Text("💥 Temperament:")
                            .fontWeight(.semibold)
                        Text(temperament)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                    }
                }

                if let origin = breed.origin {
                    HStack {
                        Text("📍 Origin:")
                            .fontWeight(.semibold)
                        Text(origin)
                    }
                }

                if let lifeSpan = breed.life_span {
                    HStack {
                        Text("🕓 Life Span:")
                            .fontWeight(.semibold)
                        Text("\(lifeSpan) years")
                    }
                }

                if let energyLevel = breed.energy_level {
                    HStack {
                        Text("⚡ Energy Level:")
                            .fontWeight(.semibold)
                        Text("\(energyLevel)/5")
                    }
                }

                if let hairless = breed.hairless {
                    HStack {
                        Text("🎱 Hairless:")
                            .fontWeight(.semibold)
                        Text(hairless == 1 ? "Yes" : "No")
                    }
                }
            }
            // MARK: - Wikipedia Link
            if let wikiURLString = breed.wikipedia_url,
               let wikiURL = URL(string: wikiURLString) {
                Link(destination: wikiURL) {
                    HStack {
                        Text("🔍 Find more on Wikipedia")
                        Image(systemName: "link.circle.fill")
                    }
                    .foregroundColor(.blue)
                }
                .padding(.vertical, 12)
            }
            Spacer()
        }
        .padding(.top)
        .navigationTitle(breed.name)
    }
}
