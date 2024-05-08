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
    
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
        contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func downloadPokemonImage(url: String) {
        Task(priority: .background) { image = await NetworkManager.shared.downloadImage(fromUrl: url) ?? placeHolderImage }
    }
    
    
    
}
