//
//  SignUpPersonalViewController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 3/8/21.
//

import UIKit



// Add Address, Weight, Height


class SignUpPersonalViewController: UIViewController {
    
    @IBOutlet weak var stckMain: UIStackView!
    
    let pickerViewMarital:UIPickerView! = UIPickerView()
    
    let pickerViewHealthSector:UIPickerView! = UIPickerView()
    
    let pickerViewGender:UIPickerView! = UIPickerView()
    
    let maritalStatus = ["Married", "Single"]
    
    let healthSector = ["Yes", "No"]
    
    let gender = ["Male","Female"]
    
    let txtSurname = CustomFreeTextRow()
    
    let txtName = CustomFreeTextRow()
    
    let txtMaritalStatus = CustomFreeTextRow()
    
    let txtWorkHealthSector = CustomFreeTextRow()
    
    let txtGender = CustomFreeTextRow()
    
    let weight = CustomFreeTextRow()
    
    let height = CustomFreeTextRow()
    
    let txtAge = CustomFreeTextRow()
    
    let txtPhoneNumber = CustomFreeTextRow()
    
    let txtPasswordAgain = CustomFreeTextRow()
    
    let txtPassword = CustomFreeTextRow()
    
    let txtIdentityNo = CustomFreeTextRow()
    
    var selectedGender:Bool!
    
    var selectedHealthSector:Bool!
    
    var selectedMeritialStatus:Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SignUp"
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.tintColor = UIColor(named: "textFieldPlaceholderColor")
        
        initTextFields()
        initPickerView()
    }
    
    func initPickerView(){
        pickerViewMarital.delegate = self
        pickerViewMarital.dataSource = self
        pickerViewHealthSector.delegate = self
        pickerViewHealthSector.dataSource = self
        pickerViewGender.delegate = self
        pickerViewGender.dataSource = self
        txtMaritalStatus.txtMain.inputView = pickerViewMarital
        txtWorkHealthSector.txtMain.inputView = pickerViewHealthSector
        txtGender.txtMain.inputView = pickerViewGender
    }
    
    func signUpAction(completion: @escaping callback){
        AccountService.SignUp(name: txtName.txtMain.text!, surname: txtSurname.txtMain.text!, identityNo: txtIdentityNo.txtMain.text!, password: txtPassword.txtMain.text!, gender: selectedGender, age: Int(txtAge.txtMain.text!)!, weight: Double(weight.txtMain.text!)!, height: Double(height.txtMain.text!)!, mobileNumber: Int(txtPhoneNumber.txtMain.text!)!, meritialStatus: selectedMeritialStatus, workHealthSector: selectedHealthSector) { (response, message) in
            guard let response = response else {
                completion(false, message)
                return
            }
            UserDefaults.standard.setValue(response.userId, forKey: "userId")
            completion(true, message)
        }
    }
    
    
    
    
    
    func initTextFields(){
        
        let btnNext = CustomSingleNextButton()
        btnNext.delegate = self
        stckMain.insertArrangedSubview(btnNext, at: 0)
        
        let emptySpace = self.stackViewSpacing(value: 15)
        self.stckMain.insertArrangedSubview(emptySpace, at: 0)
        
        txtGender.setPlaceholder(placeholder: "Gender")
        stckMain.insertArrangedSubview(txtGender, at: 0)
        
        txtWorkHealthSector.setPlaceholder(placeholder: "Work In Health Sector?")
        stckMain.insertArrangedSubview(txtWorkHealthSector, at: 0)
        
        txtMaritalStatus.setPlaceholder(placeholder: "Marital Status")
        stckMain.insertArrangedSubview(txtMaritalStatus, at: 0)
        
        
        weight.setPlaceholder(placeholder: "Weight")
        weight.setKeybardType(type: .decimalPad)
        stckMain.insertArrangedSubview(weight, at: 0)
        
        
        height.setPlaceholder(placeholder: "Height")
        height.setKeybardType(type: .decimalPad)
        stckMain.insertArrangedSubview(height, at: 0)
        
        
        txtAge.setPlaceholder(placeholder: "Age")
        txtAge.setKeybardType(type: .numberPad)
        stckMain.insertArrangedSubview(txtAge, at: 0)
        
        
        txtPhoneNumber.setPlaceholder(placeholder: "Telephone Number")
        txtPhoneNumber.setKeybardType(type: .numberPad)
        stckMain.insertArrangedSubview(txtPhoneNumber, at: 0)
        
        
        txtPasswordAgain.setPlaceholder(placeholder: "Password Again")
        txtPasswordAgain.setKeybardType(type: .default)
        txtPasswordAgain.txtMain.isSecureTextEntry = true
        stckMain.insertArrangedSubview(txtPasswordAgain, at: 0)
        
        
        txtPassword.setPlaceholder(placeholder: "Password")
        txtPassword.setKeybardType(type: .default)
        txtPassword.txtMain.isSecureTextEntry = true
        stckMain.insertArrangedSubview(txtPassword, at: 0)
        
        
        txtIdentityNo.setPlaceholder(placeholder: "Identity No")
        txtIdentityNo.setKeybardType(type: .numberPad)
        stckMain.insertArrangedSubview(txtIdentityNo, at: 0)
        
        
        txtSurname.setPlaceholder(placeholder: "Surname")
        txtSurname.setKeybardType(type: .alphabet)
        stckMain.insertArrangedSubview(txtSurname, at: 0)
        
        
        txtName.setPlaceholder(placeholder: "Name")
        txtName.setKeybardType(type: .alphabet)
        stckMain.insertArrangedSubview(txtName, at: 0)
    }
}

extension SignUpPersonalViewController:UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerViewMarital {
            return maritalStatus.count
        }
        else if pickerView == pickerViewHealthSector {
            return healthSector.count
        }
        else {
            return gender.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerViewMarital {
            return maritalStatus[row]
        }
        else if pickerView == pickerViewHealthSector {
            return healthSector[row]
        }
        else {
            return gender[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerViewMarital {
            txtMaritalStatus.txtMain.text = maritalStatus[row]
            if maritalStatus[row].uppercased() == "MARRIED" {
                selectedMeritialStatus = true
            }
            else if maritalStatus[row].uppercased() == "SINGLE" {
                selectedMeritialStatus = false
            }
        }
        else if pickerView == pickerViewHealthSector {
            txtWorkHealthSector.txtMain.text = healthSector[row]
            if healthSector[row].uppercased() == "YES" {
                selectedHealthSector = true
            }
            else if healthSector[row].uppercased() == "NO" {
                selectedHealthSector = false
            }
        }
        else {
            txtGender.txtMain.text = gender[row]
            if gender[row].uppercased() == "MALE" {
                selectedGender = true
            }
            else if gender[row].uppercased() == "FEMALE" {
                selectedGender = false
            }
        }
    }
}

extension SignUpPersonalViewController:CustomSingleNextButtonDelegate {
    func nextPressed() {
        
//        let chooseUserViewController = ChooseAddressViewController()
//        self.navigationController?.pushViewController(chooseUserViewController, animated: true)
        
                signUpAction { (success, msg) in
                    if success {
                let chooseUserViewController = ChooseAddressViewController()
                self.navigationController?.pushViewController(chooseUserViewController, animated: true)
        
                    }
                    else {
                        /// Add Alert View
                    }
                }
    }
}

extension UIViewController{
    func stackViewSpacing(value: CGFloat) -> UIView {
        let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        spacerView.heightAnchor.constraint(equalToConstant: value).isActive = true
        return spacerView
    }
}


