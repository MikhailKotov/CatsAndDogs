//
//  Breed.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//

import Foundation

// MARK: - Breed

struct Breed: Identifiable, Codable {
    let id: String
    // Main fields
    let weight: Weight
    let name: String
    let cfaUrl: String?
    let vetstreetUrl: String?
    let vcahospitalsUrl: String?
    let temperament: String?
    let origin: String?
    let countryCodes: String?
    let countryCode: String?
    let description: String?
    let lifeSpan: String?
    let indoor: Int?
    let lap: Int?
    let altNames: String?
    let adaptability: Int?
    let affectionLevel: Int?
    let childFriendly: Int?
    let dogFriendly: Int?
    let energyLevel: Int?
    let grooming: Int?
    let healthIssues: Int?
    let intelligence: Int?
    let sheddingLevel: Int?
    let socialNeeds: Int?
    let strangerFriendly: Int?
    let vocalisation: Int?
    let experimental: Int?
    let hairless: Int?
    let natural: Int?
    let rare: Int?
    let rex: Int?
    let suppressed_tail: Int?
    let shortLegs: Int?
    let wikipediaUrl: String?
    let hypoallergenic: Int?
    let referenceImageId: String?
    let image: Photo?
}
