//
//  Trimmed.swift
//  PropertyWrappers
//
//  Created by Victor Kimpel on 19.09.22.
//

import Foundation

@propertyWrapper
struct Trimmed {
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get {
            return value
        }
        set {
            value = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}

struct Trim {
    @Trimmed var value: String
}
