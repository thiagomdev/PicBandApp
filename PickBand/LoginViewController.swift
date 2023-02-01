import UIKit

final class LoginViewController: UIViewController {
    // MARK: Properties
    private let viewModel: LoginViewModel
    
    // MARK: Components
    private lazy var logoImageView: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "singer2")
        logoImage.clipsToBounds = true
        logoImage.layer.masksToBounds = true
        logoImage.contentMode = .scaleAspectFill
        logoImage.layer.cornerRadius = 140 / 2
        return logoImage
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 10
        stack.alignment = .fill
        return stack
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register now", for: .normal)
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: Initializers
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: Selectors
    @objc
    private func didTapLoginButton() {
        viewModel.openRegisterView()
    }
}

// MARK: Extensions
extension LoginViewController: LoginViewModelProtocol {
    func displayRegisterView() {
        let register = RegisterViewController()
        navigationController?.present(register, animated: true)
    }
}

extension LoginViewController: ViewConfiguration {
    func buildHierarchyView() {
        stackView.add(
            subviews: emailTextField,
            passwordTextField,
            loginButton
        )
        
        view.add(views: logoImageView, stackView, registerButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activateConstraints([
            logoImageView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 140),
            logoImageView.heightAnchor.constraint(equalToConstant: 140),
            
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: logoImageView.bottomAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: registerButton.bottomAnchor, multiplier: 0),
            registerButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: registerButton.trailingAnchor, multiplier: 2)
        ])
    }
    
    func configureUI() {
        viewModel.delegate = self
        view.backgroundColor = .systemBackground
    }
}
