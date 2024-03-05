//
//  NetworkManager.swift
//  PokemonDex
//
//  Created by hanif hussain on 05/03/2024.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    let decoder = JSONDecoder()
    
    private init() { }
    
    
    func getPokemon() async throws -> [Pokemon] {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20") else { throw PKDexError.unableToComplete }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw PKDexError.unableToComplete }
        
        do {
            let result = try decoder.decode(Result.self, from: data)
            return result.results
        } catch {
            print("Failed to decode")
            throw PKDexError.unableToComplete
        }
    }
}
