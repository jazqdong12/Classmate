//
//  FriendRequestsViewController.swift
//  Classmate
//
//  Created by Jasmine Dong on 5/1/23.
//

import UIKit

class FriendRequestsViewController: UIViewController {
    
    var friends: [Student] = []
    let tableView = UITableView()
    let reuseID = "my cell"
    let titleLabel = UILabel()
    let dismissButton = UIButton(type: .system)
    
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
        view.backgroundColor = UIColor.white
        
        
        let student5 = Student(firstName: "Samantha", lastName: "Lee", email: "sl@example.com", netID: "sl5", password: "password135", classes: [], friends: ["jqd1", "hh3"], iconName: "bear4")
        let student6 = Student(firstName: "Anthony", lastName: "Tran", email: "at@example.com", netID: "at6", password: "password246", classes: [], friends: ["ha4", "el2"], iconName: "bear2")
        let student7 = Student(firstName: "Avery", lastName: "Nguyen", email: "an@example.com", netID: "an7", password: "password357", classes: [], friends: ["sl5"], iconName: "bear6")
        let student8 = Student(firstName: "Emily", lastName: "Wu", email: "ew@example.com", netID: "ew8", password: "password468", classes: [], friends: ["at6", "jqd1"], iconName: "bear8")

            
        friends = [student5, student6, student7, student8]
        
        //Initialize TableView
        self.view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.dataSource = self
            tableView.register(CustomFriendCell.self, forCellReuseIdentifier: reuseID)
            tableView.allowsSelection = false
        tableView.rowHeight = 90
        tableView.layer.cornerRadius = 8.0
        tableView.layer.masksToBounds = true
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = UIColor(red: 247/255, green: 238/255, blue: 229/255, alpha: 1.0)
        tableView.separatorInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
        titleLabel.text = "Friend Requests"
        titleLabel.font = UIFont.boldSystemFont(ofSize:28)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // Dimiss button
        if let image = UIImage(systemName: "xmark") {
            let tintedImage = image.withTintColor(UIColor.black)
            dismissButton.setImage(tintedImage, for: .normal)
        }
        dismissButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.setTitleColor(.white, for: .normal)
        dismissButton.tintColor = UIColor.black
        view.addSubview(dismissButton)
        
        setupConstraints()
    }
    
    func setupConstraints () {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 44),
        ])
        
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    @objc func dismissTapped() {
        dismiss(animated: true, completion: nil)
    }
}

extension FriendRequestsViewController: UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
Int {
    return friends.count
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
UITableViewCell{
    if let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? CustomFriendCell {
        let currentFriend = friends[indexPath.row]
        let colorIndex = indexPath.row % classColors.count
        cell.updateFrom(student: currentFriend, index: colorIndex)
        cell.layer.cornerRadius = 10
        return cell
    } else {
        return UITableViewCell()
    }
    
}
}
   
