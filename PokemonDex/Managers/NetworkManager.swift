import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private let decoder = JSONDecoder()
    let cache = NSCache<NSString,UIImage>()
    
    private init() { 
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    
    func getPokemon(offset: Int) async throws -> ([Pokemon], PokemonAPIResponse) {
        let endpoint = BaseURLs.baseUrl.rawValue + "\(offset)"
        guard let url = URL(string: endpoint) else { throw PKDexError.invalidUrl}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw PKDexError.unableToComplete }
        
        do {
            let results = try decoder.decode(PokemonAPIResponse.self, from: data)
            let pokemon = await convertResponseToPokemon(results: results)
            return (pokemon, results)
        } catch {
            throw PKDexError.unableToComplete
        }
    }
    
    
    func convertResponseToPokemon(results: PokemonAPIResponse) async -> [Pokemon] {
        var pokemon: [Pokemon] = []
        
        for item in results.results {
            let url: String = item.url
            let pokemonNumber = url.getPokemonNumberFromUrl(urlString: url) ?? ""
            let pokemonInformation = Pokemon(name: item.name, url: item.url, artworkURL: BaseURLs.baseImageUrl.rawValue+pokemonNumber+".png", id: pokemonNumber)
            pokemon.append(pokemonInformation)
        }
        
        return pokemon
    }
    
    
    func getPokemonDetails(for name: String) async throws -> PokemonDetails {
        let urlString = BaseURLs.baseStatUrl.rawValue + "\(name)/"
        guard let url = URL(string: urlString) else { throw PKDexError.invalidUrl }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw PKDexError.unableToComplete }
        
        do {
            let results = try decoder.decode(PokemonDetails.self, from: data)
            return results
        } catch {
            throw PKDexError.unableToComplete
        }
    }
    
    
    func downloadImage(fromUrl urlString: String) async -> UIImage? {
        guard let url = URL(string: urlString) else { return nil }
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) { return image }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return nil }
            cache.setObject(image, forKey: cacheKey)
            return image
        } catch {
            return nil
        }
    }
    
    
    func getDetailedStats(for pokemon: String) async throws -> PokemonStats {
        guard let url = URL(string: pokemon) else { throw PKDexError.invalidUrl }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw PKDexError.unableToComplete }
        
        do {
            let results = try decoder.decode(PokemonStats.self, from: data)
            return results
        } catch {
            throw(PKDexError.unableToComplete)
        }
    }
}
