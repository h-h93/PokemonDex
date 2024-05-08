//
//  ImageSlideCollectionView.swift
//  PokemonDex
//
//  Created by hanif hussain on 06/05/2024.
//

import UIKit

class PKDexImageSlideCollectionView: UICollectionView {
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        setCollectionViewLayout(setCompositionalLayout(), animated: true)
    }
    
    
    private func setCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let items = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.90))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [items])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        let compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        return compositionalLayout
    }
}
