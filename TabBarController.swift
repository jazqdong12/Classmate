//
//  TabBarController.swift
//  Classmate
//
//  Created by Jasmine Dong on 5/1/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.tabBar.barTintColor = UIColor.black
        self.tabBar.tintColor = UIColor.white
        self.tabBar.unselectedItemTintColor = UIColor.gray // set the unselectedItemTintColor
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        // create the view controllers for each tab
        let homeViewController = HomeViewController(delegate: nil, placeholderText: "")
        homeViewController.tabBarItem = UITabBarItem(title: "My Schedule", image: UIImage(systemName: "house"), tag: 0)
        
        let addViewController = AddClassViewController()
        addViewController.tabBarItem = UITabBarItem(title: "Add Classes", image: UIImage(systemName: "plus.circle"), tag: 1)
        
        let friendsViewController = FriendsViewController()
        friendsViewController.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person.2"), tag: 2)
        
        let profileViewController = ViewController()
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 3)
        
        // set the view controllers for the tab bar
        self.setViewControllers([homeViewController, addViewController, friendsViewController, profileViewController], animated: false)
        
    }
}
