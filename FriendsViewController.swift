//
//  FriendsViewController.swift
//  Classmate
//
//  Created by Jasmine Dong on 5/2/23.
//

import UIKit

class FriendsViewController: UIViewController{
    
    var friends: [Student] = []
    let requestLabel = UILabel()
    let requestTextField = UITextField()
    let friendsButton = UIButton()
    
    let tableView = UITableView()
    let reuseID = "my cell"
    
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
        
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 247/255, green: 238/255, blue: 229/255, alpha: 1.0)
        
        let student1 = Student(firstName: "Avery", lastName: "Chen", email: "ac@example.com", netID: "ac1", password: "password123", classes: [], friends: ["mt2"], iconName: "bear4")
        let student2 = Student(firstName: "Mia", lastName: "Tang", email: "mt@example.com", netID: "mt2", password: "password456", classes: [], friends: ["ac1"], iconName: "bear8")
        let student3 = Student(firstName: "Leo", lastName: "Wu", email: "lw@example.com", netID: "lw3", password: "password789", classes: [], friends: ["yc4"], iconName: "bear3")
        let student4 = Student(firstName: "Yuna", lastName: "Chang", email: "yc@example.com", netID: "yc4", password: "password321", classes: [], friends: ["lw3"], iconName: "bear1")
        let student5 = Student(firstName: "Sebastian", lastName: "Kim", email: "sk@example.com", netID: "sk5", password: "password789", classes: [], friends: ["sp6"], iconName: "bear7")
        let student6 = Student(firstName: "Samantha", lastName: "Park", email: "sp@example.com", netID: "sp6", password: "password321", classes: [], friends: ["sk5"], iconName: "bear1")
        let student7 = Student(firstName: "Jordan", lastName: "Lee", email: "jl@example.com", netID: "jl7", password: "password987", classes: [], friends: ["mm8"], iconName: "bear3")

        
        friends = [student1, student2, student3, student4, student5, student6,student7]
        
        //button
        let image = UIImage(systemName: "person.2")
        friendsButton.setImage(image, for: .normal)
        friendsButton.tintColor = .black
        friendsButton.imageView?.contentMode = .scaleAspectFit
        friendsButton.addTarget(self,action: #selector(friendButtonTapped), for: .touchUpInside)
        friendsButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(friendsButton)
        
        
        //Initialize TableView
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomFriendCell.self, forCellReuseIdentifier: reuseID)
        tableView.allowsSelection = false
        tableView.rowHeight = 90
        tableView.layer.cornerRadius = 8.0
        tableView.layer.masksToBounds = true
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .clear
        tableView.separatorInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
        self.view.addSubview(requestLabel)
        requestLabel.translatesAutoresizingMaskIntoConstraints = false
        requestLabel.text = "Friends"
        requestLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        self.view.addSubview(requestTextField)
        requestTextField.translatesAutoresizingMaskIntoConstraints = false
        requestTextField.placeholder = " + Add Friend by NetID"
        requestTextField.borderStyle = .roundedRect
        requestTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        setupConstraints()
    }
    func setupConstraints(){
        
        NSLayoutConstraint.activate([
            requestTextField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            requestTextField.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            requestLabel.topAnchor.constraint(equalTo: requestTextField.bottomAnchor, constant: 20),
            requestLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            friendsButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            friendsButton.leadingAnchor.constraint(equalTo: requestTextField.trailingAnchor, constant: 15),
            friendsButton.heightAnchor.constraint(equalToConstant: 40.0),
            friendsButton.widthAnchor.constraint(equalToConstant: 40.0),
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: requestLabel.bottomAnchor, constant: 15),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
        
    }
    
    
    @objc func friendButtonTapped() {
        present(FriendRequestsViewController(), animated: true, completion: nil)
    }
    
}
    //Conform to UITableViewDelegate & UITableViewDataSource
    extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
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
        
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.backgroundColor = .clear
        }
        
        
    }

