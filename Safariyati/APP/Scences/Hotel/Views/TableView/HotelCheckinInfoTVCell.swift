//
//  HotelCheckinInfoTVCell.swift
//  Safariyati
//
//  Created by appal on 05/08/24.
//

import UIKit

class HotelCheckinInfoTVCell: TableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var childCountLabel: UILabel!
    
    @IBOutlet weak var viewMapButton: UIButton!
    @IBOutlet weak var adultNumberLabel: UILabel!
    @IBOutlet weak var checkOutLabel: UILabel!
    @IBOutlet weak var checkInLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    
    func setupUI() {
        setupLabel(lbl: titleLabel, textcolor: UIColor.ZeroD1Color, font: .InterMedium(size: 16))
        setupLabel(lbl: subTitleLabel, textcolor: UIColor.nine2Color, font: .InterMedium(size: 12))
        setupLabel(lbl: checkInLabel, textcolor: UIColor.ApplabelColor, font: .InterRegular(size: 12))
        setupLabel(lbl: checkOutLabel, textcolor: UIColor.ApplabelColor, font: .InterRegular(size: 12))
        setupLabel(lbl: adultNumberLabel, textcolor: UIColor.ApplabelColor, font: .InterRegular(size: 12))
        setupLabel(lbl: childCountLabel, textcolor: UIColor.ApplabelColor, font: .InterRegular(size: 12))
        viewMapButton.titleLabel?.font = .poppinsMedium(size: 14)
        viewMapButton.layer.cornerRadius = 4
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
