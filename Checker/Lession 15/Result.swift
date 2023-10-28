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

struct Page: Codable, Comparable {
    var pageid: Int
    var title: String
    let terms: [String: [String]]?
    
    var description: String {
        terms?["description"]?.first ?? "No further information"
    }
    
    static func <(lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
}
