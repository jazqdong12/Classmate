//
//  ViewController.swift
//  Classmate
//
//  Created by Eileen Liang on 4/30/23.
//

import UIKit

protocol UpdateProfileDelegate: AnyObject {
    func updateProfile(newFN: String)
}

class ViewController: UIViewController {

    let reuseID = "myClassReuse"
    var nameLabel = UILabel()
    var firstNameTextView = UITextView()
    var netIDLabel = UILabel()
    let tableView = UITableView()
    var profilePicture = UIImageView()
    let changePicButton = UIButton()
    var backgroundImage = UIImageView()
    var myClasses: [Class] = []
    var signOutButton = UIButton()
    private var pushButton = UIButton()
    
    var classColors = [UIColor(red: 241/255, green: 145/255, blue: 53/255, alpha: 1.0),
                           UIColor(red: 237/255, green: 98/255, blue: 55/255, alpha: 1.0),
                           UIColor(red: 55/255, green: 125/255, blue: 34/255, alpha: 1.0),
                           UIColor(red: 65/255, green: 83/255, blue: 175/255, alpha: 1.0),
                           UIColor(red: 214/255, green: 57/255, blue: 100/255, alpha: 1.0),
                           UIColor(red: 144/255, green: 54/255, blue: 170/255, alpha: 1.0),
                           UIColor(red: 105/255, green: 165/255, blue: 203/255, alpha: 1.0),
                           UIColor(red: 65/255, green: 148/255, blue: 136/255, alpha: 1.0)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let c1 = Class(name: "CHEM2090", type: "Lecture", days: ["Monday", "Wednesday", "Friday"], startHour: 11, startMinute: 15, startPeriod: "AM", endHour: 12, endMinute: 05, endPeriod: "PM", location: "Olin Hall", friends: ["ab123", "cd456"])
        let c2 = Class(name: "PSYCH1010", type: "Discussion", days: ["Thursday"], startHour: 1, startMinute: 30, startPeriod: "PM", endHour: 2, endMinute: 45, endPeriod: "PM", location: "Uris Hall", friends: ["ef789", "gh012"])
        let c3 = Class(name: "ITAL1120", type: "Lecture", days: ["Tuesday", "Thursday"], startHour: 9, startMinute: 05, startPeriod: "AM", endHour: 10, endMinute: 20, endPeriod: "AM", location: "Klarman Hall", friends: ["ij345", "kl678"])
        let c4 = Class(name: "CS4820", type: "Lecture", days: ["Monday", "Wednesday", "Friday"], startHour: 2, startMinute: 30, startPeriod: "PM", endHour: 3, endMinute: 45, endPeriod: "PM", location: "Gates Hall", friends: ["mn901", "op234"])
        let c5 = Class(name: "GOVT1615", type: "Lecture", days: ["Tuesday", "Thursday"], startHour: 10, startMinute: 10, startPeriod: "AM", endHour: 11, endMinute: 25, endPeriod: "AM", location: "Goldwin Smith Hall", friends: ["qr567", "st890"])

        myClasses = [c1,c2,c3,c4,c5]
        
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
        nameLabel.text = "Jasmine Dong"
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 25)
        
        //Initialize TableView
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(CustomProfileTableCell.self, forCellReuseIdentifier: reuseID)
        tableView.allowsSelection = false
        tableView.rowHeight = 90
        tableView.layer.cornerRadius = 8.0
        tableView.layer.masksToBounds = true
        tableView.backgroundColor = UIColor.clear
        tableView.separatorInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
        // netID
        view.addSubview(netIDLabel)
        netIDLabel.translatesAutoresizingMaskIntoConstraints = false
        netIDLabel.text = "netID: jqd123"
        netIDLabel.textColor = .white
        netIDLabel.font = .systemFont(ofSize: 15)
        
        // profile picture
        view.addSubview(profilePicture)
        profilePicture.image = UIImage(named: "bear2")
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        profilePicture.contentMode = .scaleAspectFill
        profilePicture.clipsToBounds = true
        profilePicture.layer.borderWidth = 3.0
        profilePicture.layer.cornerRadius = 10
        profilePicture.layer.masksToBounds = true
        
        // push button (for editing)
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        pushButton.setTitle("Edit", for: .normal)
        pushButton.setTitleColor(.white, for: .normal)
        pushButton.addTarget(self, action: #selector(pushViewControllerButtonPressed), for: .touchUpInside)
        view.addSubview(pushButton)
        
        //button
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.setTitleColor(.white, for: .normal)
        signOutButton.backgroundColor = UIColor.black
        signOutButton.layer.cornerRadius = 20
        signOutButton.addTarget(self,action: #selector(signOutButtonPressed), for: .touchUpInside)
        view.addSubview(signOutButton)

        
        NSLayoutConstraint.activate([
            pushButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            profilePicture.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            profilePicture.heightAnchor.constraint(equalToConstant: 100),
            profilePicture.widthAnchor.constraint(equalToConstant: 100),
            profilePicture.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profilePicture.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            netIDLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            netIDLabel.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35),
            signOutButton.widthAnchor.constraint(equalToConstant: 200),
            signOutButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: signOutButton.topAnchor, constant: -30),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            tableView.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 30)])
        
        
    }
    @objc func pushViewControllerButtonPressed() {
        let vc = PushViewController(delegate: self, placeholderText: "")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func signOutButtonPressed() {
        let vc = OpeningViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
}

extension ViewController: UpdateProfileDelegate {

    func updateProfile (newFN: String) {
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myClasses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as! CustomProfileTableCell
        // Set up cell contents based on suggested class at index path
        let colorIndex = indexPath.row % classColors.count
        cell.updateFrom(class1: myClasses[indexPath.row], index: colorIndex)
        cell.layer.cornerRadius = 10
        return cell
    }

}
