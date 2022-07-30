//
//  SideMenuTableViewCell.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 4/15/21.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgTitle: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    static let identifier = "SideMenuTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(data: MenuItem){
        accessoryType = .none
        selectionStyle = .none
        
        self.lblTitle.text = data.title
        self.imgTitle.image = UIImage.init(named: data.imageName)
    }
    
}
