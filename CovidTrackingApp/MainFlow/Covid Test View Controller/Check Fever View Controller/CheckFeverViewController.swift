//
//  CheckFeverViewController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 3/21/21.
//

import UIKit

class CheckFeverViewController: UIViewController {
    
    @IBOutlet weak var lblSelectTemperature: UILabel!
    @IBOutlet weak var txtChooseTemperature: UITextField!
    @IBOutlet weak var lblSelectArea: UILabel!
    @IBOutlet weak var txtChooseArea: UITextField!
    
    let pickerViewChooseTemperature:UIPickerView! = UIPickerView()
    let pickerViewChooseArea:UIPickerView! = UIPickerView()
    
    let temperature = [35.0, 35.1, 35.2, 35.3, 35.4, 35.5, 35.6, 35.7, 35.8, 35.9, 36.0, 36.1, 36.2, 36.3, 36.4, 36.5, 36.6, 36.7, 36.8, 36.9, 37.0, 37.1, 37.2, 37.3, 37.4, 37.5, 37.6, 37.7, 37.8, 37.9, 38.0, 38.1, 38.2, 38.3, 38.4, 38.5, 38.6, 38.7, 38.8, 38.9, 39.0, 39.1, 39.2, 39.3, 39.4, 39.5, 39.6, 39.7, 39.8, 39.9, 40.0]
    let area = ["Oral", "Forehead", "Ear"]
    
    var selectedTemperature:Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewDelegation()
    }
    
    func pickerViewDelegation(){
        ///Add icon to text fields right side
//        let downImageView = UIImageView()
//        let downImage = UIImage(named: "downButton")
//        downImageView.image = downImage
//
//        txtChooseTemperature.rightView = downImageView
//        txtChooseArea.rightView = downImageView
//
//        txtChooseTemperature.rightViewMode = UITextField.ViewMode.always
//        txtChooseTemperature.rightViewMode = .always
//
//        txtChooseArea.rightViewMode = UITextField.ViewMode.always
//        txtChooseArea.rightViewMode = .always
        
        
        pickerViewChooseTemperature.delegate = self
        pickerViewChooseArea.delegate = self
        
        txtChooseTemperature.inputView = pickerViewChooseTemperature
        txtChooseArea.inputView = pickerViewChooseArea
        
        txtChooseTemperature.layer.borderWidth = 1
        txtChooseTemperature.layer.cornerRadius = 10
        txtChooseTemperature.layer.borderColor = UIColor(named: "textFieldBorderColor")?.cgColor
        
        
        
        txtChooseArea.layer.borderWidth = 1
        txtChooseArea.layer.cornerRadius = 10
        txtChooseArea.layer.borderColor = UIColor(named: "textFieldBorderColor")?.cgColor
    }


}

extension CheckFeverViewController:UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerViewChooseTemperature {
            return temperature.count
        }
        else {
            return area.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerViewChooseTemperature {
            return String(temperature[row])
        }
        else {
            return area[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerViewChooseTemperature {
            txtChooseTemperature.text = String(temperature[row])
            selectedTemperature = temperature[row]
            UserDefaults.standard.setValue(selectedTemperature, forKey: "fever")
        }
        else {
            txtChooseArea.text = area[row]
        }
    }
    
    
}
