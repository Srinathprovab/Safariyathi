//
//  AddInfoFareTVCell.swift
//  Safariyati
//
//  Created by Admin on 19/09/24.
//

import UIKit

class AddInfoFareTVCell: UITableViewCell {
    
    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var subtitlelbl: UILabel!
    @IBOutlet weak var subtitleview: UIView!
    @IBOutlet weak var bottomview1: UIView!
    @IBOutlet weak var bottomview2: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupUI() {
        setuplabels(lbl: titlelbl, text: "", textcolor: .ApplabelColor, font: .InterBold(size: 14), align: .left)
        setuplabels(lbl: subtitlelbl, text: "", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .center)
    }
    
}
