//
//  AddViewController.swift
//  Classmate
//
//  Created by Jasmine Dong on 5/2/23.
//

import UIKit

import UIKit

class AddClassManualViewController: UIViewController {
    

//    let scrollView = UIScrollView()
//    let contentView = UIView()
    let titleLabel = UILabel()
    let classNameLabel = UILabel()
    let classNameTextField = UITextField()
    let classTypeSegmentedControl = UIStackView()
    let classDaysStackView = UIStackView()
    let classLocationLabel = UILabel()
    let classLocationTextField = UITextField()
    let classStartTimeLabel = UILabel()
    let classStartTimeTextField = UITextField()
    let classEndTimeLabel = UILabel()
    let classEndTimeTextField = UITextField()
    let saveButton = UIButton()
    let dismissButton = UIButton(type: .system)
    let labButton = UIButton()
    let lectureButton = UIButton()
    let discussionButton = UIButton()
    let leadingInt = 44.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        titleLabel.text = "Course Information"
        titleLabel.font = UIFont.boldSystemFont(ofSize:30)
        
        classNameLabel.text = "Class Name"
        classNameLabel.font = UIFont.systemFont(ofSize: 18)
        
        classLocationLabel.text = "Location"
        classLocationLabel.font = UIFont.systemFont(ofSize: 18)
        
        classStartTimeLabel.text = "Start Time"
        classStartTimeLabel.font = UIFont.systemFont(ofSize: 18)
        
        classEndTimeLabel.text = "End Time"
        classEndTimeLabel.font = UIFont.systemFont(ofSize: 18)
        
        //textFields
        classNameTextField.placeholder = "CS2110"
        classNameTextField.borderStyle = .roundedRect
        classNameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        classLocationTextField.placeholder = "Duffield Hall"
        classLocationTextField.borderStyle = .roundedRect
        classLocationTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        classStartTimeTextField.placeholder = "9:05AM"
        classStartTimeTextField.borderStyle = .roundedRect
        classStartTimeTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        classEndTimeTextField.placeholder = "9:55AM"
        classEndTimeTextField.borderStyle = .roundedRect
        classEndTimeTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        // Class type buttons
        lectureButton.setTitle("Lecture", for: .normal)
        lectureButton.setTitleColor(UIColor.black, for: .normal)
        lectureButton.layer.cornerRadius = 10
        lectureButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        lectureButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        lectureButton.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        lectureButton.tag = 0
        lectureButton.addTarget(self,action: #selector(buttonAction2), for: .touchUpInside)
        lectureButton.isSelected = false
        
        discussionButton.setTitle("Discussion", for: .normal)
        discussionButton.setTitleColor(UIColor.black, for: .normal)
        discussionButton.layer.cornerRadius = 10
        discussionButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        discussionButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        discussionButton.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        discussionButton.tag = 1
        discussionButton.addTarget(self,action: #selector(buttonAction2), for: .touchUpInside)
        
        
        labButton.setTitle("Lab", for: .normal)
        labButton.setTitleColor(UIColor.black, for: .normal)
        labButton.layer.cornerRadius = 10
        labButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        labButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        labButton.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        labButton.tag = 2
        labButton.addTarget(self,action: #selector(buttonAction2), for: .touchUpInside)
        
        classTypeSegmentedControl.axis = .horizontal
        classTypeSegmentedControl.distribution = .fillEqually
        classTypeSegmentedControl.alignment = .center
        classTypeSegmentedControl.spacing = 10
        classTypeSegmentedControl.addArrangedSubview(lectureButton)
        classTypeSegmentedControl.addArrangedSubview(discussionButton)
        classTypeSegmentedControl.addArrangedSubview(labButton)
        
        // Save button constraints
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = UIColor.black
        saveButton.layer.cornerRadius = 20
        saveButton.setTitleColor(.white, for: .normal)
        
        // Dimiss button
        if let image = UIImage(systemName: "xmark") {
            let tintedImage = image.withTintColor(UIColor.black)
            dismissButton.setImage(tintedImage, for: .normal)
        }
        dismissButton.addTarget(self, action: #selector(dismissTapped), for: .touchUpInside)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.setTitleColor(.white, for: .normal)
        dismissButton.tintColor = UIColor.black
        view.addSubview(dismissButton)

        // Class type segmented control
        classTypeSegmentedControl.axis = .horizontal
        classTypeSegmentedControl.distribution = .fillEqually
        
        // Class days of the week stack view
        classDaysStackView.axis = .horizontal
        classDaysStackView.distribution = .fillEqually
        classDaysStackView.alignment = .center
        classDaysStackView.spacing = 10
        
        let days = ["M", "T", "W", "TR", "F"]
        for day in days {
            let dayButton = UIButton()
            dayButton.setTitle(day, for: .normal)
            dayButton.setTitleColor(UIColor.black, for: .normal)
            dayButton.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
            dayButton.layer.cornerRadius = 15
            dayButton.layer.masksToBounds = true
            dayButton.isSelected = false
            dayButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
            dayButton.addTarget(self,action: #selector(buttonAction), for: .touchUpInside)
            classDaysStackView.addArrangedSubview(dayButton)
        }
        
        view.addSubview(titleLabel)
        view.addSubview(classNameLabel)
        view.addSubview(classNameTextField)
        view.addSubview(classTypeSegmentedControl)
        view.addSubview(classDaysStackView)
        view.addSubview(classLocationLabel)
        view.addSubview(classLocationTextField)
        view.addSubview(classStartTimeLabel)
        view.addSubview(classStartTimeTextField)
        view.addSubview(classEndTimeLabel)
        view.addSubview(classEndTimeTextField)
        view.addSubview(saveButton)
        view.addSubview(dismissButton)
    

        setUpConstraints()
    }
    
    func setUpConstraints(){
            
            // title label
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingInt),
            ])
            
            // class name label and text field
            classNameLabel.translatesAutoresizingMaskIntoConstraints = false
            classNameTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                classNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
                classNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingInt),
                classNameTextField.topAnchor.constraint(equalTo: classNameLabel.bottomAnchor, constant: 10),
                classNameTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
            ])
        
        //class type
        classTypeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            classTypeSegmentedControl.topAnchor.constraint(equalTo: classNameTextField.bottomAnchor, constant: 30),
            classTypeSegmentedControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        // class days
        classDaysStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            classDaysStackView.topAnchor.constraint(equalTo: classTypeSegmentedControl.bottomAnchor, constant: 30),
            classDaysStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
            
            // class location label and text field
            classLocationLabel.translatesAutoresizingMaskIntoConstraints = false
            classLocationTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                classLocationLabel.topAnchor.constraint(equalTo:  classDaysStackView.bottomAnchor, constant: 30),
                classLocationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingInt),
                classLocationTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                classLocationTextField.topAnchor.constraint(equalTo: classLocationLabel.bottomAnchor, constant: 10),
            ])
            
            // class start time label and text field
            classStartTimeLabel.translatesAutoresizingMaskIntoConstraints = false
            classStartTimeTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                classStartTimeLabel.topAnchor.constraint(equalTo: classLocationTextField.bottomAnchor, constant: 30),
                classStartTimeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingInt),
                classStartTimeTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                classStartTimeTextField.topAnchor.constraint(equalTo: classStartTimeLabel.bottomAnchor, constant: 10),
            ])
        
        classEndTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        classEndTimeTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            classEndTimeLabel.topAnchor.constraint(equalTo: classStartTimeTextField.bottomAnchor, constant: 30),
            classEndTimeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: leadingInt),
            classEndTimeTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            classEndTimeTextField.topAnchor.constraint(equalTo: classEndTimeLabel.bottomAnchor, constant: 10),
        ])
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35),
            saveButton.widthAnchor.constraint(equalToConstant: 200),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    
    }
    
    @objc func buttonAction(sender: UIButton) {
        sender.isSelected.toggle()
        if(sender.isSelected) {
            sender.backgroundColor = UIColor.lightGray
        }
        else {
            sender.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        }
        
    }
    
    @objc func dismissTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonAction2(_ sender: UIButton) {
        if sender.tag == 0{
            if discussionButton.isSelected || labButton.isSelected{
                return
            }
        }else if sender.tag == 1{
            if lectureButton.isSelected || labButton.isSelected{
                return
            }
            
        }else if sender.tag == 2{
            if discussionButton.isSelected || lectureButton.isSelected{
                return
            }
            
        }
        sender.isSelected.toggle()
        if(sender.isSelected) {
            sender.backgroundColor = UIColor.lightGray
        }
        else {
            sender.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        }
    }
        
        
    }

