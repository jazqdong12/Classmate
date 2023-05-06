//
//  LoginViewController.swift
//  Classmate
//
//  Created by Jasmine Dong on 5/3/23
//

import UIKit

protocol SaveDelegate: AnyObject {
    func save (newFN: String)
}


class LogInViewController: UIViewController {
    weak var delegate: LogInProfileDelegate?
    var placeholderText: String?
    
    
    init(delegate: LogInProfileDelegate?, placeholderText: String) {
        self.delegate = delegate
        self.placeholderText = placeholderText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let titleLabel = UILabel()
    let emailLabel = UILabel()
    let emailTextField = UITextField()
    let backgroundImage = UIImageView()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let saveButton = UIButton()
    let dismissButton = UIButton(type: .system)
    let leadingInt = 44.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set background color
        self.view.backgroundColor = UIColor(red: 166/255, green: 44/255, blue: 38/255, alpha: 1)
        
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(named: "login")
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode = .scaleAspectFill
        
        titleLabel.text = "Log In"
        titleLabel.font = UIFont.boldSystemFont(ofSize:30)
        
        emailLabel.text = "Email"
        emailLabel.font = UIFont.systemFont(ofSize: 18)
        //emailLabel.textColor = UIColor.white
        
        emailTextField.placeholder = "Your email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        passwordLabel.text = "Password"
        passwordLabel.font = UIFont.systemFont(ofSize: 18)
        //passwordLabel.textColor = UIColor.white
        
        passwordTextField.placeholder = "Your password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        // Save button constraints
        saveButton.setTitle("Log In", for: .normal)
        saveButton.backgroundColor = UIColor.black
        saveButton.layer.cornerRadius = 20
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.addTarget(self,action: #selector(SaveButtonTapped), for: .touchUpInside)
        
        
        view.addSubview(titleLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(saveButton)
        view.addSubview(dismissButton)

        setUpConstraints()
    }
    
    func setUpConstraints(){
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 165),
        ])
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            emailLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingInt),
            emailTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
        ])
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingInt),
            passwordTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 10),
        ])
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            saveButton.widthAnchor.constraint(equalToConstant: 200),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
    @objc func saved() {
        delegate?.logIn(newFN: "")
        navigationController?.popViewController(animated: true)
    }
    
    @objc func SaveButtonTapped() {
//        let vc = HomeViewController(delegate: self, placeholderText: "")
//        navigationController?.pushViewController(vc, animated: true)
        let tabBarController = TabBarController()
        tabBarController.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(tabBarController, animated: true)
    }
    
}

extension LogInViewController: SaveDelegate {

    func save (newFN: String) {
    }

}
