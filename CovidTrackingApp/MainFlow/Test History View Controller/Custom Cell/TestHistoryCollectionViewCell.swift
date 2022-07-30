//
//  TestHistoryCollectionViewCell.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 6/15/21.
//

import UIKit

class TestHistoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TestHistoryCollectionViewCell"
    
    @IBOutlet weak var vwMain: UIView!
    @IBOutlet weak var imgResult: UIImageView!
    @IBOutlet weak var testDate: UILabel!
    @IBOutlet weak var probabilityValue: UILabel!
    @IBOutlet weak var hospitalName: UILabel!
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var lblUserId: UILabel!
    @IBOutlet weak var lblUserAge: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vwMain.layer.borderWidth = 1
        vwMain.layer.borderColor = UIColor(named: "collectionShadowColor")?.cgColor
        
        vwMain.layer.shadowOffset = CGSize(width: 0, height: 0)
        vwMain.layer.shadowColor = UIColor(named: "collectionShadowColor")?.cgColor
        vwMain.layer.shadowOpacity = 0.23
        vwMain.layer.shadowRadius = 4
    }
    
    
    func configureCell(data: TestHistoryResponse){
        
        testDate.text = data.testDate
        probabilityValue.text = "Probability Value: \(String(data.probabilityValue))%"
        hospitalName.text = "Hospital: \(data.hospitalName)"
        doctorName.text = "Doctor: \(data.doctorName)"
        lblUserId.text = "ID: \(String(data.userIdentity))"
        lblUserAge.text = "Age: \(String(data.userAge))"
    }

}


