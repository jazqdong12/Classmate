//
//  OpeningViewController.swift
//  el596_p3
//
//  Created by Jasmine Dong on 5/03/23.
//

import UIKit

protocol SignUpProfileDelegate: AnyObject {
    func signUp (newFN: String)
}

protocol LogInProfileDelegate: AnyObject {
    func logIn (newFN: String)
}

class OpeningViewController: UIViewController {

    
    var welcomeLabel = UILabel()
    var welcomeLabel2 = UILabel()
    var backgroundImage = UIImageView()
    private var signUpButton = UIButton()
    private var logInButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // set background color
        self.view.backgroundColor = UIColor.white
        
        // background image
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(named: "opening2")
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode = .scaleAspectFill
        
        // name
        view.addSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Welcome to"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 22)
        
        // netID
        view.addSubview(welcomeLabel2)
        welcomeLabel2.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel2.text = "Classmate"
        welcomeLabel2.font = UIFont.boldSystemFont(ofSize: 38)
    
        
        // sign up button
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = UIColor.black
        signUpButton.layer.cornerRadius = 20
        signUpButton.addTarget(self,action: #selector(SignUpButtonTapped), for: .touchUpInside)
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        // log in button
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.black, for: .normal)
        logInButton.backgroundColor = UIColor.white
        logInButton.layer.cornerRadius = 20
        logInButton.layer.borderWidth = 0.8
        logInButton.addTarget(self,action: #selector(LogInButtonTapped), for: .touchUpInside)
        view.addSubview(logInButton)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant: -140),
            logInButton.widthAnchor.constraint(equalToConstant: 300),
            logInButton.heightAnchor.constraint(equalToConstant: 45)
            ])
        
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -15),
            signUpButton.widthAnchor.constraint(equalToConstant: 300),
            signUpButton.heightAnchor.constraint(equalToConstant: 45)
            ])
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 13.5),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            welcomeLabel2.topAnchor.constraint(equalTo: welcomeLabel.safeAreaLayoutGuide.bottomAnchor,constant: 10),
            welcomeLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        
        
    }
    @objc func SignUpButtonTapped() {
        let vc = SignUpViewController(delegate: self, placeholderText: "")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func LogInButtonTapped() {
        let vc = LogInViewController(delegate: self, placeholderText: "")
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension OpeningViewController: SignUpProfileDelegate {

    func signUp (newFN: String) {
    }

}

extension OpeningViewController: LogInProfileDelegate {

    func logIn (newFN: String) {
    }

}
