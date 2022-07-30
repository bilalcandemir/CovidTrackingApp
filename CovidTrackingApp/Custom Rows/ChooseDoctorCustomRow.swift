//
//  ChooseDoctorCustomRow.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 4/20/21.
//

import UIKit

protocol ChooseDoctorCustomRowDelegate:class {
    
}

class ChooseDoctorCustomRow: UIView, XibInstantiatable {

    @IBOutlet weak var btnMain: UIButton!
    @IBOutlet weak var imgDoctor: UIImageView!
    @IBOutlet weak var lblDoctorName: UILabel!
    @IBOutlet weak var lblDoctorProfession: UILabel!
    
    @IBOutlet weak var vwChoose: UIView!
    @IBOutlet weak var vwChooseInner: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiate()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        instantiate()
    }
    
    func configureCell(){
        
    }
    
}
