//
//  ViewFriendsController.swift
//  Classmate
//
//  Created by Jasmine Dong on 5/1/23.
//

import UIKit

class ViewFriendsController: UIViewController {
    
    let class1: Class

    init(class1: Class) {
        self.class1 = class1
        super.init(nibName: nil, bundle: nil)
    }
    
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
        
        
        
        let student1 = Student(firstName: "Jasmine", lastName: "Dong", email: "jd@example.com", netID: "jqd1", password: "password123", classes: [], friends: ["el2"], iconName: "bear4")
        let student2 = Student(firstName: "Eileen", lastName: "Liang", email: "el@example.com", netID: "el2", password: "password456", classes: [], friends: ["jqd1"], iconName: "bear5")
        let student3 = Student(firstName: "Hector", lastName: "Hurtado", email: "hh@example.com", netID: "hh3", password: "password789", classes: [], friends: ["ha4"], iconName: "bear6")
        let student4 = Student(firstName: "Himma", lastName: "Aklilu", email: "ha@example.com", netID: "ha4", password: "password321", classes: [], friends: ["hh3"], iconName: "bear7")
        let student9 = Student(firstName: "Kevin", lastName: "Kim", email: "kk@example.com", netID: "kk9", password: "password579", classes: [], friends: ["sl5", "ha4"], iconName: "bear7")
        let student10 = Student(firstName: "Gabriella", lastName: "Garcia", email: "gg@example.com", netID: "gg10", password: "password680", classes: [], friends: ["ew8"], iconName: "bear1")
            
        friends = [student1, student2, student3, student4, student9, student10]
        
        //Initialize TableView
        self.view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.dataSource = self
            tableView.register(CustomFriendCell.self, forCellReuseIdentifier: reuseID)
            tableView.allowsSelection = false
        tableView.rowHeight = 90
        tableView.layer.cornerRadius = 8.0
        tableView.layer.masksToBounds = true
        tableView.backgroundColor = UIColor.clear
        
        titleLabel.text = "Friends"
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
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func dismissTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }
    
}

extension ViewFriendsController: UITableViewDataSource {
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
        return cell
    } else {
        return UITableViewCell()
    }
    
}
}
   
