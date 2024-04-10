//
//  AddFlightInfoTVCell.swift
//  Safariyati
//
//  Created by FCI on 10/04/24.
//

import UIKit

class AddFlightInfoTVCell: UITableViewCell {
    
    
    @IBOutlet weak var flightimg: UIImageView!
    @IBOutlet weak var opratorImg: UIImageView!
    @IBOutlet weak var flightnolbl: UILabel!
    @IBOutlet weak var fromcitycodelbl: UILabel!
    @IBOutlet weak var fromtimelbl: UILabel!
    @IBOutlet weak var tocitycodelbl: UILabel!
    @IBOutlet weak var totimelbl: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
