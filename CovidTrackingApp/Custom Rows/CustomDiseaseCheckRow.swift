//
//  CustomDiseaseCheckRow.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 3/10/21.
//

import UIKit

protocol CustomDiseaseCheckRowDelegate:class {
    func leftPressed()
    func rightPressed()
}

class CustomDiseaseCheckRow: UIView, XibInstantiatable {
    
    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var vwLeft: UIView!
    @IBOutlet weak var lblLeft: UILabel!
    @IBOutlet weak var vwRight: UIView!
    @IBOutlet weak var lblRight: UILabel!
    @IBOutlet weak var vwLeftInner: UIView!
    @IBOutlet weak var vwRightInner: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiate()
        initStyles()
        lblLeft.text = "Yes"
        lblRight.text = "No"
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        instantiate()
        initStyles()
        lblLeft.text = "Yes"
        lblRight.text = "No"
    }
    
    func initStyles(){
        vwLeft.layer.borderWidth = 1.0
        vwLeft.layer.borderColor = UIColor(named: "checkBoxBorder")?.cgColor
        vwLeft.layer.cornerRadius = 13.0
        vwLeft.layer.masksToBounds = true
        
        
        vwRight.layer.borderWidth = 1.0
        vwRight.layer.borderColor = UIColor(named: "checkBoxBorder")?.cgColor
        vwRight.layer.cornerRadius = 13.0
        vwRight.layer.masksToBounds = true
        
        
        vwLeftInner.layer.cornerRadius = 6.0
        vwLeftInner.layer.masksToBounds = true
        
        vwRightInner.layer.cornerRadius = 6.0
        vwRightInner.layer.masksToBounds = true
    }
    
    weak var delegate:CustomDiseaseCheckRowDelegate?
    
    @IBAction func btnLeftPressed(_ sender: Any) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.leftPressed()
    }
    @IBAction func btnRightPressed(_ sender: Any) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.rightPressed()
    }
    
    func setTitleText(text:String) {
        lblTitle.text = text
    }
    
    func setLeftText(text:String){
        lblLeft.text = text
    }
    
    func setRightText(text:String){
        lblRight.text = text
    }
    
}
