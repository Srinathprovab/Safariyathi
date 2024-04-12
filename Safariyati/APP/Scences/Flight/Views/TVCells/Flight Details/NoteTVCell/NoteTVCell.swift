//
//  NoteTVCell.swift
//  Safariyati
//
//  Created by FCI on 12/04/24.
//

import UIKit

class NoteTVCell: TableViewCell {

    @IBOutlet weak var notedesclbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func updateUI() {
        notedesclbl.text = "Cancellation /Change penalties are indicative. Fare rules and charges are subject to change as per airline any time. We try to keep this information update to date. But we suggest to reconfirm the penalties from our call center before any cancellation and changes.\n\nFor any Rescheduling - Change fee + fare difference ( if applicable )\n\nAll fees and charges mentioned are per passenger.\n\nDepending on the airline request for cancellation/change to be submitted varies from 24hrs -72hrs before departure of the flight.\n\n"
    }
    
}
