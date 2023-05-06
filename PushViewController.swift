//
//  PushViewController.swift
//  el596_p3
//
//  Created by Eileen Liang on 4/30/23.
//

import UIKit

class PushViewController: UIViewController {
    weak var delegate: UpdateProfileDelegate?
    var placeholderText: String?
    
    
    init(delegate: UpdateProfileDelegate?, placeholderText: String) {
        self.delegate = delegate
        self.placeholderText = placeholderText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    let scrollView = UIScrollView()
    //    let contentView = UIView()
        let profilePicture = UIButton()
        let firstNameLabel = UILabel()
        let firstNameTextField = UITextField()
        let lastNameLabel = UILabel()
        let lastNameTextField = UITextField()
        let netIDLabel = UILabel()
        let netIDTextField = UITextField()
        let emailLabel = UILabel()
        let emailTextField = UITextField()
        let saveButton = UIButton()
        let dismissButton = UIButton(type: .system)
    let leadingInt = 44.0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            navigationItem.hidesBackButton = true
            
            // set background color
            self.view.backgroundColor = UIColor(red: 166/255, green: 44/255, blue: 38/255, alpha: 1)
            
            // profile picture
            let image = UIImage(named: "bear2")
            profilePicture.setImage(image, for: .normal)
            profilePicture.translatesAutoresizingMaskIntoConstraints = false
            profilePicture.contentMode = .scaleAspectFill
            profilePicture.clipsToBounds = true
            profilePicture.layer.cornerRadius = 10
            profilePicture.layer.masksToBounds = true
            profilePicture.layer.borderColor = UIColor.black.cgColor
            profilePicture.layer.borderWidth = 3
            profilePicture.addTarget(self,action: #selector(profileButtonTapped), for: .touchUpInside)

            firstNameLabel.text = "First Name"
            firstNameLabel.font = UIFont.boldSystemFont(ofSize:18)
            firstNameLabel.textColor = UIColor.white
            
            lastNameLabel.text = "Last Name"
            lastNameLabel.font = UIFont.systemFont(ofSize: 18)
            lastNameLabel.textColor = UIColor.white
            
            netIDLabel.text = "Net ID"
            netIDLabel.font = UIFont.systemFont(ofSize: 18)
            netIDLabel.textColor = UIColor.white
            
            emailLabel.text = "Email"
            emailLabel.font = UIFont.systemFont(ofSize: 18)
            emailLabel.textColor = UIColor.white
            
            //textFields
            firstNameTextField.placeholder = "Kelly"
            firstNameTextField.borderStyle = .roundedRect
            firstNameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
            
            lastNameTextField.placeholder = "Tran"
            lastNameTextField.borderStyle = .roundedRect
            lastNameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
            
            netIDTextField.placeholder = "kt123"
            netIDTextField.borderStyle = .roundedRect
            netIDTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
            
            emailTextField.placeholder = "kt123@cornell.edu"
            emailTextField.borderStyle = .roundedRect
            emailTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
            
            // Save button constraints
            saveButton.setTitle("Save", for: .normal)
            saveButton.backgroundColor = UIColor.black
            saveButton.layer.cornerRadius = 20
            saveButton.setTitleColor(.white, for: .normal)
            profilePicture.addTarget(self,action: #selector(saveButtonPressed), for: .touchUpInside)
            
            view.addSubview(profilePicture)
            view.addSubview(firstNameLabel)
            view.addSubview(firstNameTextField)
            view.addSubview(lastNameLabel)
            view.addSubview(lastNameTextField)
            view.addSubview(netIDLabel)
            view.addSubview(netIDTextField)
            view.addSubview(emailLabel)
            view.addSubview(emailTextField)
            view.addSubview(saveButton)
            view.addSubview(dismissButton)

            setUpConstraints()
        }
        
        func setUpConstraints(){
            NSLayoutConstraint.activate([
                profilePicture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                profilePicture.heightAnchor.constraint(equalToConstant: 100),
                profilePicture.widthAnchor.constraint(equalToConstant: 100),
                profilePicture.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            ])
                
                firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
            firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    firstNameLabel.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 40),
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
            
            saveButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35),
                saveButton.widthAnchor.constraint(equalToConstant: 200),
                saveButton.heightAnchor.constraint(equalToConstant: 50)
                ])
        
        }
    @objc func profileButtonTapped() {
        let changePicVC = changePicViewController(delegate1: self)
        self.navigationController?.pushViewController(changePicVC, animated: true)
    }
    
    @objc func saveButtonPressed() {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
extension PushViewController: ChangeImageDelegate{
func changeImage(image: String) {
    let image = UIImage(named: "\(image)")
    profilePicture.setImage(image, for: .normal)
    }
}
