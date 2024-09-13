//
//  AddFlightltineraryInfoTVCell.swift
//  Safariyati
//
//  Created by FCI on 11/04/24.
//

import UIKit

class AddFlightltineraryInfoTVCell: UITableViewCell {
    
    @IBOutlet weak var airlinenamelbl: UILabel!
    @IBOutlet weak var layoverView: UIView!
    @IBOutlet weak var layoverlbl: UILabel!
    @IBOutlet weak var opimage: UIImageView!
    @IBOutlet weak var fromcity: UILabel!
    @IBOutlet weak var fromairport: UILabel!
    @IBOutlet weak var fromterminal: UILabel!
    @IBOutlet weak var tocity: UILabel!
    @IBOutlet weak var toairport: UILabel!
    @IBOutlet weak var toterminal: UILabel!
    @IBOutlet weak var hourslbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
