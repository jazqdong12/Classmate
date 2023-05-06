//
//  Student.swift
//  Classmate
//
//  Created by Jasmine Dong on 5/2/23.
//

import Foundation
import UIKit

class Student {
    // First name
    var firstName: String
    
    // Last name
    var lastName: String
    
    // Email
    var email: String
    
    // NetID
    var netID: String
    
    // Password
    var password: String
    
    // Classes the student is taking
    var classes: [String]
    
    // Friends of the student
    var friends: [String]
    
    // Icon
    var iconName : String
    
    init(firstName: String, lastName: String, email: String, netID: String, password: String, classes: [String], friends: [String], iconName: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.netID = netID
        self.password = password
        self.classes = classes
        self.friends = friends
        self.iconName = iconName
    }
}
