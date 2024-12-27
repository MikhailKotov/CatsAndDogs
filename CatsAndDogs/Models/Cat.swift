//
//  Cat.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 27/12/2024.
//

struct Cat: Codable, Identifiable {
    let id: String
    let url: String
    let width: Int?
    let height: Int?
    let breeds: [Breed]
}



