//
//  Models.swift
//  ParsingJSON
//
//  Created by Victor Kimpel on 3.08.22.
//

import Foundation

struct Result: Codable {
    let data: [ResultItem]
}

struct ResultItem: Codable {
    let title: String
    let character: [String]
}
