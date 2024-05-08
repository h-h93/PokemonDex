import UIKit

extension UIViewController {
    func presentPKDexAlert(title: String, message: String, buttonTitle: String) {
        let alertVC = PKDexAlertVC(title: title, message: message, buttonTitle: buttonTitle)
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true)
    }
}
