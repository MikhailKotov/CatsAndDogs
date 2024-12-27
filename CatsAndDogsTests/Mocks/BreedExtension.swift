//
//  Breed+Extension.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//
@testable import CatsAndDogs

extension Breed {
    init(id: String, name: String) {
        self.init(
            id: id,
            weight: .init(imperial: "", metric: ""),
            name: name,
            cfa_url: nil, vetstreet_url: nil, vcahospitals_url: nil,
            temperament: nil, origin: nil, country_codes: nil, country_code: nil,
            description: nil, life_span: nil, indoor: nil, lap: nil, alt_names: nil,
            adaptability: nil, affection_level: nil, child_friendly: nil, dog_friendly: nil,
            energy_level: nil, grooming: nil, health_issues: nil, intelligence: nil,
            shedding_level: nil, social_needs: nil, stranger_friendly: nil, vocalisation: nil,
            experimental: nil, hairless: nil, natural: nil, rare: nil, rex: nil,
            suppressed_tail: nil, short_legs: nil, wikipedia_url: nil, hypoallergenic: nil,
            reference_image_id: nil, image: nil
        )
    }
}
