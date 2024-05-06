//
//  PokemonCell.swift
//  PokemonDex
//
//  Created by hanif hussain on 05/03/2024.
//

import UIKit

class PKDexCollectionViewCell: UICollectionViewCell {
    let pokemonImage = PKDexAvatarImageView(frame: .zero)
    let pokemonNameLabel = PKDexTitleLabel(textAlignment: .center)
    
    static let reuseID = "PokemonCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.borderWidth = 2
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
        layer.cornerRadius = 10
        
        addSubview(pokemonImage)
        addSubview(pokemonNameLabel)
        
        NSLayoutConstraint.activate([
            pokemonImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            pokemonImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            pokemonImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            pokemonImage.heightAnchor.constraint(equalToConstant: 100),
            
            pokemonNameLabel.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 5),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            pokemonNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
    
    
    func set(pokemon: Pokemon) {
        pokemonNameLabel.text = pokemon.name
        pokemonImage.downloadPokemonImage(url: pokemon.artworkURL)
    }
    
}

