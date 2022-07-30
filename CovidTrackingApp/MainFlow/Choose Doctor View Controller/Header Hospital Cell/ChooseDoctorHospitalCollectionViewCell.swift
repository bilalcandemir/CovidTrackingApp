//
//  ChooseDoctorHospitalCollectionViewCell.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 4/21/21.
//

import UIKit

class ChooseDoctorHospitalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblHospitalName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    static let identifier = "ChooseDoctorHospitalCollectionViewCell"
    
    func configureCell(hospitalName:ChooseDoctor){
        lblHospitalName.text = hospitalName.hospitalName.hospitalName
    }

}
