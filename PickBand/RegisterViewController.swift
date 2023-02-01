import UIKit

final class RegisterViewController: UIViewController {
    
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
    
    private lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirm password"
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private lazy var backToSignIn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign in", for: .normal)
        button.addTarget(self, action: #selector(backToSignInButton), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        buildSetup()
    }
    
    @objc
    private func backToSignInButton() {
        dismiss(animated: true)
    }
}

extension RegisterViewController: ViewConfiguration {
    func buildHierarchyView() {
        stackView.add(
            subviews: emailTextField,
            passwordTextField,
            confirmPasswordTextField,
            registerButton
        )
        
        view.add(views: logoImageView, stackView, backToSignIn)
    }
    
    func activeConstraints() {
        NSLayoutConstraint.activateConstraints([
            logoImageView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 140),
            logoImageView.heightAnchor.constraint(equalToConstant: 140),
            
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: logoImageView.bottomAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: backToSignIn.bottomAnchor, multiplier: 0),
            backToSignIn.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: backToSignIn.trailingAnchor, multiplier: 2)
        ])
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
}
