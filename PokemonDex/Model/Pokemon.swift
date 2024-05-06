//
//  Pokemon.swift
//  PokemonDex
//
//  Created by hanif hussain on 05/03/2024.
//

import Foundation

// MARK: - Response
struct PokemonAPIResponse: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Result]
    
}

// MARK: - Result
struct Result: Codable {
    let name: String
    let url: String
}

// MARK: - Pokemon
struct Pokemon: Codable, Hashable {
    let name: String
    let url: String
    let artworkURL: String
}
