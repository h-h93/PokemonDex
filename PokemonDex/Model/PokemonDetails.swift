//
//  PokemonStats.swift
//  PokemonDex
//
//  Created by hanif hussain on 08/03/2024.
//

import Foundation
// flavor text, capture rate, gender rate, is legendary, is mythical 

// MARK: - PokemonStats
struct PokemonDetails: Codable {
    let baseHappiness, captureRate: Int
    let color: Color
    let eggGroups: [Color]
    let evolutionChain: EvolutionChain
    let evolvesFromSpecies: Color?
    let flavorTextEntries: [FlavorTextEntry]
    let formDescriptions: [String]
    let formsSwitchable: Bool
    let genderRate: Int
    let genera: [Genus]
    let generation, growthRate, habitat: Color
    let hasGenderDifferences: Bool
    let hatchCounter, id: Int
    let isBaby, isLegendary, isMythical: Bool
    let name: String
    let names: [Name]
    let order: Int
    let palParkEncounters: [PalParkEncounter]
    let pokedexNumbers: [PokedexNumber]
    let shape: Color
    let varieties: [Variety]
}

// MARK: - Color
struct Color: Codable {
    let name: String
    let url: String
}

// MARK: - EvolutionChain
struct EvolutionChain: Codable {
    let url: String
}

// MARK: - FlavorTextEntry
struct FlavorTextEntry: Codable {
    let flavorText: String
    let language, version: Color
}

// MARK: - Genus
struct Genus: Codable {
    let genus: String
    let language: Color
}

// MARK: - Name
struct Name: Codable {
    let language: Color
    let name: String
}

// MARK: - PalParkEncounter
struct PalParkEncounter: Codable {
    let area: Color
    let baseScore, rate: Int
}

// MARK: - PokedexNumber
struct PokedexNumber: Codable {
    let entryNumber: Int
    let pokedex: Color
}

// MARK: - Variety
struct Variety: Codable {
    let isDefault: Bool
    let pokemon: Color
}
