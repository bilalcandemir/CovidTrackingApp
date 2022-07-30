//
//  CustomTextField.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 2/14/21.
//

import Foundation
import UIKit

class CustomTextField:UITextField {
    ///Padding for text Field
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    
    ///Text Padding
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    ///Placeholder Padding
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    // Provides left padding for images
       override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
           var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += 15.0
           return textRect
       }
}
