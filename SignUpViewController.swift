//
//  SignUpViewController.swift
//  Classmate
//
//  Created by Jasmine Dong on 5/03/23.
//

import UIKit

class SignUpViewController: UIViewController {
    weak var delegate: SignUpProfileDelegate?
    var placeholderText: String?
    
    
    init(delegate: SignUpProfileDelegate?, placeholderText: String) {
        self.delegate = delegate
        self.placeholderText = placeholderText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        let titleLabel = UILabel()
        let firstNameLabel = UILabel()
        let firstNameTextField = UITextField()
        let lastNameLabel = UILabel()
        let lastNameTextField = UITextField()
        let backgroundImage = UIImageView()
        let netIDLabel = UILabel()
        let netIDTextField = UITextField()
        let emailLabel = UILabel()
        let emailTextField = UITextField()
        let passwordLabel = UILabel()
        let passwordTextField = UITextField()
        let saveButton = UIButton()
        let dismissButton = UIButton(type: .system)
        let leadingInt = 44.0
        
        override func viewDidLoad() {
            super.viewDidLoad()
        
            view.addSubview(backgroundImage)
            backgroundImage.image = UIImage(named: "signUp")
            backgroundImage.translatesAutoresizingMaskIntoConstraints = false
            backgroundImage.contentMode = .scaleAspectFill
            
            titleLabel.text = "Sign Up"
            titleLabel.font = UIFont.boldSystemFont(ofSize:30)

            firstNameLabel.text = "First Name"
            firstNameLabel.font = UIFont.boldSystemFont(ofSize:18)
            //firstNameLabel.textColor = UIColor.white
            
            lastNameLabel.text = "Last Name"
            lastNameLabel.font = UIFont.systemFont(ofSize: 18)
            //lastNameLabel.textColor = UIColor.white
            
            netIDLabel.text = "Net ID"
            netIDLabel.font = UIFont.systemFont(ofSize: 18)
            //netIDLabel.textColor = UIColor.white
            
            emailLabel.text = "Email"
            emailLabel.font = UIFont.systemFont(ofSize: 18)
            //emailLabel.textColor = UIColor.white
            
            passwordLabel.text = "Password"
            passwordLabel.font = UIFont.systemFont(ofSize: 18)
            //passwordLabel.textColor = UIColor.white
            
            //textFields
            firstNameTextField.placeholder = "Your first name"
            firstNameTextField.borderStyle = .roundedRect
            firstNameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
            
            lastNameTextField.placeholder = "Your last name"
            lastNameTextField.borderStyle = .roundedRect
            lastNameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
            
            netIDTextField.placeholder = "Your NetID"
            netIDTextField.borderStyle = .roundedRect
            netIDTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
            
            emailTextField.placeholder = "Your email"
            emailTextField.borderStyle = .roundedRect
            emailTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
            
            passwordTextField.placeholder = "Your password"
            passwordTextField.borderStyle = .roundedRect
            passwordTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
            
            // Save button constraints
            saveButton.setTitle("Create", for: .normal)
            saveButton.backgroundColor = UIColor.black
            saveButton.layer.cornerRadius = 20
            saveButton.setTitleColor(.white, for: .normal)
            saveButton.addTarget(self,action: #selector(SaveButtonTapped), for: .touchUpInside)
            
            view.addSubview(titleLabel)
            view.addSubview(firstNameLabel)
            view.addSubview(firstNameTextField)
            view.addSubview(lastNameLabel)
            view.addSubview(lastNameTextField)
            view.addSubview(netIDLabel)
            view.addSubview(netIDTextField)
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
                
                firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
            firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    firstNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
                    firstNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingInt),
                    firstNameTextField.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 10),
                    firstNameTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
                ])
                lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
                lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    lastNameLabel.topAnchor.constraint(equalTo:  firstNameTextField.bottomAnchor, constant: 30),
                    lastNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingInt),
                    lastNameTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                    lastNameTextField.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 10),
                ])
                
            netIDLabel.translatesAutoresizingMaskIntoConstraints = false
            netIDTextField.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    netIDLabel.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 30),
                    netIDLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingInt),
                    netIDTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                    netIDTextField.topAnchor.constraint(equalTo: netIDLabel.bottomAnchor, constant: 10),
                ])
            
            emailLabel.translatesAutoresizingMaskIntoConstraints = false
            emailTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                emailLabel.topAnchor.constraint(equalTo: netIDTextField.bottomAnchor, constant: 30),
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
        delegate?.signUp(newFN: "")
        navigationController?.popViewController(animated: true)
        
    }
    @objc func SaveButtonTapped() {
//        let vc = HomeViewController(delegate: self, placeholderText: "")
//        navigationController?.pushViewController(vc, animated: true)
        let tabBarController = TabBarController()
        navigationController?.pushViewController(tabBarController, animated: true)
    }
    
}
