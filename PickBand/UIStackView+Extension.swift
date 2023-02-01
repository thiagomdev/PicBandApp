import UIKit
extension UIStackView {
    func add(subviews: UIView...) {
        for views in subviews {
            addArrangedSubview(views)
        }
    }
}
