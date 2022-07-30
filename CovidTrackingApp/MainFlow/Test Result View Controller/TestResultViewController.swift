//
//  TestResultViewController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 4/4/21.
//

import UIKit


struct Suggestion {
    var suggestion:String
}

class TestResultViewController: UIViewController {
    
    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var lblProbablityvalue: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var tblMain: UITableView!
    @IBOutlet weak var btnHome: UIButton!
    
    var probabilityValue:Float!
    
    var suggestionList = [Suggestion]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        tblMain.layer.borderWidth = 2
        setTableView()
        getValue()
    }
    
    func setTableView(){
        tblMain.delegate = self
        tblMain.dataSource = self
        
        tblMain.register(UINib(nibName: SuggestionTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SuggestionTableViewCell.identifier)
    }
    
    func getValue(){
        let probabilityValue = UserDefaults.standard.object(forKey: "testResult") as? Double
        let userFever = UserDefaults.standard.object(forKey: "fever") as! Double
        let cough = UserDefaults.standard.object(forKey: "persistentCough") as! Int
        let nasalStuffiness = UserDefaults.standard.object(forKey: "nasalStuffiness") as! Int
        let runnyNose = UserDefaults.standard.object(forKey: "runnyNose") as! Int
        let soreThroat = UserDefaults.standard.object(forKey: "soreThroat") as! Int
        let headache = UserDefaults.standard.object(forKey: "headache") as! Int
        let lossTasteAndSmell = UserDefaults.standard.object(forKey: "lossTasteAndSmell") as! Int
        let repeatedShaking = UserDefaults.standard.object(forKey: "repeatedShaking") as! Int
        let weakness = UserDefaults.standard.object(forKey: "weakness") as! Int
        let bodyAches = UserDefaults.standard.object(forKey: "bodyAches") as! Int
        let musclePain = UserDefaults.standard.object(forKey: "musclePain") as! Int
        let chestPain = UserDefaults.standard.object(forKey: "chestPain") as! Int
        let bluishFace = UserDefaults.standard.object(forKey: "bluishFace") as! Int
        let diarrhea = UserDefaults.standard.object(forKey: "diarrhea") as! Int
        let nausea = UserDefaults.standard.object(forKey: "nausea") as! Int
        
        let y = Double(round(1000*probabilityValue!)/1000)
        let testDate = UserDefaults.standard.object(forKey: "testDate") as? String
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSZ"
        if let date = formatter.date(from: testDate!) {
            setLastTestDate(testDate: date)
        }
        else {
            print("error")
        }
        
        
        if userFever >= 36 && userFever <= 37.8 {
            if cough != 0  && nasalStuffiness != 0 && runnyNose != 0 && soreThroat != 0 && headache != 0 && lossTasteAndSmell != 0{   //That means he has low or moderate cough
                var data = Suggestion(suggestion: "Continue online tests.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "You need rest.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "Stay home and self-isolate even with minor symptoms such as cough, headache, mild fever, until you recover.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "You need to drink plenty of fluids.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "Consult your doctor to get an over the-counter pain reliever that's best for you.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "Try to keep your temperature at normal levels such as by applying a cold towel, taking a warm shower.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "Have someone bring you supplies.")
                suggestionList.append(data)
                
                self.tblMain.reloadData()
                
                imgMain.image = UIImage(named: "magnifying-glass")
                
            }
            
            else if userFever > 38.3 && userFever < 38.9 {
                if repeatedShaking != 0 && cough != 0 && weakness != 0 && bodyAches != 0 && musclePain != 0 {
                    
                    var data = Suggestion(suggestion: "Continue online tests.")
                    suggestionList.append(data)
                    
                    data = Suggestion(suggestion: "You need rest.")
                    suggestionList.append(data)
                    
                    data = Suggestion(suggestion: "You need to drink plenty of fluids")
                    suggestionList.append(data)
                    
                    data = Suggestion(suggestion: "Consult your doctor to get an over the-counter pain reliever that's best for you.")
                    suggestionList.append(data)
                    
                    data = Suggestion(suggestion: "Try to keep your temperature at normal levels such as by applying a cold towel, taking a warm shower.")
                    suggestionList.append(data)
                    
                    data = Suggestion(suggestion: "Have someone bring you supplies.")
                    suggestionList.append(data)
                    
                    data = Suggestion(suggestion: "Stay home and self-isolate even with mild or moderate symptoms such as cough, headache, mild fever, chills with repeated shaking, deep cough, fatigue, body aches,  muscle pain, general feeling of being unwell, until you recover.")
                    suggestionList.append(data)
                }
            }
            
            else if userFever > 39 {
                if cough != 0 && weakness != 0 && bodyAches != 0 &&  chestPain != 0 && bluishFace != 0 {
                    if diarrhea != 0 || nausea != 0 {
                        
                        var data = Suggestion(suggestion: "You need rest in isolation in the hospital environment.")
                        suggestionList.append(data)
                        
                        data = Suggestion(suggestion: "You need to seek medical attention /hospitalization but call by telephone in advance if possible and follow the directions of your local health authority.")
                        suggestionList.append(data)
                        
                        data = Suggestion(suggestion: "You may need to get serum/fluid through IV.")
                        suggestionList.append(data)
                        
                        data = Suggestion(suggestion: "You may need to get support to breathe, so oxygen support in hospital.")
                        suggestionList.append(data)
                    }
                }
            }
            
            else if probabilityValue! > 85 {
                
                var data = Suggestion(suggestion: " You need to seek medical attention / hospitalization but call by telephone in advance if possible and follow the directions of your local health authority.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "You need to use personal protective equipment.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "You are at higher risk of Covid-19 according to your Online Covid-19 test result, please do not be panic!")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "Please observe your health conditions and symptoms closely.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "Consult your doctor for a physical examination as soon as possible.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "Have Real-Time PCR (RT-qPCR) test for SARS-CoV-2.")
                suggestionList.append(data)
                
                imgMain.image = UIImage(named: "virus")
            }
            
            else if probabilityValue! > 50 && probabilityValue! < 85 {
                
                var data = Suggestion(suggestion: "Continue online tests.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "You need to wash hands with soap and water often and for at least 20 seconds.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "You need to practice good respiratory hygiene and avoid touching the eyes, nose or mouth with unwashed hands.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "You need rest.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "You need to drink plenty of fluids.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "Consult your doctor to get an over-the-counter pain reliever that's best for you.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "Try to keep your temperature at normal levels such as by applying a cold towel, taking a warm shower.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "Have someone bring you supplies.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "Stay home and self-isolate even with mild or moderate symptoms such as cough, headache, mild fever, chills with repeated shaking, deep cough, fatigue, body aches, muscle pain, general feeling of being unwell, until you recover.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "Please observe your health conditions and symptoms closely.")
                suggestionList.append(data)
                
                data = Suggestion(suggestion: "You have a medium-to-risk of Covid- 19 according to your Online Covid-19 test result, contact your doctor, please do not be panic!")
                suggestionList.append(data)
            }
        }
        
        
        UserDefaults.standard.removeObject(forKey: "testResult")
        UserDefaults.standard.removeObject(forKey: "fever")
        UserDefaults.standard.removeObject(forKey: "persistentCough")
        UserDefaults.standard.removeObject(forKey: "nasalStuffiness")
        UserDefaults.standard.removeObject(forKey: "runnyNose")
        UserDefaults.standard.removeObject(forKey: "soreThroat")
        UserDefaults.standard.removeObject(forKey: "headache")
        UserDefaults.standard.removeObject(forKey: "lossTasteAndSmell")
        UserDefaults.standard.removeObject(forKey: "repeatedShaking")
        UserDefaults.standard.removeObject(forKey: "weakness")
        UserDefaults.standard.removeObject(forKey: "bodyAches")
        UserDefaults.standard.removeObject(forKey: "musclePain")
        UserDefaults.standard.removeObject(forKey: "chestPain")
        UserDefaults.standard.removeObject(forKey: "bluishFace")
        UserDefaults.standard.removeObject(forKey: "diarrhea")
        UserDefaults.standard.removeObject(forKey: "nausea")
        
        lblProbablityvalue.text = "Probablity Value: %\(y)"
    }
    
    func setLastTestDate(testDate:Date){
        let dateFormatter = DateFormatter()
        // short format like "12/9/14, 9:50 AM"
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        // will default to user's time zone & locale
        let displayString = dateFormatter.string(from: testDate)
        lblDate.text = "Test Date: \(displayString)"
    }
    
    @IBAction func homePressed(_ sender: Any) {
        let mainScreenViewController = MainScreenViewController()
        self.navigationController?.pushViewController(mainScreenViewController, animated: false)
    }
    
    @IBAction func sendResultPressed(_ sender: Any) {
        let sendResultsViewController = SendResultsDoctorViewController()
        sendResultsViewController.modalPresentationStyle = .automatic
        self.present(sendResultsViewController, animated: true, completion: nil)
    }
    
    @IBAction func testHistoryPressed(_ sender: Any) {
        let testHistoryViewController = TestHistoryViewController()
        self.navigationController?.pushViewController(testHistoryViewController, animated: true)
    }
    
    
}


extension TestResultViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SuggestionTableViewCell.identifier, for: indexPath) as! SuggestionTableViewCell
        cell.configureCell(data: suggestionList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
