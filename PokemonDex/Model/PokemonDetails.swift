import Foundation

// MARK: - PokemonDetails
struct PokemonDetails: Codable {
    let baseHappiness, captureRate: Int?
    let color: Result?
    let eggGroups: [Result]?
    let evolutionChain: EvolutionChain?
    let evolvesFromSpecies: Result?
    let flavorTextEntries: [FlavorTextEntry]?
    let formDescriptions: [String]?
    let formsSwitchable: Bool?
    let genderRate: Int?
    let genera: [Genus]?
    let generation, growthRate, habitat: Result?
    let hasGenderDifferences: Bool?
    let hatchCounter, id: Int?
    let isBaby, isLegendary, isMythical: Bool?
    let name: String?
    let names: [Name]?
    let order: Int?
    let palParkEncounters: [PalParkEncounter]?
    let pokedexNumbers: [PokedexNumber]?
    let shape: Result?
    let varieties: [Variety]?
}

// MARK: - EvolutionChain
struct EvolutionChain: Codable {
    let url: String
}

// MARK: - FlavorTextEntry
struct FlavorTextEntry: Codable {
    let flavorText: String
    let language, version: Result
}

// MARK: - Genus
struct Genus: Codable {
    let genus: String
    let language: Result
}

// MARK: - Name
struct Name: Codable {
    let language: Result
    let name: String
}

// MARK: - PalParkEncounter
struct PalParkEncounter: Codable {
    let area: Result
    let baseScore, rate: Int
}

// MARK: - PokedexNumber
struct PokedexNumber: Codable {
    let entryNumber: Int
    let pokedex: Result
}

// MARK: - Variety
struct Variety: Codable {
    let isDefault: Bool
    let pokemon: Result
}
