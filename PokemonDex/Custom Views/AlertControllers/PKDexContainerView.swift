import UIKit

class PKDexContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        self.layer.cornerRadius = 16
        self.layer.borderWidth = 2
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
