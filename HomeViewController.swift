//
//  HomeViewController.swift
//  Classmate
//
//  Created by Jasmine Dong on 5/1/23.
//

import UIKit

class HomeViewController: UIViewController{
    
    weak var delegate: SaveDelegate?
    var placeholderText: String?
    
    init(delegate: SaveDelegate?, placeholderText: String) {
        self.delegate = delegate
        self.placeholderText = placeholderText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var classes: [Class] = []
    
    var mondayClasses: [Class] = []
    var tuesdayClasses: [Class] = []
    var wednesdayClasses: [Class] = []
    var thursdayClasses: [Class] = []
    var fridayClasses: [Class] = []
    
    let sections = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
    
    let tableView = UITableView()
    let reuseID = "my cell"
    let headerReuseID = "headerReuseID"
    
    var classColors = [UIColor(red: 241/255, green: 145/255, blue: 53/255, alpha: 1.0),
                       UIColor(red: 237/255, green: 98/255, blue: 55/255, alpha: 1.0),
                       UIColor(red: 55/255, green: 125/255, blue: 34/255, alpha: 1.0),
                       UIColor(red: 65/255, green: 83/255, blue: 175/255, alpha: 1.0),
                       UIColor(red: 214/255, green: 57/255, blue: 100/255, alpha: 1.0),
                       UIColor(red: 144/255, green: 54/255, blue: 170/255, alpha: 1.0),
                       UIColor(red: 105/255, green: 165/255, blue: 203/255, alpha: 1.0),
                       UIColor(red: 65/255, green: 148/255, blue: 136/255, alpha: 1.0)]
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
    
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
            view.backgroundColor = UIColor(red: 247/255, green: 238/255, blue: 229/255, alpha: 1.0)
            title = "My Schedule"
            
            
            let c1 = Class(name: "CS2110", type: "Lecture", days: ["Monday", "Wednesday"], startHour: 9, startMinute: 05, startPeriod: "AM", endHour: 10, endMinute: 20, endPeriod: "AM", location: "Gates Hall", friends: ["jqd3", "el596"])
            let c2 = Class(name: "ENGL1101", type: "Lecture", days: ["Tuesday", "Thursday"], startHour: 1, startMinute: 30, startPeriod: "PM", endHour: 2, endMinute: 45, endPeriod: "PM", location: "Goldwin Smith Hall", friends: ["kl324", "so981"])
            let c3 = Class(name: "MATH2210", type: "Discussion", days: ["Wednesday"], startHour: 11, startMinute: 15, startPeriod: "AM", endHour: 12, endMinute: 30, endPeriod: "PM", location: "Malott Hall", friends: ["rt732", "qp218"])
            let c4 = Class(name: "PHYS2213", type: "Lab", days: ["Friday"], startHour: 3, startMinute: 00, startPeriod: "PM", endHour: 4, endMinute: 15, endPeriod: "PM", location: "Clark Hall", friends: ["da452", "ab385"])
            let c5 = Class(name: "INFO2300", type: "Lecture", days: ["Monday", "Wednesday", "Friday"], startHour: 10, startMinute: 10, startPeriod: "AM", endHour: 11, endMinute: 25, endPeriod: "AM", location: "Duffield Hall", friends: ["mn554", "yu976"])
            
            
            classes = [c1, c2, c3, c4, c5]
            
            // Organize classes by day of the week
            for class1 in classes {
                for day in class1.days {
                    switch day {
                    case "Monday":
                        mondayClasses.append(class1)
                    case "Tuesday":
                        tuesdayClasses.append(class1)
                    case "Wednesday":
                        wednesdayClasses.append(class1)
                    case "Thursday":
                        thursdayClasses.append(class1)
                    case "Friday":
                        fridayClasses.append(class1)
                    default:
                        break
                    }
                }
            }
            
            //Initialize TableView
            self.view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: reuseID)
            tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: headerReuseID) // register header view
            tableView.allowsSelection = true
            tableView.rowHeight = 90
            tableView.layer.cornerRadius = 8.0
            tableView.layer.masksToBounds = true
            tableView.backgroundColor = UIColor.clear
            
            
            setupConstraints()
        }
        func setupConstraints(){
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 10),
                tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -10),
                tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10),
                tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
            ])
            
        }
    }
    //Conform to UITableViewDelegate & UITableViewDataSource
    
    extension HomeViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            presentView()
        }
    }
    extension HomeViewController: UITableViewDataSource {
        //Headers
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerReuseID)
            header?.textLabel?.text = sections[section]
            header?.textLabel?.textColor = .black
            header?.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            return header
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return sections.count
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch section {
            case 0:
                return mondayClasses.count
            case 1:
                return tuesdayClasses.count
            case 2:
                return wednesdayClasses.count
            case 3:
                return thursdayClasses.count
            case 4:
                return fridayClasses.count
            default:
                return 0
            }
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? CustomTableViewCell {
                //            cell.layer.cornerRadius = 20
                //            cell.layer.masksToBounds = true
                var currentClass: Class
                switch indexPath.section {
                case 0:
                    currentClass = mondayClasses[indexPath.row]
                case 1:
                    currentClass = tuesdayClasses[indexPath.row]
                case 2:
                    currentClass = wednesdayClasses[indexPath.row]
                case 3:
                    currentClass = thursdayClasses[indexPath.row]
                case 4:
                    currentClass = fridayClasses[indexPath.row]
                default:
                    return UITableViewCell()
                }
                cell.detailTextLabel?.text = currentClass.location
                cell.accessoryType = .disclosureIndicator
                let colorIndex = indexPath.row % classColors.count
                cell.updateFrom(class1: currentClass, index: colorIndex)
                cell.layer.cornerRadius = 10
                return cell
            } else {
                return UITableViewCell()
            }
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 40 // set height for header view
        }
        
        func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 40 // set height for footer view
        }
        
        
        //  TODO: 1 - Present View
        @objc func presentView() {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                let selectedClass = classes[selectedIndexPath.row]
                let detailVC = ViewFriendsController(class1: selectedClass)
                present(detailVC, animated: true, completion: nil)
            }
        }
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.backgroundColor = .clear
        }
    }
