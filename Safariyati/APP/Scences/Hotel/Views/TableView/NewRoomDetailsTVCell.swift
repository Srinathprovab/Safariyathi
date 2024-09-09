//
//  NewRoomDetailsTVCell.swift
//  Safariyati
//
//  Created by appal on 05/08/24.
//

import UIKit

class NewRoomDetailsTVCell: TableViewCell {
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var roomPriceLanbel: UILabel!
    @IBOutlet weak var cancellationPolicyLabel: UILabel!
    @IBOutlet weak var adultChildCountLabel: UILabel!
    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var onlyRoomLabel: UILabel!
    @IBOutlet weak var topView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupOnlyFont(lbl: roomNameLabel, font: .InterRegular(size: 14), text: "Standard King")
        setupOnlyFont(lbl: onlyRoomLabel, font: .InterRegular(size: 12), text: "Room Only")
        setupOnlyFont(lbl: adultChildCountLabel, font: .InterRegular(size: 10), text: "1 Adult, 0 child, 1 Room")
        setupOnlyFont(lbl: cancellationPolicyLabel, font: .InterRegular(size: 10), text: "Cancellation policy")
        setupOnlyFont(lbl: roomPriceLanbel, font: .InterBold(size: 16), text: "OMR 80.000")
        bottomView.isHidden = false
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
