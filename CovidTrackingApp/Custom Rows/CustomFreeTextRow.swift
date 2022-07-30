//
//  CustomFreeTextRow.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 3/9/21.
//

import UIKit
import TextFieldEffects



class CustomFreeTextRow: UIView, XibInstantiatable {
    
    @IBOutlet weak var txtMain: HoshiTextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiate()
        setPlaceholderSize()
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        instantiate()
        setPlaceholderSize()
    }
    
    func setPlaceholderSize(){
        
    }

}

extension CustomFreeTextRow:CustomRowProtocol {
    func setTitle(title: String) {
        
    }
    
    func setPlaceholder(placeholder: String) {
        txtMain.placeholder = placeholder
    }
    
    func setKeybardType(type: UIKeyboardType) {
        txtMain.keyboardType = type
    }
}
