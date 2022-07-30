//
//  ChooseDoctorCustomCollectionViewCell.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 4/21/21.
//

import UIKit

class ChooseDoctorCustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgDoctor: UIImageView!
    @IBOutlet weak var lblDoctorName: UILabel!
    @IBOutlet weak var lblDoctorProfession: UILabel!
    @IBOutlet weak var vwChooseMain: UIView!
    @IBOutlet weak var vwChooseInner: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgDoctor.image = UIImage(named: "doctor")
        imgDoctor.layer.cornerRadius = 15
        
        vwChooseMain.layer.borderWidth = 1.0
        vwChooseMain.layer.borderColor = UIColor(named: "checkBoxBorder")?.cgColor
        vwChooseMain.layer.cornerRadius = 13.0
        vwChooseMain.layer.masksToBounds = true
        
        vwChooseInner.layer.cornerRadius = 6.0
        vwChooseInner.layer.masksToBounds = true
    }
    
    var active = 0
    
    static let identifier = "ChooseDoctorCustomCollectionViewCell"
    
    func configureCell(data:ChooseDoctor, isSelected:Bool){
        lblDoctorName.text = data.doctorName
        lblDoctorProfession.text = data.doctorProfession
        
        if isSelected {
            vwChooseInner.backgroundColor = UIColor(named: "colorTitleDarkBlue")
        }
        else {
            vwChooseInner.backgroundColor = UIColor(named: "whiteColor")
        }
    }
    
    
    

    
}
