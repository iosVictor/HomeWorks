//
//  ObjectList.swift
//  FilterableListOfObjects
//
//  Created by Victor Kimpel on 20.09.22.
//

import SwiftUI

struct Car: Identifiable, Comparable {
    static func < (lhs: Car, rhs: Car) -> Bool {
        return lhs.brand < rhs.brand
    }
    
    let id = UUID()
    let brand: String
    var isFiltered: Bool = false
}
    
class BrandListViewModel: ObservableObject {
    
    @Published private(set) var toggleBrand = "Filter cars by brand"
    @Published var isFiltered: Bool = false
    
    @Published var cars: [Car] = [
        .init(brand: "Volkswagen"),
        .init(brand: "Ford"),
        .init(brand: "Mazda"),
        .init(brand: "Land Rover"),
        .init(brand: "Jaguar"),
        .init(brand: "Toyota"),
        .init(brand: "Lexus"),
        .init(brand: "Kia"),
        .init(brand: "Mitsubishi"),
        .init(brand: "Honda")
    ]
}
