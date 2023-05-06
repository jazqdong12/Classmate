//
//  AddClassViewController.swift
//  Classmate
//
//  Created by Jasmine Dong on 5/2/23.
//

import UIKit

class AddClassViewController: UIViewController {
    
    let reuseID = "suggestedClassReuse"
    var suggestedClasses: [Class] = [] //
    let tableView = UITableView()
    var addButton = UIButton()
    let titleLabel = UILabel()
    let titleLabel2 = UILabel()

    var classColors = [UIColor(red: 241/255, green: 145/255, blue: 53/255, alpha: 1.0),
                           UIColor(red: 237/255, green: 98/255, blue: 55/255, alpha: 1.0),
                           UIColor(red: 55/255, green: 125/255, blue: 34/255, alpha: 1.0),
                           UIColor(red: 65/255, green: 83/255, blue: 175/255, alpha: 1.0),
                           UIColor(red: 214/255, green: 57/255, blue: 100/255, alpha: 1.0),
                           UIColor(red: 144/255, green: 54/255, blue: 170/255, alpha: 1.0),
                           UIColor(red: 105/255, green: 165/255, blue: 203/255, alpha: 1.0),
                           UIColor(red: 65/255, green: 148/255, blue: 136/255, alpha: 1.0)]
    
    
    override func viewDidLoad() {
        
        navigationItem.hidesBackButton = true
        let c6 = Class(name: "CHEM1570", type: "Lecture", days: ["Monday", "Wednesday", "Friday"], startHour: 12, startMinute: 00, startPeriod: "PM", endHour: 12, endMinute: 50, endPeriod: "PM", location: "Baker Laboratory", friends: ["bc987", "qr123"])
        let c7 = Class(name: "PSYCH1010", type: "Lecture", days: ["Tuesday", "Thursday"], startHour: 10, startMinute: 10, startPeriod: "AM", endHour: 11, endMinute: 25, endPeriod: "AM", location: "Uris Hall", friends: ["xy456", "cd789"])
        let c8 = Class(name: "ART2600", type: "Discussion", days: ["Wednesday", "Friday"], startHour: 2, startMinute: 30, startPeriod: "PM", endHour: 3, endMinute: 45, endPeriod: "PM", location: "Tjaden Hall", friends: ["ef123", "gh456"])
        let c9 = Class(name: "BIOMG1350", type: "Lecture", days: ["Monday", "Wednesday", "Friday"], startHour: 1, startMinute: 25, startPeriod: "PM", endHour: 2, endMinute: 15, endPeriod: "PM", location: "Weill Hall", friends: ["ij789", "kl012"])
        let c10 = Class(name: "COMM2450", type: "Lecture", days: ["Tuesday", "Thursday"], startHour: 9, startMinute: 05, startPeriod: "AM", endHour: 10, endMinute: 20, endPeriod: "AM", location: "Kennedy Hall", friends: ["mn345", "op678"])
        let c11 = Class(name: "BEE3310", type: "Lab", days: ["Friday"], startHour: 1, startMinute: 30, startPeriod: "PM", endHour: 3, endMinute: 15, endPeriod: "PM", location: "Riley-Robb Hall", friends: ["qr345", "st678"])
        let c12 = Class(name: "ITAL1101", type: "Lecture", days: ["Monday", "Wednesday", "Friday"], startHour: 11, startMinute: 15, startPeriod: "AM", endHour: 12, endMinute: 05, endPeriod: "PM", location: "Klarman Hall", friends: ["uv123", "wx456"])

        suggestedClasses = [c6,c7,c8,c9,c10,c11,c12]
        
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 247/255, green: 238/255, blue: 229/255, alpha: 1.0)
        
        //button
        addButton.setTitle("Add Course", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = UIColor.black
        addButton.layer.cornerRadius = 20
        addButton.addTarget(self,action: #selector(addButtonTapped), for: .touchUpInside)
        
        //title label
        titleLabel.text = "Suggested Courses"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        
        titleLabel2.text = ". . . based off your friends"
        titleLabel2.font = UIFont.boldSystemFont(ofSize: 14)
        
        //Initialize TableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomSuggestedClassCell.self, forCellReuseIdentifier: reuseID)
        tableView.allowsSelection = true
        tableView.rowHeight = 90
        tableView.layer.cornerRadius = 8.0
        tableView.layer.masksToBounds = true
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = UIColor.clear
        tableView.separatorInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
        // Set up view hierarchy
        view.addSubview(addButton)
        view.addSubview(tableView)
        view.addSubview(titleLabel)
        view.addSubview(titleLabel2)
        
        // Set up layout constraints
        addButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraints()
        
        func setupConstraints(){
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                ])
            NSLayoutConstraint.activate([
                titleLabel2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
                titleLabel2.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -60),
                ])
            NSLayoutConstraint.activate([
                addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35),
                addButton.widthAnchor.constraint(equalToConstant: 200),
                addButton.heightAnchor.constraint(equalToConstant: 40)
                ])
            NSLayoutConstraint.activate([
                tableView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -30),
                tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                tableView.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 20)
            ])

        }
        
        // Set up table view data source and delegate
        tableView.dataSource = self
    }
    
    @objc func addButtonTapped() {
            present(AddClassManualViewController(), animated: true, completion: nil)
        }
    }

extension AddClassViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentThisView()
    }
}


extension AddClassViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestedClasses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as! CustomSuggestedClassCell
        let colorIndex = indexPath.row % classColors.count
        // Set up cell contents based on suggested class at index path
        cell.updateFrom(class1: suggestedClasses[indexPath.row], index: colorIndex)
        cell.layer.cornerRadius = 10
        return cell
    }
    
    @objc func presentThisView() {
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            let selectedClass = suggestedClasses[selectedIndexPath.row]
            let detailVC = ViewFriendsController(class1: selectedClass)
            present(detailVC, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .clear
    }

}






