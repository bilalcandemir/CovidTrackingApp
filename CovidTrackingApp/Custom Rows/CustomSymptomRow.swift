//
//  CustomSymptomRow.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 3/14/21.
//

import UIKit

protocol CustomSymptomRowDelegate:class {
    func severePressed()
    func moderatePressed()
    func lowPressed()
}

class CustomSymptomRow: UIView, XibInstantiatable {
    @IBOutlet weak var lblSymptomName: UILabel!
    @IBOutlet weak var btnSevere: UIButton!
    @IBOutlet weak var btnModerate: UIButton!
    @IBOutlet weak var btnLow: UIButton!
    @IBOutlet weak var vwSevere: UIView!
    @IBOutlet weak var vwSevereInner: UIView!
    @IBOutlet weak var vwModerate: UIView!
    @IBOutlet weak var vwModerateInner: UIView!
    @IBOutlet weak var vwLow: UIView!
    @IBOutlet weak var vwLowInner: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiate()
        initStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        instantiate()
        initStyle()
    }
    
    func initStyle(){
        vwSevere.layer.borderWidth = 1.0
        vwSevere.layer.borderColor = UIColor(named: "checkBoxBorder")?.cgColor
        vwSevere.layer.cornerRadius = 13.0
        vwSevere.layer.masksToBounds = true
        
        vwModerate.layer.borderWidth = 1.0
        vwModerate.layer.borderColor = UIColor(named: "checkBoxBorder")?.cgColor
        vwModerate.layer.cornerRadius = 13.0
        vwModerate.layer.masksToBounds = true
        
        vwLow.layer.borderWidth = 1.0
        vwLow.layer.borderColor = UIColor(named: "checkBoxBorder")?.cgColor
        vwLow.layer.cornerRadius = 13.0
        vwLow.layer.masksToBounds = true
        
        vwSevereInner.layer.cornerRadius = 6.0
        vwSevereInner.layer.masksToBounds = true
        
        vwModerateInner.layer.cornerRadius = 6.0
        vwModerateInner.layer.masksToBounds = true
        
        vwLowInner.layer.cornerRadius = 6.0
        vwLowInner.layer.masksToBounds = true
    }
    
    func configureCell(symptomName:String) {
        self.lblSymptomName.text = symptomName
    }
    
    weak var delegate:CustomSymptomRowDelegate?
    
    @IBAction func severePressed(_ sender: Any) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.severePressed()
    }
    
    @IBAction func moderatePressed(_ sender: Any) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.moderatePressed()
    }
    
    @IBAction func lowPressed(_ sender: Any) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.lowPressed()
    }
    
}
