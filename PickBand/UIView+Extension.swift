import UIKit
extension UIView {
    func add(views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
