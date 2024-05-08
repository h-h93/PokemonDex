import UIKit

extension PokemonDetailVC: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonImagesCount
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PKDexPokemonImageSlideShowCell.reuseID, for: indexPath) as! PKDexPokemonImageSlideShowCell
        
        if let stats = stats {
            switch indexPath.item {
            case 0:
                cell.set(url: BaseURLs.baseImageUrl, stat: stats, pokemonID: pokemon.id)
            case 1:
                cell.set(url: BaseURLs.baseImageShinyUrl, stat: stats, pokemonID: pokemon.id)
            case 2:
                cell.set(url: BaseURLs.baseImageHomeUrl, stat: stats, pokemonID: pokemon.id)
            case 3:
                cell.set(url: BaseURLs.baseImageHomeShinyUrl, stat: stats, pokemonID: pokemon.id)
            default:
                break
            }
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableRowDisplayCount
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = processDetailsForDisplay(index: indexPath.row)
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    
    func processDetailsForDisplay(index: Int) -> String {
        switch index {
        case 0:
            let text = "Description: \n\n\(details?.flavorTextEntries?.first?.flavorText.stripPokedexCharacters ?? "")"
            return text
            
        case 1:
            return "Capture Rate: \n\(details?.captureRate ?? 0)%"
            
        case 2:
            return "Gender Rate: \n\(details?.genderRate ?? 0)"
            
        case 3:
            return "Legendary?: \n\(details?.isLegendary ?? false)"
            
        case 4:
            return "Mythical?: \n\(details?.isMythical ?? false)"
            
        default:
            return ""
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableRowDisplayHeight
    }
    
}

