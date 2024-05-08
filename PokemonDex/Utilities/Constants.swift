import UIKit

enum BaseURLs: String {
    case baseUrl = "https://pokeapi.co/api/v2/pokemon?limit=20&offset="
    case basePokemonURL = "https://pokeapi.co/api/v2/pokemon/"
    case baseStatUrl = "https://pokeapi.co/api/v2/pokemon-species/"
    case baseImageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
    case baseImageShinyUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/"
    case baseImageHomeUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/"
    case baseImageHomeShinyUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/"
}

