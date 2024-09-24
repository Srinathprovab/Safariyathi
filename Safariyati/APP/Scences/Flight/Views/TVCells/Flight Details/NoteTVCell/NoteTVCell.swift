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
        notedesclbl.text = "All charges and fees are valid until 48 hours prior to the scheduled flight departure. Extra charges may be incurred later, or tickets might not be eligible for refunds or changes. The fees displayed are approximate according to airline regulations and may be modified by the airlines without prior notice. Safariyati does not provide assurance for the accuracy of this information"
    }
    
}
