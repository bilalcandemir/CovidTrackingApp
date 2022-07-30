//
//  SymptomsViewController.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 3/15/21.
//

import UIKit

struct symptoms {
    var abdominalPain:Int
    var anorexia:Int
    var bluishFace:Int
    var bodyAches:Int
    var chestPain:Int
    var repeatedShaking:Int
    var confusion:Int
    var delirium:Int
    var diarrhea:Int
    var dizziness:Int
    var weakness: Int
    var fever: Double
    var feeling: Int
    var headache: Int
    var hoarseVoice: Int
    var lossTasteAndSmell: Int
    var musclePain: Int
    var runnyNose: Int
    var nasalStuffiness: Int
    var nausea: Int
    var ocularReaction: Int
    var persistentCough: Int
    var rhinorrhea: Int
    var shortnessBreath: Int
    var skinRush: Int
    var skippedMeals: Int
    var sneeze: Int
    var soreThroat: Int
    var sputum: Int
    var vomiting:  Int
}

var symptomsList = [symptoms]()

class SymptomsViewController: UIViewController {
    
    @IBOutlet weak var stckMain: UIStackView!
    
    let abdominalPain = CustomSymptomRow()
    let anorexia = CustomSymptomRow()
    let bluishFace = CustomSymptomRow()
    let bodyAches = CustomSymptomRow()
    let chestPain = CustomSymptomRow()
    let repeatedShaking = CustomSymptomRow()
    let confusion = CustomSymptomRow()
    let delirium = CustomSymptomRow()
    let diarrhea = CustomSymptomRow()
    let dizziness = CustomSymptomRow()
    let weakness = CustomSymptomRow()
    let feeling = CustomSymptomRow()
    let headache = CustomSymptomRow()
    let hoarseVoice = CustomSymptomRow()
    let lossTasteAndSmell = CustomSymptomRow()
    let musclePain = CustomSymptomRow()
    let runnyNose = CustomSymptomRow()
    let nasalStuffiness = CustomSymptomRow()
    let nausea = CustomSymptomRow()
    let ocularReaction = CustomSymptomRow()
    let persistentCough = CustomSymptomRow()
    let rhinorrhea = CustomSymptomRow()
    let shortnessBreath = CustomSymptomRow()
    let skinRush = CustomSymptomRow()
    let skippedMeals = CustomSymptomRow()
    let sneeze = CustomSymptomRow()
    let soreThroat = CustomSymptomRow()
    let sputum = CustomSymptomRow()
    let vomiting = CustomSymptomRow()
    
    var abdominalPainValue:Int!
    var anorexiaValue:Int!
    var bluishFaceValue:Int!
    var bodyAchesValue:Int!
    var chestPainValue:Int!
    var repeatedShakingValue:Int!
    var confusionValue:Int!
    var deliriumValue:Int!
    var diarrheaValue:Int!
    var dizzinessValue:Int!
    var weaknessValue: Int!
    var feverValue: Double!
    var feelingValue: Int!
    var headacheValue: Int!
    var hoarseVoiceValue: Int!
    var lossTasteAndSmellValue: Int!
    var musclePainValue: Int!
    var runnyNoseValue: Int!
    var nasalStuffinessValue: Int!
    var nauseaValue: Int!
    var ocularReactionValue: Int!
    var persistentCoughValue: Int!
    var rhinorrheaValue: Int!
    var shortnessBreathValue: Int!
    var skinRushValue: Int!
    var skippedMealsValue: Int!
    var sneezeValue: Int!
    var soreThroatValue: Int!
    var sputumValue: Int!
    var vomitingValue:  Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCell()
    }
    
    func addCell(){
        abdominalPain.delegate = self
        abdominalPain.configureCell(symptomName: "Abdominal Pain")
        stckMain.insertArrangedSubview(abdominalPain, at: stckMain.arrangedSubviews.count)
        
        anorexia.delegate = self
        anorexia.configureCell(symptomName: "Anorexia")
        stckMain.insertArrangedSubview(anorexia, at: stckMain.arrangedSubviews.count)
        
        bluishFace.delegate = self
        bluishFace.configureCell(symptomName: "Bluish Face and Lips")
        stckMain.insertArrangedSubview(bluishFace, at: stckMain.arrangedSubviews.count)
        
        bodyAches.delegate = self
        bodyAches.configureCell(symptomName: "Body Aches")
        stckMain.insertArrangedSubview(bodyAches, at: stckMain.arrangedSubviews.count)
        
        chestPain.delegate = self
        chestPain.configureCell(symptomName: "Chest Pain/Chest Tightness")
        stckMain.insertArrangedSubview(chestPain, at: stckMain.arrangedSubviews.count)
        
        repeatedShaking.delegate = self
        repeatedShaking.configureCell(symptomName: "Chills with Repeated Shaking")
        stckMain.insertArrangedSubview(repeatedShaking, at: stckMain.arrangedSubviews.count)
        
        confusion.delegate = self
        confusion.configureCell(symptomName: "Confusion / Unresponsiveness")
        stckMain.insertArrangedSubview(confusion, at: stckMain.arrangedSubviews.count)
        
        delirium.delegate = self
        delirium.configureCell(symptomName: "Delirium")
        stckMain.insertArrangedSubview(delirium, at: stckMain.arrangedSubviews.count)
        
        diarrhea.delegate = self
        diarrhea.configureCell(symptomName: "Diarrhea")
        stckMain.insertArrangedSubview(diarrhea, at: stckMain.arrangedSubviews.count)
        
        dizziness.delegate = self
        dizziness.configureCell(symptomName: "Dizziness")
        stckMain.insertArrangedSubview(dizziness, at: stckMain.arrangedSubviews.count)
        
        weakness.delegate = self
        weakness.configureCell(symptomName: "Fatigue or Weakness")
        stckMain.insertArrangedSubview(weakness, at: stckMain.arrangedSubviews.count)
        
        
        feeling.delegate = self
        feeling.configureCell(symptomName: "General Feeling of Being Unwell")
        stckMain.insertArrangedSubview(feeling, at: stckMain.arrangedSubviews.count)
        
        headache.delegate = self
        headache.configureCell(symptomName: "Headache")
        stckMain.insertArrangedSubview(headache, at: stckMain.arrangedSubviews.count)
        
        hoarseVoice.delegate = self
        hoarseVoice.configureCell(symptomName: "Hoarse Voice (Hoarseness)")
        stckMain.insertArrangedSubview(hoarseVoice, at: stckMain.arrangedSubviews.count)
        
        lossTasteAndSmell.delegate = self
        lossTasteAndSmell.configureCell(symptomName: "Loss of Taste and Smell (Anosmia)")
        stckMain.insertArrangedSubview(lossTasteAndSmell, at: stckMain.arrangedSubviews.count)
        
        musclePain.delegate = self
        musclePain.configureCell(symptomName: "Muscle Pain")
        stckMain.insertArrangedSubview(musclePain, at: stckMain.arrangedSubviews.count)
        
        runnyNose.delegate = self
        runnyNose.configureCell(symptomName: "Nasal Discharge / Runny Nose")
        stckMain.insertArrangedSubview(runnyNose, at: stckMain.arrangedSubviews.count)
        
        nasalStuffiness.delegate = self
        nasalStuffiness.configureCell(symptomName: "Nasal Stuffiness")
        stckMain.insertArrangedSubview(nasalStuffiness, at: stckMain.arrangedSubviews.count)
        
        nausea.delegate = self
        nausea.configureCell(symptomName: "Nausea")
        stckMain.insertArrangedSubview(nausea, at: stckMain.arrangedSubviews.count)
        
        ocularReaction.delegate = self
        ocularReaction.configureCell(symptomName: "Ocular Reaction (Eye Inflammation & Red Eye)")
        stckMain.insertArrangedSubview(ocularReaction, at: stckMain.arrangedSubviews.count)
        
        persistentCough.delegate = self
        persistentCough.configureCell(symptomName: "Persistent Cough")
        stckMain.insertArrangedSubview(persistentCough, at: stckMain.arrangedSubviews.count)
        
        rhinorrhea.delegate = self
        rhinorrhea.configureCell(symptomName: "Rhinorrhea (Cerebrospinal Fluid from the Nose)")
        stckMain.insertArrangedSubview(rhinorrhea, at: stckMain.arrangedSubviews.count)
        
        shortnessBreath.delegate = self
        shortnessBreath.configureCell(symptomName: "Shortness of Breath / Dyspnea / Dyspnoea")
        stckMain.insertArrangedSubview(shortnessBreath, at: stckMain.arrangedSubviews.count)
        
        skinRush.delegate = self
        skinRush.configureCell(symptomName: "Skin Rash")
        stckMain.insertArrangedSubview(skinRush, at: stckMain.arrangedSubviews.count)
        
        skippedMeals.delegate = self
        skippedMeals.configureCell(symptomName: "Skipped Meals / Loss of Appetite (Inappetence)")
        stckMain.insertArrangedSubview(skippedMeals, at: stckMain.arrangedSubviews.count)
        
        sneeze.delegate = self
        sneeze.configureCell(symptomName: "Sneeze")
        stckMain.insertArrangedSubview(sneeze, at: stckMain.arrangedSubviews.count)
        
        soreThroat.delegate = self
        soreThroat.configureCell(symptomName: "Sore Throat")
        stckMain.insertArrangedSubview(soreThroat, at: stckMain.arrangedSubviews.count)
        
        sputum.delegate = self
        sputum.configureCell(symptomName: "Sputum")
        stckMain.insertArrangedSubview(sputum, at: stckMain.arrangedSubviews.count)
        
        vomiting.delegate = self
        vomiting.configureCell(symptomName: "Vomiting")
        stckMain.insertArrangedSubview(vomiting, at: stckMain.arrangedSubviews.count)
        
        
        
    }
    
}

extension SymptomsViewController:CustomSymptomRowDelegate {
    func severePressed() {
        if abdominalPain.btnSevere.isTouchInside {
            abdominalPain.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            abdominalPain.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            abdominalPain.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "abdominalPain")
        }
        
        else if anorexia.btnSevere.isTouchInside {
            anorexia.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            anorexia.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            anorexia.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "anorexia")
        }
        
        else if bluishFace.btnSevere.isTouchInside {
            bluishFace.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            bluishFace.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            bluishFace.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "bluishFace")
        }
        
        else if bodyAches.btnSevere.isTouchInside {
            bodyAches.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            bodyAches.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            bodyAches.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "bodyAches")
        }
        
        else if chestPain.btnSevere.isTouchInside {
            chestPain.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            chestPain.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            chestPain.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "chestPain")
        }
        
        else if repeatedShaking.btnSevere.isTouchInside {
            repeatedShaking.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            repeatedShaking.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            repeatedShaking.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "repeatedShaking")
        }
        
        else if confusion.btnSevere.isTouchInside {
            confusion.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            confusion.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            confusion.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "confusion")
        }
        
        else if delirium.btnSevere.isTouchInside {
            delirium.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            delirium.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            delirium.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "delirium")
        }
        
        else if diarrhea.btnSevere.isTouchInside {
            diarrhea.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            diarrhea.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            diarrhea.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "diarrhea")
        }
        
        else if dizziness.btnSevere.isTouchInside {
            dizziness.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            dizziness.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            dizziness.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "dizziness")
        }
        
        else if weakness.btnSevere.isTouchInside {
            weakness.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            weakness.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            weakness.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "weakness")
        }
        
        
        else if feeling.btnSevere.isTouchInside {
            feeling.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            feeling.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            feeling.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "feeling")
        }
        
        else if headache.btnSevere.isTouchInside {
            headache.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            headache.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            headache.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "headache")
        }
        
        else if hoarseVoice.btnSevere.isTouchInside {
            hoarseVoice.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            hoarseVoice.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            hoarseVoice.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "hoarseVoice")
        }
        
        else if lossTasteAndSmell.btnSevere.isTouchInside {
            lossTasteAndSmell.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            lossTasteAndSmell.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            lossTasteAndSmell.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "lossTasteAndSmell")
        }
        
        else if musclePain.btnSevere.isTouchInside {
            musclePain.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            musclePain.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            musclePain.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "musclePain")
        }
        
        else if runnyNose.btnSevere.isTouchInside {
            runnyNose.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            runnyNose.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            runnyNose.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "runnyNose")
        }
        
        else if nasalStuffiness.btnSevere.isTouchInside {
            nasalStuffiness.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            nasalStuffiness.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            nasalStuffiness.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "nasalStuffiness")
        }
        
        else if nausea.btnSevere.isTouchInside {
            nausea.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            nausea.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            nausea.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "nausea")
        }
        
        else if ocularReaction.btnSevere.isTouchInside {
            ocularReaction.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            ocularReaction.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            ocularReaction.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "ocularReaction")
        }
        
        else if persistentCough.btnSevere.isTouchInside {
            persistentCough.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            persistentCough.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            persistentCough.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "persistentCough")
        }
        
        else if rhinorrhea.btnSevere.isTouchInside {
            rhinorrhea.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            rhinorrhea.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            rhinorrhea.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "rhinorrhea")
        }
        
        else if shortnessBreath.btnSevere.isTouchInside {
            shortnessBreath.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            shortnessBreath.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            shortnessBreath.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "shortnessBreath")
        }
        
        else if skinRush.btnSevere.isTouchInside {
            skinRush.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            skinRush.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            skinRush.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "skinRush")
        }
        
        else if skippedMeals.btnSevere.isTouchInside {
            skippedMeals.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            skippedMeals.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            skippedMeals.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "skippedMeals")
        }
        
        else if sneeze.btnSevere.isTouchInside {
            sneeze.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            sneeze.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            sneeze.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "sneeze")
        }
        
        else if soreThroat.btnSevere.isTouchInside {
            soreThroat.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            soreThroat.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            soreThroat.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "soreThroat")
        }
        
        else if sputum.btnSevere.isTouchInside {
            sputum.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            sputum.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            sputum.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "sputum")
        }
        
        else if vomiting.btnSevere.isTouchInside {
            vomiting.vwSevereInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            vomiting.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            vomiting.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(3, forKey: "vomiting")
        }
    }
    
    func moderatePressed() {
        if abdominalPain.btnModerate.isTouchInside {
            abdominalPain.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            abdominalPain.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            abdominalPain.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            UserDefaults.standard.set(2, forKey: "abdominalPain")
        }
        
        else if anorexia.btnModerate.isTouchInside {
            anorexia.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            anorexia.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            anorexia.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "anorexia")
        }
        
        else if bluishFace.btnModerate.isTouchInside {
            bluishFace.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            bluishFace.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            bluishFace.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            UserDefaults.standard.set(2, forKey: "bluishFace")
        }
        
        else if bodyAches.btnModerate.isTouchInside {
            bodyAches.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            bodyAches.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            bodyAches.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "bodyAches")
        }
        
        else if chestPain.btnModerate.isTouchInside {
            chestPain.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            chestPain.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            chestPain.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "chestPain")
        }
        
        else if repeatedShaking.btnModerate.isTouchInside {
            repeatedShaking.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            repeatedShaking.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            repeatedShaking.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "repeatedShaking")
        }
        
        else if confusion.btnModerate.isTouchInside {
            confusion.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            confusion.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            confusion.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "confusion")
        }
        
        else if delirium.btnModerate.isTouchInside {
            delirium.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            delirium.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            delirium.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "delirium")
        }
        
        else if diarrhea.btnModerate.isTouchInside {
            diarrhea.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            diarrhea.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            diarrhea.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "diarrhea")
        }
        
        else if dizziness.btnModerate.isTouchInside {
            dizziness.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            dizziness.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            dizziness.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "dizziness")
        }
        
        else if weakness.btnModerate.isTouchInside {
            weakness.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            weakness.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            weakness.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "weakness")
        }
        
        
        
        else if feeling.btnModerate.isTouchInside {
            feeling.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            feeling.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            feeling.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "feeling")
        }
        
        else if headache.btnModerate.isTouchInside {
            headache.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            headache.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            headache.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "headache")
        }
        
        else if hoarseVoice.btnModerate.isTouchInside {
            hoarseVoice.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            hoarseVoice.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            hoarseVoice.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "hoarseVoice")
        }
        
        else if lossTasteAndSmell.btnModerate.isTouchInside {
            lossTasteAndSmell.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            lossTasteAndSmell.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            lossTasteAndSmell.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "lossTasteAndSmell")
        }
        
        else if musclePain.btnModerate.isTouchInside {
            musclePain.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            musclePain.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            musclePain.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "musclePain")
        }
        
        else if runnyNose.btnModerate.isTouchInside {
            runnyNose.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            runnyNose.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            runnyNose.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "runnyNose")
        }
        
        else if nasalStuffiness.btnModerate.isTouchInside {
            nasalStuffiness.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            nasalStuffiness.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            nasalStuffiness.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "nasalStuffiness")
        }
        
        else if nausea.btnModerate.isTouchInside {
            nausea.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            nausea.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            nausea.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "nausea")
        }
        
        else if ocularReaction.btnModerate.isTouchInside {
            ocularReaction.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            ocularReaction.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            ocularReaction.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "ocularReaction")
        }
        
        else if persistentCough.btnModerate.isTouchInside {
            persistentCough.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            persistentCough.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            persistentCough.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "persistentCough")
        }
        
        else if rhinorrhea.btnModerate.isTouchInside {
            rhinorrhea.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            rhinorrhea.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            rhinorrhea.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "rhinorrhea")
        }
        
        else if shortnessBreath.btnModerate.isTouchInside {
            shortnessBreath.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            shortnessBreath.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            shortnessBreath.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "shortnessBreath")
        }
        
        else if skinRush.btnModerate.isTouchInside {
            skinRush.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            skinRush.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            skinRush.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "skinRush")
        }
        
        else if skippedMeals.btnModerate.isTouchInside {
            skippedMeals.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            skippedMeals.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            skippedMeals.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "skippedMeals")
        }
        
        else if sneeze.btnModerate.isTouchInside {
            sneeze.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            sneeze.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            sneeze.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "sneeze")
        }
        
        else if soreThroat.btnModerate.isTouchInside {
            soreThroat.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            soreThroat.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            soreThroat.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "soreThroat")
        }
        
        else if sputum.btnModerate.isTouchInside {
            sputum.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            sputum.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            sputum.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "sputum")
        }
        
        else if vomiting.btnModerate.isTouchInside {
            vomiting.vwModerateInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            vomiting.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            vomiting.vwLowInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(2, forKey: "vomiting")
        }
    }
    
    func lowPressed() {
        if abdominalPain.btnLow.isTouchInside {
            abdominalPain.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            abdominalPain.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            abdominalPain.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "abdominalPain")
        }
        
        else if anorexia.btnLow.isTouchInside {
            anorexia.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            anorexia.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            anorexia.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "anorexia")
        }
        
        else if bluishFace.btnLow.isTouchInside {
            bluishFace.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            bluishFace.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            bluishFace.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "bluishFace")
        }
        
        else if bodyAches.btnLow.isTouchInside {
            bodyAches.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            bodyAches.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            bodyAches.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "bodyAches")
        }
        
        else if chestPain.btnLow.isTouchInside {
            chestPain.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            chestPain.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            chestPain.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "chestPain")
        }
        
        else if repeatedShaking.btnLow.isTouchInside {
            repeatedShaking.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            repeatedShaking.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            repeatedShaking.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "repeatedShaking")
        }
        
        else if confusion.btnLow.isTouchInside {
            confusion.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            confusion.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            confusion.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "confusion")
        }
        
        else if delirium.btnLow.isTouchInside {
            delirium.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            delirium.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            delirium.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "delirium")
        }
        
        else if diarrhea.btnLow.isTouchInside {
            diarrhea.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            diarrhea.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            diarrhea.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "diarrhea")
        }
        
        else if dizziness.btnLow.isTouchInside {
            dizziness.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            dizziness.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            dizziness.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "dizziness")
        }
        
        else if weakness.btnLow.isTouchInside {
            weakness.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            weakness.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            weakness.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "weakness")
        }
        
        
        else if feeling.btnLow.isTouchInside {
            feeling.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            feeling.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            feeling.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "feeling")
        }
        
        else if headache.btnLow.isTouchInside {
            headache.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            headache.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            headache.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "headache")
        }
        
        else if hoarseVoice.btnLow.isTouchInside {
            hoarseVoice.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            hoarseVoice.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            hoarseVoice.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "hoarseVoice")
        }
        
        else if lossTasteAndSmell.btnLow.isTouchInside {
            lossTasteAndSmell.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            lossTasteAndSmell.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            lossTasteAndSmell.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "lossTasteAndSmell")
        }
        
        else if musclePain.btnLow.isTouchInside {
            musclePain.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            musclePain.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            musclePain.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "musclePain")
        }
        
        else if runnyNose.btnLow.isTouchInside {
            runnyNose.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            runnyNose.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            runnyNose.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "runnyNose")
        }
        
        else if nasalStuffiness.btnLow.isTouchInside {
            nasalStuffiness.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            nasalStuffiness.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            nasalStuffiness.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "nasalStuffiness")
        }
        
        else if nausea.btnLow.isTouchInside {
            nausea.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            nausea.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            nausea.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "nausea")
        }
        
        else if ocularReaction.btnLow.isTouchInside {
            ocularReaction.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            ocularReaction.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            ocularReaction.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "ocularReaction")
        }
        
        else if persistentCough.btnLow.isTouchInside {
            persistentCough.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            persistentCough.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            persistentCough.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "persistentCough")
        }
        
        else if rhinorrhea.btnLow.isTouchInside {
            rhinorrhea.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            rhinorrhea.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            rhinorrhea.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "rhinorrhea")
        }
        
        else if shortnessBreath.btnLow.isTouchInside {
            shortnessBreath.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            shortnessBreath.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            shortnessBreath.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "shortnessBreath")
        }
        
        else if skinRush.btnLow.isTouchInside {
            skinRush.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            skinRush.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            skinRush.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "skinRush")
        }
        
        else if skippedMeals.btnLow.isTouchInside {
            skippedMeals.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            skippedMeals.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            skippedMeals.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "skippedMeals")
        }
        
        else if sneeze.btnLow.isTouchInside {
            sneeze.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            sneeze.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            sneeze.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "sneeze")
        }
        
        else if soreThroat.btnLow.isTouchInside {
            soreThroat.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            soreThroat.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            soreThroat.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "soreThroat")
        }
        
        else if sputum.btnLow.isTouchInside {
            sputum.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            sputum.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            sputum.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "sputum")
        }
        
        else if vomiting.btnLow.isTouchInside {
            vomiting.vwLowInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
            vomiting.vwSevereInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            vomiting.vwModerateInner.backgroundColor = UIColor(named: "checkBoxNotSelected")
            
            UserDefaults.standard.set(1, forKey: "vomiting")
            
        }
    }
}
