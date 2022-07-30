//
//  ChooseDoctorHospitalNameRow.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 4/20/21.
//

import UIKit

class ChooseDoctorCityNameRow: UIView, XibInstantiatable {
    
    @IBOutlet weak var lblCityName: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiate()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        instantiate()
    }
    
    func configureCell(cityName:String){
        lblCityName.text = cityName
    }

}
