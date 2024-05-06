//
//  PokemonDetailVC.swift
//  PokemonDex
//
//  Created by hanif hussain on 07/03/2024.
//

import UIKit
import SwiftUI

class PokemonDetailVC: PKDexLoadingAnimationVC {
    let tableView = UITableView()
    var pokemonName: String!
    var pokemon: Pokemon!
    var details: PokemonDetails?
    var pokemonStats = [ChartData]()
    let tableRowDisplayCount: Int = 5
    let tableRowDisplayHeight: CGFloat = 200
    var pokemonStatsChart: PKDexStatsChartView!
    var pokemonStatsChartHostView: UIView!
    var scrollView = UIScrollView()
    var contentView = UIView()
    
    
    init(pokemonName: String, pokemon: Pokemon) {
        super.init(nibName: nil, bundle: nil)
        self.pokemonName = pokemonName
        self.pokemon = pokemon
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureScrollView()
        configureTable()
        getPokemonStats()
    }
    
    
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToSafeAreaEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 800)
        ])
    }
    
    
    func configureTable() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 200),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    func configureChartView() {
        pokemonStatsChart = PKDexStatsChartView(data: pokemonStats)
        // Define a hosting VC.
        // A UIKit view controller that manages a SwiftUI view hierarchy.
        let host = UIHostingController(rootView: pokemonStatsChart)
        pokemonStatsChartHostView = host.view!
        pokemonStatsChartHostView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pokemonStatsChartHostView)
        NSLayoutConstraint.activate([
            pokemonStatsChartHostView.topAnchor.constraint(equalTo: contentView.topAnchor),
            pokemonStatsChartHostView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pokemonStatsChartHostView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            pokemonStatsChartHostView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    func getPokemonStats() {
        showLoadingView()
        defer {
            dismissLoadingView()
        }
        Task {
            do {
                let stats = try await NetworkManager.shared.getDetailedStats(for: pokemon.url)
                processPokemonStats(stats: stats)
                details = try await NetworkManager.shared.getPokemonStats(for: pokemonName)
                DispatchQueue.main.async { [weak self] in
                    self?.configureChartView()
                    self?.tableView.reloadData()
                }
            } catch {
                if let error = error as? PKDexError {
                    presentPKDexAlert(title: "Oops", message: error.rawValue, buttonTitle: "Ok")
                }
            }
        }
    }
    
    
    func processPokemonStats(stats: PokemonStats) {
        print(stats.types.first?.type.name)
        for i in stats.stats {
            let data = ChartData(type: "\(i.stat.name)", count: i.baseStat)
            pokemonStats.append(data)
        }
    }
}


extension PokemonDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableRowDisplayCount
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = processStatsForDisplay(index: indexPath.row)
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    
    func processStatsForDisplay(index: Int) -> String {
        switch index {
        case 0:
            let text = "Description: \n\(details?.flavorTextEntries.first?.flavorText.stripPokedexCharacters ?? "")"
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
