//
//  ChooseTownTableViewCell.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 5/7/21.
//

import UIKit

class ChooseTownTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTownName: UILabel!
    
    static let identifier = "ChooseTownTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(data:TownResponse){
        lblTownName.text = data.townName
        selectionStyle = .none
        accessoryType = .none
    }
    
}
