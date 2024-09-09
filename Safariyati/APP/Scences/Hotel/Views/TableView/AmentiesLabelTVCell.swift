//
//  AmentiesLabelTVCell.swift
//  Safariyati
//
//  Created by appal on 05/08/24.
//

import UIKit

class AmentiesLabelTVCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupLabel(lbl: titleLabel, textcolor: .ApplabelColor, font: .InterRegular(size: 14))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
