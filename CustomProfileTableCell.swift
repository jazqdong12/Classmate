//
//  CustomProfileTableCell.swift
//  Classmate
//
//  Created by Jasmine Dong on 5/2/23.
//

import UIKit

class CustomProfileTableCell: UITableViewCell {
    
    let classNameLabel = UILabel()
    let classTypeLabel = UILabel()
    let locationLabel = UILabel()
    let daysLabel = UILabel()
    let timeLabel = UILabel()
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
        
        classTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        classTypeLabel.font = UIFont.systemFont(ofSize: 20)
        classTypeLabel.textColor = UIColor.white
        self.contentView.addSubview(classTypeLabel) // This line was corrected
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.font = UIFont.systemFont(ofSize: 15)
        locationLabel.textColor = UIColor.white
        self.contentView.addSubview(locationLabel)
        
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        daysLabel.font = UIFont.systemFont(ofSize: 15)
        daysLabel.textColor = UIColor.white
        self.contentView.addSubview(daysLabel)
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = UIFont.systemFont(ofSize: 15)
        timeLabel.textColor = UIColor.white
        self.contentView.addSubview(timeLabel)
        
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
            classNameLabel.topAnchor.constraint(equalTo: backgroundBox.topAnchor, constant: 8),
            classNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            classTypeLabel.bottomAnchor.constraint(equalTo: classNameLabel.bottomAnchor),
            classTypeLabel.leadingAnchor.constraint(equalTo: classNameLabel.trailingAnchor, constant: 7),
        ])
        
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            locationLabel.topAnchor.constraint(equalTo: classNameLabel.bottomAnchor, constant: 8),
        ])
        
        NSLayoutConstraint.activate([
            daysLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            daysLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 8),
            daysLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            timeLabel.topAnchor.constraint(equalTo: classNameLabel.bottomAnchor, constant: 8),
            timeLabel.leadingAnchor.constraint(equalTo: locationLabel.trailingAnchor, constant: 10),
            timeLabel.bottomAnchor.constraint(equalTo: locationLabel.bottomAnchor)
        ])
    }
    
    func updateFrom(class1: Class, index: Int) {
        classNameLabel.text = class1.name
        locationLabel.text = class1.location
        classTypeLabel.text = class1.type
        
        var daysString = ""
        for days in class1.days {
                daysString += (days + " ")
            daysLabel.text = daysString
    
        if class1.startMinute < 10{
            timeLabel.text = "\(class1.startHour):\(class1.startMinute)0 \(class1.startPeriod) - \(class1.endHour):\(class1.endMinute) \(class1.endPeriod)"}
        else if class1.endMinute < 10{
            timeLabel.text = "\(class1.startHour):\(class1.startMinute) \(class1.startPeriod) - \(class1.endHour):\(class1.endMinute)0 \(class1.endPeriod)"}
        else{
            timeLabel.text = "\(class1.startHour):\(class1.startMinute) \(class1.startPeriod) - \(class1.endHour):\(class1.endMinute) \(class1.endPeriod)"
        }
    }
        backgroundBox.backgroundColor = classColors[index]
        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
