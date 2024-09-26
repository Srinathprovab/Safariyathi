//
//  TotalNoofTravellerTVCell.swift
//  Safariyati
//
//  Created by appal on 06/08/24.
//

import UIKit

class TotalNoofTravellerTVCell: TableViewCell {
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var titlelbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        holderView.layer.borderColor = UIColor.WhiteColor.cgColor
//        holderView.layer.borderWidth = 1
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func updateUI() {
        titlelbl.text = cellInfo?.title ?? ""
    }
    
}
