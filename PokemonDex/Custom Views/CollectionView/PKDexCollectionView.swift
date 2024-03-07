//
//  PKDexCollectionView.swift
//  PokemonDex
//
//  Created by hanif hussain on 06/03/2024.
//

import UIKit

class PKDexCollectionView: UICollectionView {
    
    
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
        let leftPanel = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        leftPanel.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let rightanel = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        rightanel.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        let leftAndRightPanelGroupVertical = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)), subitems: [leftPanel, rightanel])
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)), subitems: [leftAndRightPanelGroupVertical])
        
        let container = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.6)), subitems: [group])
        let section = NSCollectionLayoutSection(group: container)
        let compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        return compositionalLayout
    }
}
