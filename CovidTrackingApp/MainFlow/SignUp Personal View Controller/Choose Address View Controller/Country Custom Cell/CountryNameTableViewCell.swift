//
//  CountryNameTableViewCell.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 5/5/21.
//

import UIKit

class CountryNameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblCountryName: UILabel!
    
    static let identifier = "CountryNameTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
            
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
            
    }
    
    func configureCell(data:CountryName){
        lblCountryName.text = data.name
        selectionStyle = .none
        accessoryType = .none
    }
    
}
