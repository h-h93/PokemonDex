//
//  Pokemon.swift
//  PokemonDex
//
//  Created by hanif hussain on 05/03/2024.
//

import Foundation

// MARK: - Pokemon
struct Result: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Pokemon]
    
}

// MARK: - Result
struct Pokemon: Codable, Hashable {
    let name: String
    let url: String
}
