import UIKit
import SwiftUI

class PokemonDetailVC: PKDexLoadingAnimationVC {
    let tableView = UITableView()
    var pokemon: Pokemon!
    var details: PokemonDetails?
    var pokemonStats = [ChartData]()
    let tableRowDisplayCount: Int = 5
    let tableRowDisplayHeight: CGFloat = 200
    var pokemonStatsChart: PKDexStatsChartView!
    var pokemonStatsChartHostView: UIView!
    var scrollView = UIScrollView()
    var contentView = UIView()
    var pokemonImagesCollectionView: PKDexImageSlideCollectionView!
    var pokemonImagesCount = 4
    var stats: PokemonStats!
    
    init (pokemon: Pokemon) {
        super.init(nibName: nil, bundle: nil)
        self.pokemon = pokemon
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureScrollView()
        configurePokemonImagesCollection()
        configureTable()
        getPokemonStats()
    }
    
    
    func configure() {
        title = pokemon.name
        view.backgroundColor = .systemBackground
    }
    
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToSafeAreaEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 1000)
        ])
    }
    
    
    func configurePokemonImagesCollection() {
        pokemonImagesCollectionView = PKDexImageSlideCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        pokemonImagesCollectionView.register(PKDexPokemonImageSlideShowCell.self, forCellWithReuseIdentifier: PKDexPokemonImageSlideShowCell.reuseID)
        pokemonImagesCollectionView.delegate = self
        pokemonImagesCollectionView.dataSource = self
        contentView.addSubview(pokemonImagesCollectionView)
        
        NSLayoutConstraint.activate([
            pokemonImagesCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            pokemonImagesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pokemonImagesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pokemonImagesCollectionView.heightAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    
    func configureTable() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: pokemonImagesCollectionView.bottomAnchor, constant: 220),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    
    func getPokemonStats() {
        showLoadingView()
        defer {
            dismissLoadingView()
        }
        Task {
            do {
                stats = try await NetworkManager.shared.getDetailedStats(for: pokemon.url)
                processPokemonStats()
                details = try await NetworkManager.shared.getPokemonDetails(for: pokemon.name)
                DispatchQueue.main.async { [weak self] in
                    self?.configureChartView()
                    self?.tableView.reloadData()
                    self?.pokemonImagesCollectionView.reloadData()
                }
            } catch {
                if let error = error as? PKDexError {
                    presentPKDexAlert(title: "Oops", message: error.rawValue, buttonTitle: "Ok")
                }
            }
        }
    }
    
    
    func configureChartView() {
        pokemonStatsChart = PKDexStatsChartView(data: pokemonStats)
        // Define a hosting VC.
        // A UIKit view controller that manages a SwiftUI view hierarchy.
        let host = UIHostingController(rootView: pokemonStatsChart)
        pokemonStatsChartHostView = host.view!
        pokemonStatsChartHostView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pokemonStatsChartHostView)
        NSLayoutConstraint.activate([
            pokemonStatsChartHostView.topAnchor.constraint(equalTo: pokemonImagesCollectionView.bottomAnchor, constant: 5),
            pokemonStatsChartHostView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pokemonStatsChartHostView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pokemonStatsChartHostView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    func processPokemonStats() {
        for i in stats.stats {
            let data = ChartData(type: "\(i.stat.name)", count: i.baseStat)
            pokemonStats.append(data)
        }
    }
}
