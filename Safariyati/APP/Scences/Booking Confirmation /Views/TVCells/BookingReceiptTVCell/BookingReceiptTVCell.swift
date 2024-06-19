//
//  BookingReceiptTVCell.swift
//  Safariyati
//
//  Created by Admin on 18/06/24.
//

import UIKit

class BookingReceiptTVCell: TableViewCell {
    
    @IBOutlet weak var bookingdatelbl: UILabel!
    @IBOutlet weak var bookingidlbl: UILabel!
    @IBOutlet weak var gdsrefrencelbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func updateUI() {
        MySingleton.shared.setAttributedTextnew(str1: "Booking id: ",
                                                str2: "TR-64522-8457",
                                                lbl: bookingidlbl,
                                                str1font: .InterRegular(size: 14),
                                                str2font: .InterMedium(size: 14),
                                                str1Color: HexColor("#7F7F7F"),
                                                str2Color: .TitleColor)
        
        MySingleton.shared.setAttributedTextnew(str1: "GDS Reference: ",
                                                str2: "BW-54F4G4",
                                                lbl: gdsrefrencelbl,
                                                str1font: .InterRegular(size: 14),
                                                str2font: .InterMedium(size: 14),
                                                str1Color: HexColor("#7F7F7F"),
                                                str2Color: .TitleColor)
    }
    
}
