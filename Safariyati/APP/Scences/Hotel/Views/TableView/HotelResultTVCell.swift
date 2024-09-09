//
//  HotelResultTVCell.swift
//  Safariyati
//
//  Created by appal on 02/08/24.
//

import UIKit
import AARatingBar

class HotelResultTVCell: TableViewCell {
    
    @IBOutlet weak var refundLAbel: UILabel!
    @IBOutlet weak var ratingView: AARatingBar!
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var hotelImg: UIImageView!
    @IBOutlet weak var hotelNamelbl: UILabel!
    @IBOutlet weak var locImg: UIImageView!
    @IBOutlet weak var locationlbl: UILabel!
    @IBOutlet weak var kwdlbl: UILabel!
    @IBOutlet weak var faretypelbl: UILabel!
    @IBOutlet weak var priceperLabel: UILabel!
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        setupUI()
    }
    
    func setupUI() {
        
        setupLabel(lbl: hotelNamelbl, textcolor: HexColor("#0D1634"), font: .InterRegular(size: 16))
        setupLabel(lbl: locationlbl, textcolor: HexColor("#929398"), font: .InterRegular(size: 12))
        setupLabel(lbl: priceperLabel, textcolor: HexColor("#000000"), font: .InterRegular(size: 10))
        setupLabel(lbl: refundLAbel, textcolor: .refundcolor, font: .InterMedium(size: 14))
        setupLabel(lbl: faretypelbl, textcolor: .Buttoncolor, font: .InterBold(size: 16))
        setupLabel(lbl: kwdlbl, textcolor: .Buttoncolor, font: .InterBold(size: 20))
        
        
        
        
    }
    
}
