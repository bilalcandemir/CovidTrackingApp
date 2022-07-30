//
//  CustomSingleNextButton.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 3/10/21.
//

import UIKit

protocol CustomSingleNextButtonDelegate:class{
    func nextPressed()
}

class CustomSingleNextButton: UIView, XibInstantiatable {
    
    @IBOutlet weak var btnNext: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiate()
        buttonSettings()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        instantiate()
        buttonSettings()
    }
    
    weak var delegate:CustomSingleNextButtonDelegate?
    
    func buttonSettings(){
        btnNext.setTitle("Next", for: .normal)
        btnNext.tintColor = UIColor.white
        btnNext.backgroundColor = UIColor(named: "textFieldPlaceholderColor")
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        guard let delegate = self.delegate else {
            return
        }
        delegate.nextPressed()
    }
}
