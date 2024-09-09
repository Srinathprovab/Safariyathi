//
//  HotelDetailsTVCell.swift
//  Safariyati
//
//  Created by appal on 05/08/24.
//

import UIKit

class HotelDetailsTVCell: TableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupOnlyFont(lbl: titleLabel, font: .InterRegular(size: 16), text: "Clifton International Hotel")
        setupOnlyFont(lbl: subtitleLabel, font: .InterRegular(size: 12), text: "Sheikh hamad bin abdullah road, near fewa tower, al-fujairah, 4388, united arab emirates")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
