//
//  changePicViewController.swift
//  Classmate
//
//  Created by Jasmine Dong on 3/22/23.
//

import UIKit


class changePicViewController: UIViewController {
    
    //TODO: Add picImage and NameTextField
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let button5 = UIButton()
    let button6 = UIButton()
    let button7 = UIButton()
    let button8 = UIButton()
    let submitButton = UIButton()
    
    weak var delegate1: (ChangeImageDelegate)?
    
    //TODO: Add weak delegate and initializer let quote: Quote
    init(delegate1: ChangeImageDelegate) {
        self.delegate1 = delegate1
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        
        // Save button constraints
        submitButton.setTitle("Save", for: .normal)
        submitButton.backgroundColor = UIColor.black
        submitButton.layer.cornerRadius = 20
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.addTarget(self, action: #selector(submit), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)
        
        button1.setImage(UIImage(named: "bear1"), for: .normal)
        button1.tag = 0
        button1.addTarget(self, action:#selector(picButton), for: .touchUpInside)
        button1.contentMode = .scaleAspectFill
        button1.clipsToBounds = true
        button1.layer.cornerRadius = 10
        button1.layer.masksToBounds = true
        button1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button1)
        
        button2.setImage(UIImage(named: "bear2"), for: .normal)
        button2.tag = 1
        button2.addTarget(self, action:#selector(picButton), for: .touchUpInside)
        button2.contentMode = .scaleAspectFill
        button2.clipsToBounds = true
        button2.layer.cornerRadius = 10
        button2.layer.masksToBounds = true
        button2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button2)
        
        button3.setImage(UIImage(named: "bear3"), for: .normal)
        button3.tag = 2
        button3.addTarget(self, action:#selector(picButton), for: .touchUpInside)
        button3.contentMode = .scaleAspectFill
        button3.clipsToBounds = true
        button3.layer.cornerRadius = 10
        button3.layer.masksToBounds = true
        button3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button3)
        
        button4.setImage(UIImage(named: "bear4"), for: .normal)
        button4.tag = 3
        button4.addTarget(self, action:#selector(picButton), for: .touchUpInside)
        button4.contentMode = .scaleAspectFill
        button4.clipsToBounds = true
        button4.layer.cornerRadius = 10
        button4.layer.masksToBounds = true
        button4.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button4)
        
        button5.setImage(UIImage(named: "bear5"), for: .normal)
        button5.tag = 4
        button5.addTarget(self, action:#selector(picButton), for: .touchUpInside)
        button5.contentMode = .scaleAspectFill
        button5.clipsToBounds = true
        button5.layer.cornerRadius = 10
        button5.layer.masksToBounds = true
        button5.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button5)
        
        button6.setImage(UIImage(named: "bear6"), for: .normal)
        button6.tag = 5
        button6.addTarget(self, action:#selector(picButton), for: .touchUpInside)
        button6.contentMode = .scaleAspectFill
        button6.clipsToBounds = true
        button6.layer.cornerRadius = 10
        button6.layer.masksToBounds = true
        button6.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button6)
        
        button7.setImage(UIImage(named: "bear7"), for: .normal)
        button7.tag = 6
        button7.addTarget(self, action:#selector(picButton), for: .touchUpInside)
        button7.contentMode = .scaleAspectFill
        button7.clipsToBounds = true
        button7.layer.cornerRadius = 10
        button7.layer.masksToBounds = true
        button7.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button7)
        
        button8.setImage(UIImage(named: "bear8"), for: .normal)
        button8.tag = 7
        button8.addTarget(self, action:#selector(picButton), for: .touchUpInside)
        button8.contentMode = .scaleAspectFill
        button8.clipsToBounds = true
        button8.layer.cornerRadius = 10
        button8.layer.masksToBounds = true
        button8.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button8)
        
        setupConstraints()
    }
    let padding = 50.0
    let size = 0.30
    
    func setupConstraints () {
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: button7.bottomAnchor, constant: 40),
            submitButton.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            submitButton.widthAnchor.constraint(equalToConstant: 200),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            button1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: size),
            button1.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: size),
            button1.topAnchor.constraint(equalTo:view.topAnchor, constant: 120),
            button1.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            button2.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: size),
            button2.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: size),
            button2.topAnchor.constraint(equalTo:view.topAnchor, constant: 120),
            button2.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            button3.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: size),
            button3.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: size),
            button3.topAnchor.constraint(equalTo:button1.bottomAnchor, constant: 20),
            button3.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            button4.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: size),
            button4.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: size),
            button4.topAnchor.constraint(equalTo:button1.bottomAnchor, constant: 20),
            button4.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            button5.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: size),
            button5.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: size),
            button5.topAnchor.constraint(equalTo:button3.bottomAnchor, constant: 20),
            button5.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            button6.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: size),
            button6.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: size),
            button6.topAnchor.constraint(equalTo:button4.bottomAnchor, constant: 20),
            button6.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            button7.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: size),
            button7.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: size),
            button7.topAnchor.constraint(equalTo:button5.bottomAnchor, constant: 20),
            button7.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            button8.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: size),
            button8.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: size),
            button8.topAnchor.constraint(equalTo:button6.bottomAnchor, constant: 20),
            button8.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -padding)
        ])
        
        
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func submit (sender: UIButton) {
//        let vc = ViewController()
//        navigationController?.pushViewController(vc, animated: true)
        if(submitButton.isSelected) {
            delegate1?.changeImage(image: "bear8")
        }
        }
    
    @objc func picButton (sender: UIButton){
        sender.isSelected.toggle()
        if(sender.isSelected) {
            sender.layer.borderWidth = 3.0
        }
        else {
            sender.layer.borderWidth = 0.0
        }
    }
    
    

}
    //TODO: Delegate picture
    protocol ChangeImageDelegate: AnyObject{
        func changeImage(image: String)
    }

   
