//
//  PKDexAvatarImageView.swift
//  PokemonDex
//
//  Created by hanif hussain on 05/03/2024.
//

import UIKit

class PKDexAvatarImageView: UIImageView {
    
    let placeHolderImage = UIImage(resource: .pikachuPng)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
