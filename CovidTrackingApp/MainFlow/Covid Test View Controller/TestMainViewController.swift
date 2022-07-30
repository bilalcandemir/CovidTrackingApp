//
//  TestMainViewController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 3/14/21.
//

import UIKit

class TestMainViewController: UIViewController {
    
    @IBOutlet weak var btnSymptoms: UIButton!
    @IBOutlet weak var btnChooseFever: UIButton!
    @IBOutlet weak var btnVideoRecord: UIButton!
    @IBOutlet weak var btnRecordVoice: UIButton!
    @IBOutlet weak var btnTakePhoto: UIButton!
    
    @IBOutlet weak var vwMain: UIView!
    
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var lblSymptom: UILabel!
    @IBOutlet weak var lblSevere: UILabel!
    @IBOutlet weak var lblModerate: UILabel!
    @IBOutlet weak var lblLow: UILabel!
    
    @IBOutlet weak var vwRecordVideo: UIView!
    @IBOutlet weak var vwSymptoms: UIView!
    @IBOutlet weak var vwCheckFever: UIView!
    @IBOutlet weak var vwRecordVoice: UIView!
    @IBOutlet weak var vwTakePhoto: UIView!
    
    
    var viewControllerCount = 0
    
    let vc = SymptomsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        openSymptomsView()
        
        self.title = "Symptoms"
        buttonSet()
    }
    
    func loadData(){
        CovidTestService.CovidTest(userId: 766507, doctorId: 3, abdominalPain: UserDefaults.standard.object(forKey: "abdominalPain") as! Int, anorexia: UserDefaults.standard.object(forKey: "anorexia") as! Int, bluishFace: UserDefaults.standard.object(forKey: "bluishFace") as! Int, bodyAches: UserDefaults.standard.object(forKey: "bodyAches") as! Int, chestPain: UserDefaults.standard.object(forKey: "chestPain") as! Int, repeatedShaking: UserDefaults.standard.object(forKey: "repeatedShaking") as! Int, confusion: UserDefaults.standard.object(forKey: "confusion") as! Int, delirium: UserDefaults.standard.object(forKey: "delirium") as! Int, diarrhea: UserDefaults.standard.object(forKey: "diarrhea") as! Int, dizziness: UserDefaults.standard.object(forKey: "dizziness") as! Int, weakness: UserDefaults.standard.object(forKey: "weakness") as! Int, fever: UserDefaults.standard.object(forKey: "fever") as! Double, feeling: UserDefaults.standard.object(forKey: "feeling") as! Int, headache: UserDefaults.standard.object(forKey: "headache") as! Int, hoarseVoice: UserDefaults.standard.object(forKey: "hoarseVoice") as! Int, lossTasteAndSmell: UserDefaults.standard.object(forKey: "lossTasteAndSmell") as! Int, musclePain: UserDefaults.standard.object(forKey: "musclePain") as! Int, runnyNose: UserDefaults.standard.object(forKey: "runnyNose") as! Int, nasalStuffiness: UserDefaults.standard.object(forKey: "nasalStuffiness") as! Int, nausea: UserDefaults.standard.object(forKey: "nausea") as! Int, ocularReaction: UserDefaults.standard.object(forKey: "ocularReaction") as! Int, persistentCough: UserDefaults.standard.object(forKey: "persistentCough") as! Int, rhinorrhea: UserDefaults.standard.object(forKey: "rhinorrhea") as! Int, shortnessBreath: UserDefaults.standard.object(forKey: "shortnessBreath") as! Int, skinRush: UserDefaults.standard.object(forKey: "skinRush") as! Int, skippedMeals: UserDefaults.standard.object(forKey: "skippedMeals") as! Int, sneeze: UserDefaults.standard.object(forKey: "sneeze") as! Int, soreThroat: UserDefaults.standard.object(forKey: "soreThroat") as! Int, sputum: UserDefaults.standard.object(forKey: "sputum") as! Int, vomiting: UserDefaults.standard.object(forKey: "vomiting") as! Int) { (response, msg) in
            
            guard let response = response else {
                return
            }
            
            ///After Test We need remove this objects
            
            UserDefaults.standard.setValue(response.result, forKey: "testResult")
            UserDefaults.standard.setValue(response.suggestionId, forKey: "suggestionId")
            UserDefaults.standard.setValue(response.testDate, forKey: "testDate")
        }
    }
    
    
    func buttonSet(){
        
        vwMain.layer.borderWidth = 0.5
        vwMain.layer.borderColor = UIColor(named: "checkBoxBorder")?.cgColor
        
        vwRecordVideo.layer.cornerRadius = 10
        vwRecordVideo.backgroundColor = UIColor(named: "whiteColor")
        
        vwSymptoms.layer.cornerRadius = 10
        vwSymptoms.backgroundColor = UIColor(named: "colorTitleDarkBlue")
        
        vwCheckFever.layer.cornerRadius = 10
        vwCheckFever.backgroundColor = UIColor(named: "whiteColor")
        
        vwRecordVoice.layer.cornerRadius = 10
        vwRecordVoice.backgroundColor = UIColor(named: "whiteColor")
        
        vwTakePhoto.layer.cornerRadius = 10
        vwTakePhoto.backgroundColor = UIColor(named: "whiteColor")
    }
    
    func openSymptomsView(){
        open(viewController: SymptomsViewController())
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        if viewControllerCount == 0 {
            
            self.title = "Check Fever"
            
            lblSymptom.isHidden = true
            lblSevere.isHidden = true
            lblModerate.isHidden = true
            lblLow.isHidden = true
            
            vwSymptoms.backgroundColor = UIColor(named: "whiteColor")
            vwCheckFever.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            vwRecordVideo.backgroundColor = UIColor(named: "whiteColor")
            vwRecordVoice.backgroundColor = UIColor(named: "whiteColor")
            vwTakePhoto.backgroundColor = UIColor(named: "whiteColor")
            
            viewControllerCount = 1
            btnNext.setTitle("Next", for: .normal)
            
            open(viewController: CheckFeverViewController())
        }
        else if viewControllerCount == 1 {
            
            self.title = "Record Video"
            
            vwSymptoms.backgroundColor = UIColor(named: "whiteColor")
            vwCheckFever.backgroundColor = UIColor(named: "whiteColor")
            vwRecordVideo.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            vwRecordVoice.backgroundColor = UIColor(named: "whiteColor")
            vwTakePhoto.backgroundColor = UIColor(named: "whiteColor")
            
            loadData()
            
            btnNext.setTitle("Next", for: .normal)
            open(viewController: RecordVideoViewController())
            viewControllerCount = 2
        }
        
        else if viewControllerCount == 2 {
            
            self.title = "Record Voice"
            
            vwSymptoms.backgroundColor = UIColor(named: "whiteColor")
            vwCheckFever.backgroundColor = UIColor(named: "whiteColor")
            vwRecordVideo.backgroundColor = UIColor(named: "whiteColor")
            vwRecordVoice.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            vwTakePhoto.backgroundColor = UIColor(named: "whiteColor")
            
            btnNext.setTitle("Next", for: .normal)
            open(viewController: RecordVoiceViewController())
            viewControllerCount = 3
        }
        
        else if viewControllerCount == 3 {
            
            self.title = "Take Picture"
            
            vwSymptoms.backgroundColor = UIColor(named: "whiteColor")
            vwCheckFever.backgroundColor = UIColor(named: "whiteColor")
            vwRecordVideo.backgroundColor = UIColor(named: "whiteColor")
            vwRecordVoice.backgroundColor = UIColor(named: "whiteColor")
            vwTakePhoto.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            
            btnNext.setTitle("Finish Test", for: .normal)
            
            open(viewController: TakePhotoViewController())
            viewControllerCount = 4
        }
        
        else if viewControllerCount == 4 {
            
            finishTestPressed()
        }
    }
    
    func finishTestPressed(){
        let testResultViewController = TestResultViewController()
        self.navigationController?.pushViewController(testResultViewController, animated: true)
    }
    
    func open(viewController: UIViewController){
        let hasOtherViewController = self.vwMain.subviews.count != 0
        self.view.layoutIfNeeded()
        
        viewController.view.frame = self.vwMain.bounds
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        vwMain.translatesAutoresizingMaskIntoConstraints = false
        if hasOtherViewController{
            if let otherViewController = self.vwMain.subviews.first{
                UIView.animate(withDuration: 0.3) {
                    otherViewController.alpha = 0.0
                }
            }
            viewController.view.alpha = 0.0
        }else{
            viewController.view.alpha = 1.0
        }
        viewController.willMove(toParent: self)
        vwMain.addSubview(viewController.view)
        
        let leadingAnchor = viewController.view.leadingAnchor.constraint(equalTo: vwMain.leadingAnchor, constant: 0)
        let trailingAnchor = viewController.view.trailingAnchor.constraint(equalTo: vwMain.trailingAnchor, constant: 0)
        let topAnchor = viewController.view.topAnchor.constraint(equalTo: vwMain.topAnchor, constant: 0)
        let bottomAnchor = viewController.view.bottomAnchor.constraint(equalTo: vwMain.bottomAnchor, constant: 0)
        NSLayoutConstraint.activate([leadingAnchor,trailingAnchor,topAnchor,bottomAnchor])
        viewController.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        self.addChild(viewController)
        viewController.didMove(toParent: self)
        
        if self.vwMain.subviews.count == 0{
            
        }else{
            UIView.animate(withDuration: 0.5, animations: {
                viewController.view.alpha = 1.0
                
            }, completion: { (isFinished) in
                self.vwMain.subviews.filter { (view) -> Bool in
                    return view != viewController.view
                }.forEach { (view) in
                    view.removeFromSuperview()
                }
            })
        }
    }
    
    
    
    @IBAction func symptomsPressed(_ sender: Any) {
        viewControllerCount = 0
        self.title = "Symptoms"
        lblSymptom.isHidden = false
        lblSevere.isHidden = false
        lblModerate.isHidden = false
        lblLow.isHidden = false
        
        vwSymptoms.backgroundColor = UIColor(named: "colorTitleDarkBlue")
        vwCheckFever.backgroundColor = UIColor(named: "whiteColor")
        vwRecordVideo.backgroundColor = UIColor(named: "whiteColor")
        vwRecordVoice.backgroundColor = UIColor(named: "whiteColor")
        vwTakePhoto.backgroundColor = UIColor(named: "whiteColor")
        
        btnNext.setTitle("Next", for: .normal)
        
        open(viewController: SymptomsViewController())
    }
    
    @IBAction func feverPressed(_ sender: Any) {
        viewControllerCount = 1
        self.title = "Check Fever"
        lblSymptom.isHidden = true
        lblSevere.isHidden = true
        lblModerate.isHidden = true
        lblLow.isHidden = true
        
        vwSymptoms.backgroundColor = UIColor(named: "whiteColor")
        vwCheckFever.backgroundColor = UIColor(named: "colorTitleDarkBlue")
        vwRecordVideo.backgroundColor = UIColor(named: "whiteColor")
        vwRecordVoice.backgroundColor = UIColor(named: "whiteColor")
        vwTakePhoto.backgroundColor = UIColor(named: "whiteColor")
        
        btnNext.setTitle("Next", for: .normal)
        
        open(viewController: CheckFeverViewController())
    }
    
    @IBAction func videoRecordPressed(_ sender: Any) {
        viewControllerCount = 2
        self.title = "Record Video"
        lblSymptom.isHidden = true
        lblSevere.isHidden = true
        lblModerate.isHidden = true
        lblLow.isHidden = true
        
        vwSymptoms.backgroundColor = UIColor(named: "whiteColor")
        vwCheckFever.backgroundColor = UIColor(named: "whiteColor")
        vwRecordVideo.backgroundColor = UIColor(named: "colorTitleDarkBlue")
        vwRecordVoice.backgroundColor = UIColor(named: "whiteColor")
        vwTakePhoto.backgroundColor = UIColor(named: "whiteColor")
        
        btnNext.setTitle("Next", for: .normal)
        
        open(viewController: RecordVideoViewController())
    }
    
    @IBAction func recordVoicePressed(_ sender: Any) {
        viewControllerCount = 3
        self.title = "Record Voice"
        lblSymptom.isHidden = true
        lblSevere.isHidden = true
        lblModerate.isHidden = true
        lblLow.isHidden = true
        
        vwSymptoms.backgroundColor = UIColor(named: "whiteColor")
        vwCheckFever.backgroundColor = UIColor(named: "whiteColor")
        vwRecordVideo.backgroundColor = UIColor(named: "whiteColor")
        vwRecordVoice.backgroundColor = UIColor(named: "colorTitleDarkBlue")
        vwTakePhoto.backgroundColor = UIColor(named: "whiteColor")
        
        btnNext.setTitle("Next", for: .normal)
        
        open(viewController: RecordVoiceViewController())
    }
    
    @IBAction func takePicturePressed(_ sender: Any) {
        viewControllerCount = 4
        self.title = "Take Picture"
        lblSymptom.isHidden = true
        lblSevere.isHidden = true
        lblModerate.isHidden = true
        lblLow.isHidden = true
        
        vwSymptoms.backgroundColor = UIColor(named: "whiteColor")
        vwCheckFever.backgroundColor = UIColor(named: "whiteColor")
        vwRecordVideo.backgroundColor = UIColor(named: "whiteColor")
        vwRecordVoice.backgroundColor = UIColor(named: "whiteColor")
        vwTakePhoto.backgroundColor = UIColor(named: "colorTitleDarkBlue")
        
        btnNext.setTitle("Finish Test", for: .normal)
        
        open(viewController: TakePhotoViewController())
    }
}
