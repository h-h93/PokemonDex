import UIKit

class PKDexPokemonImageSlideShowCell: UICollectionViewCell {
    private let pokemonImage = PKDexAvatarImageView(frame: .zero)
    private let pokemonNameLabel = PKDexTitleLabel(textAlignment: .center)
    
    static let reuseID = "PokemonImageSlideCell"
    
    
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
            pokemonImage.heightAnchor.constraint(equalToConstant: 150),
            
            pokemonNameLabel.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 5),
            pokemonNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            pokemonNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            pokemonNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
    
    
    func set(url: BaseURLs, stat: PokemonStats, pokemonID: String) {
        var text = "Type: "
        for i in stat.types {
            text += i.type.name + " "
        }
        pokemonNameLabel.text = text
        pokemonImage.downloadPokemonImage(url: url.rawValue + pokemonID + ".png")
    }
}
