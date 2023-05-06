//
//  Class.swift
//  Classmate
//
//  Created by Jasmine Dong on 5/1/23.
//

import Foundation
import UIKit

class Class {
    //class name, ex: CS2110
    var name : String
    
    //type, ex: Lecture, Discussion, Lab
    var type : String
    
    //days of the week
    var days : [String]
    
    //start time, ex: 9:05 AM
    var startHour : Int
    var startMinute : Int
    var startPeriod : String //AM or PM
    
    //end time, same as start
    var endHour : Int
    var endMinute : Int
    var endPeriod : String //AM or PM
    
    //location
    var location : String
    
    //friends in your class, set of netid's ex. [jqd3, el596]
    var friends : [String]
    
    init(name: String, type: String, days: [String], startHour: Int, startMinute: Int, startPeriod: String, endHour: Int, endMinute: Int, endPeriod: String, location : String, friends: [String]){
        self.name = name
        self.type = type
        self.days = days
        self.startHour = startHour
        self.startMinute = startMinute
        self.startPeriod = startPeriod
        self.endHour = endHour
        self.endMinute = endMinute
        self.endPeriod = endPeriod
        self.location = location
        self.friends = friends
    }
}

