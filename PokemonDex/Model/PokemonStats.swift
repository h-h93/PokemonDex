// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pokemonDetails = try? JSONDecoder().decode(PokemonDetails.self, from: jsonData)

import Foundation

// MARK: - PokemonDetails
struct PokemonStats: Codable {
    let abilities: [Ability]?
    let baseExperience: Int?
    let cries: Cries?
    let forms: [Species]?
    let gameIndices: [GameIndex]?
    let height: Int?
    let heldItems: [String]?
    let id: Int?
    let isDefault: Bool?
    let locationAreaEncounters: String?
    let moves: [Move]?
    let name: String?
    let order: Int?
    let pastAbilities, pastTypes: [String]?
    let species: Species?
    let sprites: Sprites?
    let stats: [Stat]
    let types: [TypeElement]?
    let weight: Int?
}

// MARK: - Ability
struct Ability: Codable {
    let ability: Species?
    let isHidden: Bool?
    let slot: Int?
}

// MARK: - Species
struct Species: Codable {
    let name: String?
    let url: String?
}

// MARK: - Cries
struct Cries: Codable {
    let latest, legacy: String?
}

// MARK: - GameIndex
struct GameIndex: Codable {
    let gameIndex: Int?
    let version: Species?
    
    enum CodingKeys: String, CodingKey {
        case gameIndex
        case version
    }
}

// MARK: - Move
struct Move: Codable {
    let move: Species?
    let versionGroupDetails: [VersionGroupDetail]?
    
    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails
    }
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int?
    let moveLearnMethod, versionGroup: Species?
    
    enum CodingKeys: String, CodingKey {
        case levelLearnedAt
        case moveLearnMethod
        case versionGroup
    }
}

// MARK: - GenerationV
struct GenerationV: Codable {
    let blackWhite: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case blackWhite
    }
}

// MARK: - GenerationIv
struct GenerationIv: Codable {
    let diamondPearl, heartgoldSoulsilver, platinum: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case diamondPearl
        case heartgoldSoulsilver
        case platinum
    }
}

// MARK: - Versions
struct Versions: Codable {
    let generationI: GenerationI?
    let generationIi: GenerationIi?
    let generationIii: GenerationIii?
    let generationIv: GenerationIv?
    let generationV: GenerationV?
    let generationVi: [String: Home]?
    let generationVii: GenerationVii?
    let generationViii: GenerationViii?
    
    enum CodingKeys: String, CodingKey {
        case generationI
        case generationIi
        case generationIii
        case generationIv
        case generationV
        case generationVi
        case generationVii
        case generationViii
    }
}

// MARK: - Other
struct Other: Codable {
    let dreamWorld: DreamWorld?
    let home: Home?
    let officialArtwork: OfficialArtwork?
    let showdown: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case dreamWorld
        case home
        case officialArtwork
        case showdown
    }
}

// MARK: - Sprites
class Sprites: Codable {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
    let other: Other?
    let versions: Versions?
    let animated: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case backDefault
        case backFemale
        case backShiny
        case backShinyFemale
        case frontDefault
        case frontFemale
        case frontShiny
        case frontShinyFemale
        case other, versions, animated
    }
    
    init(backDefault: String?, backFemale: String?, backShiny: String?, backShinyFemale: String?, frontDefault: String?, frontFemale: String?, frontShiny: String?, frontShinyFemale: String?, other: Other?, versions: Versions?, animated: Sprites?) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
        self.other = other
        self.versions = versions
        self.animated = animated
    }
}

// MARK: - GenerationI
struct GenerationI: Codable {
    let redBlue, yellow: RedBlue?
    
    enum CodingKeys: String, CodingKey {
        case redBlue
        case yellow
    }
}

// MARK: - RedBlue
struct RedBlue: Codable {
    let backDefault, backGray, backTransparent, frontDefault: String?
    let frontGray, frontTransparent: String?
    
    enum CodingKeys: String, CodingKey {
        case backDefault
        case backGray
        case backTransparent
        case frontDefault
        case frontGray
        case frontTransparent
    }
}

// MARK: - GenerationIi
struct GenerationIi: Codable {
    let crystal: Crystal?
    let gold, silver: Gold?
}

// MARK: - Crystal
struct Crystal: Codable {
    let backDefault, backShiny, backShinyTransparent, backTransparent: String?
    let frontDefault, frontShiny, frontShinyTransparent, frontTransparent: String?
    
    enum CodingKeys: String, CodingKey {
        case backDefault
        case backShiny
        case backShinyTransparent
        case backTransparent
        case frontDefault
        case frontShiny
        case frontShinyTransparent
        case frontTransparent
    }
}

// MARK: - Gold
struct Gold: Codable {
    let backDefault, backShiny, frontDefault, frontShiny: String?
    let frontTransparent: String?
    
    enum CodingKeys: String, CodingKey {
        case backDefault
        case backShiny
        case frontDefault
        case frontShiny
        case frontTransparent
    }
}

// MARK: - GenerationIii
struct GenerationIii: Codable {
    let emerald: OfficialArtwork?
    let fireredLeafgreen, rubySapphire: Gold?
    
    enum CodingKeys: String, CodingKey {
        case emerald
        case fireredLeafgreen
        case rubySapphire
    }
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    let frontDefault, frontShiny: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault
        case frontShiny
    }
}

// MARK: - Home
struct Home: Codable {
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault
        case frontFemale
        case frontShiny
        case frontShinyFemale
    }
}

// MARK: - GenerationVii
struct GenerationVii: Codable {
    let icons: DreamWorld?
    let ultraSunUltraMoon: Home?
    
    enum CodingKeys: String, CodingKey {
        case icons
        case ultraSunUltraMoon
    }
}

// MARK: - DreamWorld
struct DreamWorld: Codable {
    let frontDefault: String?
    let frontFemale: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault
        case frontFemale
    }
}

// MARK: - GenerationViii
struct GenerationViii: Codable {
    let icons: DreamWorld?
}

// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int
    let stat: Species
    
    enum CodingKeys: String, CodingKey {
        case baseStat
        case effort, stat
    }
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int?
    let type: Species?
}
