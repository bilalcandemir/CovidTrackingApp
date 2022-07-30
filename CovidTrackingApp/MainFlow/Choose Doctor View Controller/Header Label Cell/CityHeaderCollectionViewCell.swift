//
//  CityHeaderCollectionViewCell.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 4/21/21.
//

import UIKit

class CityHeaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblCityName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    static let identifier = "CityHeaderCollectionViewCell"
    
    func configureCell(townName:ChooseDoctor){
        lblCityName.text = townName.cityName.cityName
    }

}
