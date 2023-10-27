//
//  Result.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 27.10.2023.
//

import Foundation

struct Result: Codable {
    var query: Query
    
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    var pageid: Int
    var title: String
    let terms: [String: [String]]?
}
