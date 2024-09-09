//
//  NewHotelPriceSummeryTVCell.swift
//  Safariyati
//
//  Created by appal on 06/08/24.
//

import UIKit

class NewHotelPriceSummeryTVCell: TableViewCell {
    
    @IBOutlet weak var holderStackView: UIStackView!
    @IBOutlet weak var childCountLabel: UILabel!
    @IBOutlet weak var adultCountLabel: UILabel!
    @IBOutlet weak var roomCountLabel: UILabel!
    @IBOutlet weak var addonView: UIView!
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var flexibleView: UIView!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var whatsAppView: UIView!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var priceChangeLabel: UILabel!
    @IBOutlet weak var flexiblePriceLbl: UILabel!
    @IBOutlet weak var whatsAppPriceLbl: UILabel!
    @IBOutlet weak var hotelNamelbl: UILabel!
    @IBOutlet weak var hotelLoclbl: UILabel!
    @IBOutlet weak var checkinDatelbl: UILabel!
    @IBOutlet weak var checkoutDatelbl: UILabel!
    @IBOutlet weak var noofNightslbl: UILabel!
    @IBOutlet weak var roomTypelbl: UILabel!
    @IBOutlet weak var adultsCountlbl: UILabel!
    @IBOutlet weak var childCountlbl: UILabel!
    @IBOutlet weak var pricelbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        holderStackView.layer.cornerRadius = 8
        holderStackView.layer.borderWidth = 1
        holderStackView.layer.borderColor = UIColor.BorderColor.cgColor
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
