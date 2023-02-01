import Foundation

protocol LoginViewModelProtocol: AnyObject {
    func displayRegisterView()
}

final class LoginViewModel {
    weak var delegate: LoginViewModelProtocol?
    
    func openRegisterView() {
        delegate?.displayRegisterView()
    }
}
