import XCTest
@testable import PokemonDex

final class PokemonDexTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testNetworkCalls() async throws {
        let pokemonList = try await NetworkManager.shared.getPokemon(offset: 0)
        XCTAssertNotNil(pokemonList, "Pokemon unable to download or decode")
        
        let pokemon = pokemonList.0.first
        XCTAssert(pokemon != nil, "Pokemon unable to decode")
        
        let pokemonImage = await NetworkManager.shared.downloadImage(fromUrl: pokemon!.artworkURL)
        XCTAssert(pokemonImage != nil, "Failed to download image")
        
        let pokemonDetails = try await NetworkManager.shared.getPokemonDetails(for: pokemon!.name)
        XCTAssertNotNil(pokemonDetails, "Failed to get pokemon details")
        
        let pokemonStats = try await NetworkManager.shared.getDetailedStats(for: pokemon!.url)
        XCTAssertNotNil(pokemonStats, "Failed to get pokemon stats")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
