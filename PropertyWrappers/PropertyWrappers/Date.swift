//
//  Date.swift
//  PropertyWrappers
//
//  Created by Victor Kimpel on 20.09.22.
//

import Foundation

@propertyWrapper
struct DateWrapper {
    var wrappedValue: Date {
        didSet {
            DateFormatter().string(from: wrappedValue)
        }
    }
    
    init(wrappedValue: Date) {
        self.wrappedValue = wrappedValue
    }
}
