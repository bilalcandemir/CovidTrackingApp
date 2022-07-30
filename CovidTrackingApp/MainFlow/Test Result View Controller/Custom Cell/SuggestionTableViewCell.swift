//
//  SuggestionTableViewCell.swift
//  CovidTrackingApp
//
//  Created by Bilal Candemir on 6/6/21.
//

import UIKit

class SuggestionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblSuggestion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    static let identifier = "SuggestionTableViewCell"

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configureCell(data: Suggestion) {
        lblSuggestion.text = data.suggestion
    }
    
}
