//
//  FindTicketCell.swift
//  TicketsApp
//
//  Created by Mac on 14.03.2018.
//  Copyright © 2018 salgara. All rights reserved.
//
import UIKit
import Cartography

class FindTicketCell : UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource{
    
    let fromCityLabel: UILabel
    let toCityLabel: UILabel
    let fromCityField: UITextField
    let toCityField: UITextField
    
    let vector: UIImageView
    
    let oneDirection: UILabel
    let datePicker: UIDatePicker
    let returnFlightField: UITextField
    
    let classLabel: UILabel
    let passangerLabel: UILabel
    
    let classPicker: UIPickerView
    let passangerImage: UIImageView
    let dataType = ["Эконом", "Бизнес"]
    
    let findBtn: UIButton
    
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        self.fromCityLabel = UILabel()
        self.toCityLabel = UILabel()
        self.fromCityField = TextField()
        self.toCityField = TextField()
        self.vector = UIImageView()
        
        self.oneDirection = UILabel()
        self.datePicker = UIDatePicker()
        self.returnFlightField = TextField()
        
        self.classLabel = UILabel()
        self.passangerLabel = UILabel()
        self.classPicker = UIPickerView()
        self.passangerImage = UIImageView()
        self.findBtn = UIButton()
    
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        classPicker.delegate = self
        classPicker.dataSource = self
        
        initViews()
        addView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews(){
        fromCityLabel.textColor = .black
        fromCityLabel.font = UIFont.systemFont(ofSize: 14.0)
        fromCityLabel.text = "Откуда"
        
        fromCityField.placeholder = "Выберите город"
        fromCityField.backgroundColor = UIColor.white
        fromCityField.isEnabled = true
        fromCityField.allowsEditingTextAttributes = true
        fromCityField.layer.cornerRadius = 15.0
        
        vector.image = #imageLiteral(resourceName: "Vector")
        
        toCityLabel.textColor = .black
        toCityLabel.font = UIFont.systemFont(ofSize: 14.0)
        toCityLabel.text = "Куда"
        
        toCityField.placeholder = "Выберите город"
        toCityField.backgroundColor = UIColor.white
        toCityField.isEnabled = true
        toCityField.allowsEditingTextAttributes = true
        toCityField.layer.cornerRadius = 15.0
        
        oneDirection.textColor = .black
        oneDirection.font = UIFont.systemFont(ofSize: 14.0)
        oneDirection.text = "В одну сторону"
        
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.isEnabled = true
        datePicker.backgroundColor = UIColor.white
        datePicker.layer.cornerRadius = 15.0
//        let currentDate = NSDate()
//        datePicker.minimumDate = currentDate as Date
//        datePicker.date = currentDate as Date
        
        
        returnFlightField.placeholder = "Обртный рейс"
        returnFlightField.backgroundColor = UIColor.white
        returnFlightField.isEnabled = true
        returnFlightField.allowsEditingTextAttributes = true
        returnFlightField.layer.cornerRadius = 15.0
        
        classLabel.textColor = .black
        classLabel.font = UIFont.systemFont(ofSize: 14.0)
        classLabel.text = "Класс"
        
        passangerLabel.textColor = .black
        passangerLabel.font = UIFont.systemFont(ofSize: 14.0)
        passangerLabel.text = "Пассажиры"
        
        passangerImage.image = #imageLiteral(resourceName: "Group 3")
        passangerImage.backgroundColor = UIColor.white
        
        classPicker.backgroundColor = UIColor.white
        classPicker.layer.cornerRadius = 15.0
        
        findBtn.backgroundColor = UIColor(red:0.11, green:0.44, blue:0.89, alpha:1.0)
        //findBtn.tintColor = UIColor.white
        findBtn.setTitle("Найти билет", for: .normal)
        findBtn.contentHorizontalAlignment = .center
//        findBtn.addTarget(self, action: "findButtonHandler", for: UIControlEvents.touchUpInside)
        
    }
    func addView(){
        self.addSubview(fromCityLabel)
        self.addSubview(toCityLabel)
        self.addSubview(fromCityField)
        self.addSubview(toCityField)
        self.addSubview(vector)
        self.addSubview(oneDirection)
        self.addSubview(datePicker)
        self.addSubview(returnFlightField)
        self.addSubview(classLabel)
        self.addSubview(passangerLabel)
        self.addSubview(classPicker)
        self.addSubview(passangerImage)
        self.addSubview(findBtn)
    }
    func setupConstraints(){
        constrain(fromCityLabel, fromCityField, vector, self){
            label, field, image, view in
            
            label.width == view.width
            label.height == 20
            label.top == view.top+20
            label.left == view.left+20
            label.right == view.right+20
            
            field.width == view.width-20
            field.height == 50
            field.left == view.left+10
            field.top == label.bottom+10
            
            image.width == 20
            image.height == 20
            image.top == field.bottom+10
            image.right == view.right-20
            
        }
        constrain(toCityLabel, toCityField, fromCityField, self){label, field, fromField, view in
            
            label.width == view.width
            label.height == 20
            label.top == fromField.bottom+10
            label.left == view.left+20
            label.right == view.right+20
            
            field.width == view.width-20
            field.height == 50
            field.left == view.left+10
            field.top == label.bottom+10
        }
        constrain(toCityField, oneDirection, self){field, label, view in
            label.width == view.width
            label.height == 20
            label.top == field.bottom+10
            label.left == view.left+20
            label.right == view.right+20
        }
        constrain(datePicker, returnFlightField, oneDirection, self){picker, field, label, view in
            
            picker.width == view.width/2-20
            picker.height == 50
            picker.top == label.bottom+10
            picker.left == view.left+10
            
            field.width == view.width/2-40
            field.height == 50
            field.top == label.bottom+10
            field.left == picker.right+20
        }
        
        constrain(classLabel, datePicker, self){ label, picker, view in
            label.width == view.width
            label.height == 20
            label.top == picker.bottom+10
            label.left == view.left+20
            label.right == view.right+20
        }
        constrain(classPicker, classLabel, self){ picker, label, view in
            picker.width == view.width/2-20
            picker.height == 50
            picker.left == view.left+10
            picker.top == label.bottom+10
        }
        
        constrain(passangerLabel, returnFlightField, self){ label, field, view in
            label.width == view.width/2-40
            label.height == 20
            label.top == field.bottom+10
            label.left == field.left+20
        }
        constrain(passangerImage, passangerLabel, self){ image, label, view in
            image.width == view.width/2-40
            image.height == 40
            image.left == label.left-10
            image.top == label.bottom+10
        }
        constrain(findBtn, self){button, view in
            button.width == view.width
            button.height == 60
            button.bottom == view.bottom-60
            button.left == view.left
            button.right == view.right
        }
        
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataType.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataType[row]
    }
}

class TextField: UITextField {
    let padding = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    func findButtonHandler(sender: UIButton){
     print("HHHHHHHHELLLO")
    }
}


