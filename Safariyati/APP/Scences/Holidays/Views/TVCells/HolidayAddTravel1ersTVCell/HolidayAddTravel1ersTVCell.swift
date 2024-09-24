//
//  HolidayAddTravel1ersTVCell.swift
//  Safariyati
//
//  Created by Admin on 24/09/24.
//

import UIKit

class HolidayAddTravel1ersTVCell: TableViewCell {
    
    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var titlelbl: UILabel!
    
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
        setuplabels(lbl: titlelbl, text: "Add travel1ers", textcolor: .WhiteColor, font: .poppinsSemiBold(size: 16), align: .left)
        
        topview.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        topview.layer.cornerRadius = 8
        topview.clipsToBounds = true
    }
    
}
