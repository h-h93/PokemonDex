import Foundation

// MARK: - PokemonStats
struct PokemonStats: Codable {
    let id: Int
    let name: String
    let height: Int
    let stats: [BaseStats]
    let types: [TypeElement]
    
}

struct BaseStats: Codable {
    let baseStat, effort: Int
    let stat: Result
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int
    let type: Result
}
