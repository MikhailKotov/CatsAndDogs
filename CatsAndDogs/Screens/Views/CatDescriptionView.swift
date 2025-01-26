//
//  CatDescriptionView.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 28/12/2024.
//

import SwiftUI

struct CatDescriptionView: View {
    @State var breed: Breed

    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 16) {
                // Description
                Text(breed.description ?? "No Description Available")
                    .font(.body)
                // MARK: - Fun Facts Section
                funFact
                // MARK: - Wikipedia Link
                if let wikiURLString = breed.wikipediaUrl,
                   let wikiURL = URL(string: wikiURLString)
                {
                    wikiLink(wikiURL)
                }
                Spacer()
            }
        }
    }

    private var funFact: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Fun Facts")
                .font(.headline)
                .underline()

            if let temperament = breed.temperament {
                HStack(alignment: .top) {
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

            if let lifeSpan = breed.lifeSpan {
                HStack {
                    Text("🕓 Life Span:")
                        .fontWeight(.semibold)
                    Text("\(lifeSpan) years")
                }
            }

            if let energyLevel = breed.energyLevel {
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
        .padding(0)
    }

    private func wikiLink(_ url: URL) -> some View {
        Link(destination: url) {
            HStack {
                Text("🔍 Find more on Wikipedia")
                Image(systemName: "link.circle.fill")
            }
            .foregroundColor(.blue)
        }
        .padding(.vertical, 12)
    }
}
