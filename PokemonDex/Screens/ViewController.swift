import UIKit

class ViewController: PKDexLoadingAnimationVC {
    enum Section {
        case main
    }
    
    var collectionView: PKDexCollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Pokemon>!
    
    var pokemon: [Pokemon] = []
    var filteredPokemon: [Pokemon] = []
    var offset = 0
    var offsetIncrementValue = 20
    var hasMorePokemon = true
    var isLoadingMorePokemon = false
    var isSearching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationView()
        configureSearchController()
        configureCollectionView()
        configureDataSource()
        getPokemon(offset: offset)
    }
    
    
    func configureNavigationView() {
        title = "Pokemon"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search for a Pokemon"
        searchController.obscuresBackgroundDuringPresentation = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
    
    func configureCollectionView() {
        view.backgroundColor = .systemBackground
        collectionView = PKDexCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(PKDexCollectionViewCell.self, forCellWithReuseIdentifier: PKDexCollectionViewCell.reuseID)
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    func getPokemon(offset: Int) {
        showLoadingView()
        isLoadingMorePokemon = true
        
        defer {
            isLoadingMorePokemon = false
            dismissLoadingView()
        }
        
        Task {
            if hasMorePokemon {
                let response = try await NetworkManager.shared.getPokemon(offset: offset)
                let pokemon = response.0
                updateUI(with: pokemon)
                checkHasMorePokemon(url: response.1.next)
            }
        }
    }
    
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Pokemon>(collectionView: collectionView, cellProvider: {
            collectionView, indexPath, pokemon in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PKDexCollectionViewCell.reuseID, for: indexPath) as! PKDexCollectionViewCell
            cell.set(pokemon: pokemon)
            return cell
        })
    }
    
    
    func checkHasMorePokemon(url: String) {
        if url.isEmpty || url != "" {
            hasMorePokemon = true
        } else {
            hasMorePokemon = false
        }
    }
    
    
    func updateUI(with pokemon: [Pokemon]) {
        self.pokemon.append(contentsOf: pokemon)
        updateData(on: self.pokemon)
    }
    
    
    func updateData(on pokemon: [Pokemon]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Pokemon>()
        snapshot.appendSections([.main])
        snapshot.appendItems(pokemon)
        DispatchQueue.main.async { [weak self] in self?.dataSource.apply(snapshot, animatingDifferences: true) }
    }
}


extension ViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let ContentHeight = scrollView.contentSize.height
        let height = view.frame.size.height
        
        if offsetY > ContentHeight - height {
            guard hasMorePokemon, !isLoadingMorePokemon else { return }
            offset += offsetIncrementValue
            getPokemon(offset: offset)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemonDetailVC = PokemonDetailVC(pokemon: pokemon[indexPath.item])
        navigationController?.pushViewController(pokemonDetailVC, animated: true)
    }
}


extension ViewController: UISearchControllerDelegate, UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            filteredPokemon.removeAll()
            isSearching = false
            updateData(on: pokemon)
            return
        }
        
        isSearching = true
        filteredPokemon = pokemon.filter {$0.name.lowercased().contains(filter.lowercased())}
        updateData(on: filteredPokemon)
    }
}
