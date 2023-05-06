//
//  CustomSuggestedClassCell.swift
//  Classmate
//
//  Created by Jasmine Dong on 5/2/23.
//

import UIKit

class CustomSuggestedClassCell: UITableViewCell {
    
    let classNameLabel = UILabel()
    let locationLabel = UILabel()
    let friendsLabel = UILabel()
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
        backgroundBox.frame = backgroundBox.frame.inset(by: UIEdgeInsets(top: padding/2, left: padding, bottom: padding/2, right: padding))
        backgroundBox.layer.cornerRadius = 10
        backgroundBox.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(backgroundBox)
        
        classNameLabel.translatesAutoresizingMaskIntoConstraints = false
        classNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        classNameLabel.textColor = UIColor.white
        self.contentView.addSubview(classNameLabel)
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.font = UIFont.systemFont(ofSize: 15)
        locationLabel.textColor = UIColor.white
        self.contentView.addSubview(locationLabel)
        
        friendsLabel.translatesAutoresizingMaskIntoConstraints = false
        friendsLabel.font = UIFont.systemFont(ofSize: 15)
        friendsLabel.textColor = UIColor.white
        self.contentView.addSubview(friendsLabel)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        let padding = 10.0
        NSLayoutConstraint.activate([
            backgroundBox.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: padding),
            backgroundBox.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: padding),
            backgroundBox.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -padding),
            backgroundBox.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)

            ])
        
        NSLayoutConstraint.activate([
            classNameLabel.topAnchor.constraint(equalTo: backgroundBox.topAnchor, constant: 20),
            classNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            locationLabel.topAnchor.constraint(equalTo: classNameLabel.bottomAnchor, constant: 5),
        ])
        
        NSLayoutConstraint.activate([
            friendsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            friendsLabel.topAnchor.constraint(equalTo: locationLabel.topAnchor),
        ])
    }
    
    func updateFrom(class1: Class, index: Int) {
        classNameLabel.text = class1.name
        locationLabel.text = class1.location
        var friendInt = 0
        for _ in class1.friends {
            friendInt += 1
        }
        let friendsString = String(friendInt) + " friends in this course! "
        friendsLabel.text = friendsString
        backgroundBox.backgroundColor = classColors[index]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
