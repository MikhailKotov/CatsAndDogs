//
//  CatBreedDetailView.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//

import SwiftUI

struct CatBreedDetailView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    let breed: Breed

    var body: some View {
        if sizeClass == .compact {
            VStack(spacing: 16) {
                CatImageView(breed: breed)
                    .frame(width: 300, height: 300)
                    .clipShape(.rect)
                    .cornerRadius(16)
                CatDescriptionView(breed: breed)
            }
            .padding(.top)
            .navigationTitle(breed.name)
        } else {
            HStack(alignment: .top, spacing: 16) {
                CatImageView(breed: breed)
                    .frame(width: 300, height: 300)
                    .clipShape(.rect)
                    .cornerRadius(16)
                CatDescriptionView(breed: breed)
            }
            .padding(.top)
            .navigationTitle(breed.name)
        }
    }
}
