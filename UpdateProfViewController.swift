//
//  ViewController.swift
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
    
    var editTitleLabel = UILabel()
    var firstNameLabel = UILabel()
    var lastNameLabel = UILabel()
    var netIDLabel = UILabel()
    var emailLabel = UILabel()
    
    private var saveButton = UIButton()
    private var fnField = UITextField()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set background color
        self.view.backgroundColor = UIColor(red: 166/255, green: 44/255, blue: 38/255, alpha: 1)
        
        view.addSubview(editTitleLabel)
        editTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        editTitleLabel.text = "Edit Profile"
        editTitleLabel.textColor = .white
        editTitleLabel.font = editTitleLabel.font.withSize(20)
        
        // first name
        view.addSubview(firstNameLabel)
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.text = "First Name"
        firstNameLabel.textColor = .white
        firstNameLabel.font = firstNameLabel.font.withSize(20)
        view.addSubview(fnField)
        fnField.translatesAutoresizingMaskIntoConstraints = false
        fnField.font = UIFont.systemFont(ofSize: 18)
        fnField.text = placeholderText
        fnField.borderStyle = .roundedRect
        fnField.textAlignment = .center
        
        view.addSubview(lastNameLabel)
        lastNameLabel.translatesAutoresizingMaskIntoConstraints = false
        lastNameLabel.text = "Last Name"
        lastNameLabel.textColor = .white
        lastNameLabel.font = lastNameLabel.font.withSize(20)
        
        view.addSubview(netIDLabel)
        netIDLabel.translatesAutoresizingMaskIntoConstraints = false
        netIDLabel.text = "NetID"
        netIDLabel.textColor = .white
        netIDLabel.font = netIDLabel.font.withSize(20)
        
        view.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "Email"
        emailLabel.textColor = .white
        emailLabel.font = emailLabel.font.withSize(20)
        
        // button
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .black
        saveButton.layer.cornerRadius = 20
        saveButton.addTarget(self, action: #selector(saved), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            editTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            firstNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            firstNameLabel.topAnchor.constraint(equalTo: editTitleLabel.bottomAnchor, constant: 150),
            lastNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            lastNameLabel.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 60),
            netIDLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            netIDLabel.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: 60),
            emailLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            emailLabel.topAnchor.constraint(equalTo: netIDLabel.bottomAnchor, constant: 60)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 150),
            saveButton.widthAnchor.constraint(equalToConstant: 114),
            saveButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    @objc func saved() {
        delegate?.updateProfile(newFN: "")
        navigationController?.popViewController(animated: true)
    }
}
