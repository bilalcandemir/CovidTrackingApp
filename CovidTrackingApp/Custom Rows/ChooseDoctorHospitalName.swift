//
//  ChooseDoctorHospitalName.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 4/20/21.
//

import UIKit

class ChooseDoctorHospitalName: UIView, XibInstantiatable {

    @IBOutlet weak var lblHospitalName: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiate()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        instantiate()
    }
    
    func configureCell(hospitalName:String){
        lblHospitalName.text = hospitalName
    }

}
