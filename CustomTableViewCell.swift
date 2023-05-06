//
//  CustomTableViewCell.swift
//  Classmate
//
//  Created by Jasmine Dong on 5/1/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let className = UILabel()
    let classType = UILabel()
    let time = UILabel()
    let location = UILabel()
    let viewFriends = UILabel()
    let backgroundBox = UIView()
    
    var classColors = [UIColor(red: 241/255, green: 145/255, blue: 53/255, alpha: 1.0),
                           UIColor(red: 237/255, green: 98/255, blue: 55/255, alpha: 1.0),
                           UIColor(red: 55/255, green: 125/255, blue: 34/255, alpha: 1.0),
                           UIColor(red: 65/255, green: 83/255, blue: 175/255, alpha: 1.0),
                           UIColor(red: 214/255, green: 57/255, blue: 100/255, alpha: 1.0),
                           UIColor(red: 144/255, green: 54/255, blue: 170/255, alpha: 1.0),
                           UIColor(red: 105/255, green: 165/255, blue: 203/255, alpha: 1.0),
                           UIColor(red: 65/255, green: 148/255, blue: 136/255, alpha: 1.0)]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let padding: CGFloat = 10
        backgroundBox.frame = backgroundBox.frame.inset(by: UIEdgeInsets(top: padding/2, left: padding, bottom: padding/2, right: 0))
        backgroundBox.layer.cornerRadius = 10
        backgroundBox.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(backgroundBox)
        
        className.translatesAutoresizingMaskIntoConstraints = false
        className.font = UIFont.boldSystemFont(ofSize: 20)
        className.textColor = UIColor.white
        self.contentView.addSubview(className)
        
        classType.translatesAutoresizingMaskIntoConstraints = false
        classType.font = UIFont.systemFont(ofSize: 20)
        classType.textColor = UIColor.white
        self.contentView.addSubview(classType)
        
        time.translatesAutoresizingMaskIntoConstraints = false
        time.font = UIFont.systemFont(ofSize: 15)
        time.textColor = UIColor.white
        self.contentView.addSubview(time)
        
        location.translatesAutoresizingMaskIntoConstraints = false
        location.font = UIFont.systemFont(ofSize: 15)
        location.textColor = UIColor.white
        self.contentView.addSubview(location)
        
        viewFriends.translatesAutoresizingMaskIntoConstraints = false
        viewFriends.font = UIFont.systemFont(ofSize: 15)
        viewFriends.textColor = .white
        self.contentView.addSubview(viewFriends)
        
        setUpConstraints()
        
    }
    func setUpConstraints(){
        let padding = 10.0
        NSLayoutConstraint.activate([
            backgroundBox.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: padding),
            backgroundBox.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: padding),
            backgroundBox.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            backgroundBox.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)

            ])
        
        NSLayoutConstraint.activate([
            className.topAnchor.constraint(equalTo: backgroundBox.topAnchor, constant: 4),
            className.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            classType.bottomAnchor.constraint(equalTo: className.bottomAnchor),
            classType.leadingAnchor.constraint(equalTo: className.trailingAnchor, constant: 7),
        ])
        
        NSLayoutConstraint.activate([
            time.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            time.topAnchor.constraint(equalTo: className.bottomAnchor, constant: 4),
            //time.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            viewFriends.trailingAnchor.constraint(equalTo: backgroundBox    .trailingAnchor, constant: -5),
            viewFriends.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            //time.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            location.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            location.topAnchor.constraint(equalTo: time.bottomAnchor, constant: 4),
            //location.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateFrom(class1: Class, index: Int){
        className.text = class1.name
        classType.text = class1.type
        viewFriends.text = "Classmates"
        if class1.startMinute < 10{
            time.text = "\(class1.startHour):\(class1.startMinute)0 \(class1.startPeriod) - \(class1.endHour):\(class1.endMinute) \(class1.endPeriod)"}
        else if class1.endMinute < 10{
            time.text = "\(class1.startHour):\(class1.startMinute) \(class1.startPeriod) - \(class1.endHour):\(class1.endMinute)0 \(class1.endPeriod)"}
        else{
            time.text = "\(class1.startHour):\(class1.startMinute) \(class1.startPeriod) - \(class1.endHour):\(class1.endMinute) \(class1.endPeriod)"
            location.text = class1.location
        }
        backgroundBox.backgroundColor = classColors[index]
    }
}

