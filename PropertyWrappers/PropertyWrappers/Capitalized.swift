//
//  Capitalized.swift
//  PropertyWrappers
//
//  Created by Victor Kimpel on 19.09.22.
//

import Foundation

@propertyWrapper
struct Capitalized {
    
    var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.capitalized
        }
    }
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}
