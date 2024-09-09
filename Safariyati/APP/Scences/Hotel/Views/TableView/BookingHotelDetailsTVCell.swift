//
//  BookingHotelDetailsTVCell.swift
//  Safariyati
//
//  Created by appal on 06/08/24.
//

import UIKit
import AARatingBar


protocol BookingHotelDetailsTVCellDelegate {
    func didTapOnVoucherBtn(cell:BookingHotelDetailsTVCell)
}

class BookingHotelDetailsTVCell: TableViewCell {
    
    @IBOutlet weak var hotelVoucherBtn: UIButton!
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var roomsTitleLabel: UILabel!
    @IBOutlet weak var guestTitelLabel: UILabel!
    @IBOutlet weak var checkoutTitleLabel: UILabel!
    @IBOutlet weak var belowDateLabel: UILabel!
    @IBOutlet weak var roomCountStackView: UIStackView!
    @IBOutlet weak var roomCountLabel: UILabel!
    @IBOutlet weak var hotelnamelbl: UILabel!
    @IBOutlet weak var hotellocationlbl: UILabel!
    @IBOutlet weak var hotelimage: UIImageView!
    @IBOutlet weak var chickinlbl: UILabel!
    @IBOutlet weak var checkoutlbl: UILabel!
    @IBOutlet weak var guestlbl: UILabel!
    @IBOutlet weak var ratingView: AARatingBar!
    @IBOutlet weak var checkinTitleLabel: UILabel!
    
    var delegate: BookingHotelDetailsTVCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    
    func setupUI() {
        setupOnlyFont(lbl: hotelnamelbl, font: .InterRegular(size: 16), text: "Clifton International Hotel")
        setupOnlyFont(lbl: hotellocationlbl, font: .InterRegular(size: 12), text: "Sheikh hamad bin abdullah road, near fewa tower, al-fujairah, 4388, united arab emirates")
        setupOnlyFont(lbl: chickinlbl, font: .InterRegular(size: 14), text: "12-08-2024")
        setupOnlyFont(lbl: checkoutlbl, font: .InterRegular(size: 14), text: "13-08-2024")
        setupOnlyFont(lbl: checkinTitleLabel, font: .InterRegular(size: 14), text: "Check In")
        setupOnlyFont(lbl: checkoutTitleLabel, font: .InterRegular(size: 14), text: "Check Out")
        setupOnlyFont(lbl: guestTitelLabel, font: .InterRegular(size: 14), text: "Guests")
        setupOnlyFont(lbl: roomsTitleLabel, font: .InterRegular(size: 14), text: "Rooms")
    }
    
    
    override func updateUI() {
        if cellInfo?.key == "Booking" {
//            belowDateLabel.isHidden = true
//            bottomView.isHidden = true
//            roomCountStackView.isHidden = true
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
