//
//  PinMeaningTableViewCell.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 4/25/21.
//

import UIKit

class PinMeaningTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgPin: UIImageView!
    @IBOutlet weak var lblPin: UILabel!
    
    static let identifier = "PinMeaningTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(item:pinMeans) {
        imgPin.image = UIImage(named: item.image)
        lblPin.text = item.means
    }
    
}
