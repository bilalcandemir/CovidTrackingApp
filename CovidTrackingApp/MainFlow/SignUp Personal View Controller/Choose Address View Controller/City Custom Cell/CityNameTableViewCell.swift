//
//  CityNameTableViewCell.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 5/6/21.
//

import UIKit

class CityNameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblCityName: UILabel!
    
    static let identifier = "CityNameTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(data:CityListResponse){
        lblCityName.text = data.cityName
        selectionStyle = .none
        accessoryType = .none
    }
    
}
