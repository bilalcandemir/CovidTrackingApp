//
//  PresenceOfDiseaseViewController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 3/10/21.
//

import UIKit

class PresenceOfDiseaseViewController: UIViewController {
    
    @IBOutlet weak var stckMain: UIStackView!
    
    let ards = CustomDiseaseCheckRow()
    let pneumonia = CustomDiseaseCheckRow()
    let covid19 = CustomDiseaseCheckRow()
    let sarsCov2 = CustomDiseaseCheckRow()
    let careUnit = CustomDiseaseCheckRow()
    let chronicLung = CustomDiseaseCheckRow()
    let diabetes = CustomDiseaseCheckRow()
    let hypertension = CustomDiseaseCheckRow()
    let chronicLiver = CustomDiseaseCheckRow()
    let chronicKidney = CustomDiseaseCheckRow()
    let chronicHearth = CustomDiseaseCheckRow()
    let geneticDisorder = CustomDiseaseCheckRow()
    let bloodCancer = CustomDiseaseCheckRow()
    let otherCancer = CustomDiseaseCheckRow()
    let chemotherapy = CustomDiseaseCheckRow()
    let systemDisorder = CustomDiseaseCheckRow()
    let takePainkiller = CustomDiseaseCheckRow()
    let takeDrug = CustomDiseaseCheckRow()
    let thalassemia = CustomDiseaseCheckRow()
    
    
    var  ardsValue : Bool!
    var  pneumoniaValue : Bool!
    var  covid19Value : Bool!
    var  sarsCov2Value : Bool!
    var  careUnitValue : Bool!
    var  chronicLungValue : Bool!
    var  diabetesValue : Bool!
    var  hypertensionValue : Bool!
    var  chronicLiverValue : Bool!
    var  chronicKidneyValue : Bool!
    var  chronicHearthValue : Bool!
    var  geneticDisorderValue : Bool!
    var  bloodCancerValue : Bool!
    var  otherCancerValue : Bool!
    var  chemotherapyValue : Bool!
    var  systemDisorderValue : Bool!
    var  takePainkillerValue : Bool!
    var  takeDrugValue : Bool!
    var  thalassemiaValue : Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Presence of Disease"
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.navigationBar.tintColor = UIColor(named: "textFieldPlaceholderColor")
        initCell()
    }
    
    func sendDiseaseInfo(completion: @escaping callback){
        AccountService.sendUserDisease(userId: (UserDefaults.standard.object(forKey: "userId") as? String)!,ardsValue: ardsValue, pneumoniaValue: pneumoniaValue, covid19Value: covid19Value, sarsCov2Value: sarsCov2Value, careUnitValue: careUnitValue, chronicLungValue: chronicLungValue, diabetesValue: diabetesValue, hypertensionValue: hypertensionValue, chronicLiverValue: chronicLiverValue, chronicKidneyValue: chronicKidneyValue, chronicHearthValue: chronicHearthValue, geneticDisorderValue: geneticDisorderValue, bloodCancerValue: bloodCancerValue, otherCancerValue: otherCancerValue, chemotherapyValue: chemotherapyValue, systemDisorderValue: systemDisorderValue, takePainkillerValue: takePainkillerValue, takeDrugValue: takeDrugValue, thalassemiaValue: thalassemiaValue) { (response, message) in
            guard let response = response else {
                completion(false, message)
                return
            }
            if response.message.uppercased() == "SUCCESS" {
                completion(true, nil)
            }
        }
    }
    
    func initCell(){
        
        ards.setTitleText(text: "Presence of Acute Respiratory Distress Syndrome (ARDS)")
        ards.delegate = self
        stckMain.insertArrangedSubview(ards, at: stckMain.arrangedSubviews.count)
        
        pneumonia.setTitleText(text: "Presence of Pneumonia")
        pneumonia.delegate = self
        stckMain.insertArrangedSubview(pneumonia, at: stckMain.arrangedSubviews.count)
        
        covid19.setTitleText(text: "Presence of Covid-19 Disease")
        covid19.delegate = self
        stckMain.insertArrangedSubview(covid19, at: stckMain.arrangedSubviews.count)
        
        sarsCov2.setTitleText(text: "Previously Tested for Active Infection of SARS-Cov-2")
        sarsCov2.delegate = self
        stckMain.insertArrangedSubview(sarsCov2, at: stckMain.arrangedSubviews.count)
        
        careUnit.setTitleText(text: "Presence of Intensive Care Unit")
        careUnit.delegate = self
        stckMain.insertArrangedSubview(careUnit, at: stckMain.arrangedSubviews.count)
        
        chronicLung.setTitleText(text: "Presence of Chronic Lung Disease")
        chronicLung.delegate = self
        stckMain.insertArrangedSubview(chronicLung, at: stckMain.arrangedSubviews.count)
        
        diabetes.setTitleText(text: "Presence of Diabetes Disease")
        diabetes.delegate = self
        stckMain.insertArrangedSubview(diabetes, at: stckMain.arrangedSubviews.count)
        
        hypertension.setTitleText(text: "Presence of Hypertension")
        hypertension.delegate = self
        stckMain.insertArrangedSubview(hypertension, at: stckMain.arrangedSubviews.count)
        
        chronicLiver.setTitleText(text: "Presence of Chronic Liver Disease")
        chronicLiver.delegate = self
        stckMain.insertArrangedSubview(chronicLiver, at: stckMain.arrangedSubviews.count)
        
        chronicKidney.setTitleText(text: "Presence of Chronic Kidney Disease")
        chronicKidney.delegate = self
        stckMain.insertArrangedSubview(chronicKidney, at: stckMain.arrangedSubviews.count)
        
        chronicHearth.setTitleText(text: "Presence of Chronic Hearth Disease")
        chronicHearth.delegate = self
        stckMain.insertArrangedSubview(chronicHearth, at: stckMain.arrangedSubviews.count)
        
        geneticDisorder.setTitleText(text: "Presence of Genetic Disorder")
        geneticDisorder.delegate = self
        stckMain.insertArrangedSubview(geneticDisorder, at: stckMain.arrangedSubviews.count)
        
        bloodCancer.setTitleText(text: "Presence of Blood Cancer (Hematological Cancer)")
        bloodCancer.delegate = self
        stckMain.insertArrangedSubview(bloodCancer, at: stckMain.arrangedSubviews.count)
        
        otherCancer.setTitleText(text: "Presence of Other Cancer Types (Solid Cancer)")
        otherCancer.delegate = self
        stckMain.insertArrangedSubview(otherCancer, at: stckMain.arrangedSubviews.count)
        
        chemotherapy.setTitleText(text: "Taking Chemotherapy")
        chemotherapy.delegate = self
        stckMain.insertArrangedSubview(chemotherapy, at: stckMain.arrangedSubviews.count)
        
        systemDisorder.setTitleText(text: "Presence of Immune System Disorder")
        systemDisorder.delegate = self
        stckMain.insertArrangedSubview(systemDisorder, at: stckMain.arrangedSubviews.count)
        
        takePainkiller.setTitleText(text: "Taking Regular Rheumatic Medications or Painkillers")
        takePainkiller.delegate = self
        stckMain.insertArrangedSubview(takePainkiller, at: stckMain.arrangedSubviews.count)
        
        takeDrug.setTitleText(text: "Taking Immunosuppressive Drugs (Cortisone Treatment)")
        takeDrug.delegate = self
        stckMain.insertArrangedSubview(takeDrug, at: stckMain.arrangedSubviews.count)
        
        thalassemia.setTitleText(text: "Presence of Thalassemia / Carrier")
        thalassemia.delegate = self
        stckMain.insertArrangedSubview(thalassemia, at: stckMain.arrangedSubviews.count)
        
        let emptySpace = self.stackViewSpacing(value: 15)
        self.stckMain.insertArrangedSubview(emptySpace, at: stckMain.arrangedSubviews.count)
        
        let finishButtonRow = CustomSingleNextButton()
        finishButtonRow.delegate = self
        finishButtonRow.btnNext.setTitle("Finish Signup", for: .normal)
        self.stckMain.insertArrangedSubview(finishButtonRow, at: stckMain.arrangedSubviews.count)
        
    }
    
}

extension PresenceOfDiseaseViewController:CustomDiseaseCheckRowDelegate {
    func leftPressed() {
        
        if ards.btnLeft.isTouchInside {
            ards.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            ards.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            ardsValue = true
        }
        
        else if pneumonia.btnLeft.isTouchInside {
            pneumonia.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            pneumonia.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            pneumoniaValue = true
        }
        
        else if covid19.btnLeft.isTouchInside {
            covid19.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            covid19.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            covid19Value = true
        }
        
        else if sarsCov2.btnLeft.isTouchInside {
            sarsCov2.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            sarsCov2.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            sarsCov2Value = true
        }
        
        else if careUnit.btnLeft.isTouchInside {
            careUnit.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            careUnit.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            careUnitValue = true
        }
        
        else if chronicLung.btnLeft.isTouchInside {
            chronicLung.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            chronicLung.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            chronicLungValue = true
        }
        
        else if diabetes.btnLeft.isTouchInside {
            diabetes.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            diabetes.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            diabetesValue = true
        }
        
        else if hypertension.btnLeft.isTouchInside {
            hypertension.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            hypertension.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            hypertensionValue = true
        }
        
        else if chronicLiver.btnLeft.isTouchInside {
            chronicLiver.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            chronicLiver.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            chronicLiverValue = true
        }
        
        else if chronicKidney.btnLeft.isTouchInside {
            chronicKidney.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            chronicKidney.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            chronicKidneyValue = true
        }
        
        else if chronicHearth.btnLeft.isTouchInside {
            chronicHearth.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            chronicHearth.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            chronicHearthValue = true
        }
        
        else if geneticDisorder.btnLeft.isTouchInside {
            geneticDisorder.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            geneticDisorder.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            geneticDisorderValue = true
        }
        
        else if bloodCancer.btnLeft.isTouchInside {
            bloodCancer.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            bloodCancer.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            bloodCancerValue = true
        }
        
        else if otherCancer.btnLeft.isTouchInside {
            otherCancer.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            otherCancer.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            otherCancerValue = true
        }
        
        else if chemotherapy.btnLeft.isTouchInside {
            chemotherapy.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            chemotherapy.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            chemotherapyValue = true
        }
        
        else if systemDisorder.btnLeft.isTouchInside {
            systemDisorder.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            systemDisorder.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            systemDisorderValue = true
        }
        
        else if takePainkiller.btnLeft.isTouchInside {
            takePainkiller.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            takePainkiller.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            takePainkillerValue = true
        }
        
        else if takeDrug.btnLeft.isTouchInside {
            takeDrug.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            takeDrug.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            takeDrugValue = true
        }
        
        else if thalassemia.btnLeft.isTouchInside {
            thalassemia.vwLeftInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            thalassemia.vwRightInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            thalassemiaValue = true
        }
    }
    
    
    
    func rightPressed() {
        
        if ards.btnRight.isTouchInside {
            ards.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            ards.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            ardsValue = false
        }
        else if pneumonia.btnRight.isTouchInside {
            pneumonia.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            pneumonia.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            pneumoniaValue = false
        }
        else if covid19.btnRight.isTouchInside {
            covid19.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            covid19.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            covid19Value = false
        }
        
        else if sarsCov2.btnRight.isTouchInside {
            sarsCov2.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            sarsCov2.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            sarsCov2Value = false
        }
        
        else if careUnit.btnRight.isTouchInside {
            careUnit.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            careUnit.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            careUnitValue = false
        }
        
        else if chronicLung.btnRight.isTouchInside {
            chronicLung.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            chronicLung.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            chronicLungValue = false
        }
        
        else if diabetes.btnRight.isTouchInside {
            diabetes.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            diabetes.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            diabetesValue = false
        }
        
        else if hypertension.btnRight.isTouchInside {
            hypertension.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            hypertension.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            hypertensionValue = false
        }
        
        else if chronicLiver.btnRight.isTouchInside {
            chronicLiver.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            chronicLiver.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            chronicLiverValue = false
        }
        
        else if chronicKidney.btnRight.isTouchInside {
            chronicKidney.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            chronicKidney.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            chronicKidneyValue = false
        }
        
        else if chronicHearth.btnRight.isTouchInside {
            chronicHearth.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            chronicHearth.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            chronicHearthValue = false
        }
        
        else if geneticDisorder.btnRight.isTouchInside {
            geneticDisorder.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            geneticDisorder.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            geneticDisorderValue = false
        }
        
        else if bloodCancer.btnRight.isTouchInside {
            bloodCancer.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            bloodCancer.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            bloodCancerValue = false
        }
        
        else if otherCancer.btnRight.isTouchInside {
            otherCancer.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            otherCancer.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            otherCancerValue = false
        }
        
        else if chemotherapy.btnRight.isTouchInside {
            chemotherapy.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            chemotherapy.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            chemotherapyValue = false
        }
        
        else if systemDisorder.btnRight.isTouchInside {
            systemDisorder.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            systemDisorder.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            systemDisorderValue = false
        }
        
        else if takePainkiller.btnRight.isTouchInside {
            takePainkiller.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            takePainkiller.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            takePainkillerValue = false
        }
        
        else if takeDrug.btnRight.isTouchInside {
            takeDrug.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            takeDrug.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            takeDrugValue = false
        }
        
        else if thalassemia.btnRight.isTouchInside {
            thalassemia.vwRightInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            thalassemia.vwLeftInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            thalassemiaValue = false
        }
    }
}

extension PresenceOfDiseaseViewController:CustomSingleNextButtonDelegate {
    func nextPressed() {
        sendDiseaseInfo { (success, message) in
            if success {
                let chooseDoctorViewController = ChooseDoctorViewController()
                self.navigationController?.pushViewController(chooseDoctorViewController, animated: true)
            }
            else {
                // Add Alert
            }
        }
    }
}
