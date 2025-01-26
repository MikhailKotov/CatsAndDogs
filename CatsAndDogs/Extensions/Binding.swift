//
//  Binding.swift
//  CatsAndDogs
//
//  Created by Mykhailo Kotov on 26/01/2025.
//

import SwiftUI

extension Binding {
    func isNotNil<T>() -> Binding<Bool> where Value == T? {
        .init(get: {
            wrappedValue != nil
        }, set: { _ in
            wrappedValue = nil
        })
    }
}
