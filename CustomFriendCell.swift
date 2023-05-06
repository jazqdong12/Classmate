//
//  CustomFriendCell.swift
//  Classmate
//
//  Created by Jasmine Dong on 5/3/23
//

import UIKit

class CustomFriendCell: UITableViewCell {
    
    let backgroundBox = UIView()
    let icon = UIImageView()
    let name = UILabel()
    let body = UILabel()
    let padding: CGFloat = 10
    
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

        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.layer.cornerRadius = 10
        icon.layer.masksToBounds = true
        icon.layer.borderWidth = 1.5
        icon.contentMode = .scaleAspectFill
        self.contentView.addSubview(icon)

        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.textColor = UIColor.white
        self.contentView.addSubview(name)

        body.translatesAutoresizingMaskIntoConstraints = false
        body.font = UIFont.systemFont(ofSize: 12)
        body.textColor = UIColor.white
        body.numberOfLines = 0
        self.contentView.addSubview(body)

        setUpContraints()
    }

    
    func setUpContraints(){
        let padding = 10.0
        NSLayoutConstraint.activate([
            backgroundBox.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: padding),
            backgroundBox.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: padding),
            backgroundBox.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -padding),
            backgroundBox.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)

            ])
        NSLayoutConstraint.activate([
            icon.topAnchor.constraint(equalTo: self.backgroundBox.topAnchor),
            icon.bottomAnchor.constraint(equalTo: self.backgroundBox.bottomAnchor),
            icon.leadingAnchor.constraint(equalTo: self.backgroundBox.leadingAnchor),
            icon.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.25),
            //icon.heightAnchor.constraint(equalTo: icon.widthAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            name.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20),
            name.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            name.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            body.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20),
            body.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 5),
            body.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            body.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10)

            ])

        
    }
    
    func updateFrom(student: Student, index: Int){
        name.text = student.firstName + " " + student.lastName
        icon.image = UIImage(named: student.iconName)
        body.text = String(index) + " classes shared"
        backgroundBox.backgroundColor = classColors[index]
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

