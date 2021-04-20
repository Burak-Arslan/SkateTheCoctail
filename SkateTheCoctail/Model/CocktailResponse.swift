//
//  CocktailResponse.swift
//  SkateTheCoctail
//
//  Created by Burak Arslan on 19.04.2021.
//

import Foundation

// MARK: - CocktailResponse
struct CocktailResponse: Codable {
    let drinks: [[String: String?]]
}
