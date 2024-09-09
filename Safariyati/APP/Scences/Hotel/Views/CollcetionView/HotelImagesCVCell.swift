//
//  HotelImagesCVCell.swift
//  Safariyati
//
//  Created by appal on 05/08/24.
//

import UIKit

class HotelImagesCVCell:  UICollectionViewCell {
    
    @IBOutlet weak var hotelImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        hotelImg.layer.cornerRadius = 8
        hotelImg.clipsToBounds = true
        hotelImg.contentMode = .scaleToFill
    }

}
