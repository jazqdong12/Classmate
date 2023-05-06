//
//  ViewController.swift
//  el596_p3
//
//  Created by Eileen Liang on 4/30/23.
//

import UIKit

protocol UpdateProfileDelegate: AnyObject {
    func updateProfile(newFN: String)
}

class ProfileViewController: UIViewController {

    
    var nameLabel = UILabel()
    var firstNameTextView = UITextView()
    var netIDLabel = UILabel()
    var profilePicture = UIImageView()
    var backgroundImage = UIImageView()
    var classes = [""]
    private var pushButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // set background color
        self.view.backgroundColor = UIColor.white
        
        // background image
        view.addSubview(backgroundImage)
        backgroundImage.image = UIImage(named: "profilePageBackground")
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode = .scaleAspectFill
        
        // name
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "your name"
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 25
        )
        
        // netID
        view.addSubview(netIDLabel)
        netIDLabel.translatesAutoresizingMaskIntoConstraints = false
        netIDLabel.text = "netID:"
        netIDLabel.textColor = .white
        netIDLabel.font = .systemFont(ofSize: 15)
        
        // profile picture
        view.addSubview(profilePicture)
        profilePicture.image = UIImage(named: "teddyBear2")
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        profilePicture.contentMode = .scaleAspectFill
        profilePicture.clipsToBounds = true
        profilePicture.layer.cornerRadius = 10
        profilePicture.layer.masksToBounds = true
        profilePicture.layer.borderColor = UIColor.black.cgColor
        profilePicture.layer.borderWidth = 3
        
        // push button (for editing)
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        pushButton.setTitle("Edit", for: .normal)
        pushButton.setTitleColor(.white, for: .normal)
        pushButton.addTarget(self, action: #selector(pushViewControllerButtonPressed), for: .touchUpInside)
        view.addSubview(pushButton)
        
        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -40),
            pushButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -30),
            pushButton.widthAnchor.constraint(equalToConstant: 120),
            pushButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            profilePicture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            profilePicture.heightAnchor.constraint(equalToConstant: 100),
            profilePicture.widthAnchor.constraint(equalToConstant: 100),
            profilePicture.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 65),
            nameLabel.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            netIDLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            netIDLabel.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 20)
        ])
        
        
        
    }
    @objc func pushViewControllerButtonPressed() {
        let vc = UpdateProfViewController(delegate: self, placeholderText: "")
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension UpdateProfViewController: UpdateProfileDelegate {

    func updateProfile (newFN: String) {
    }

}
