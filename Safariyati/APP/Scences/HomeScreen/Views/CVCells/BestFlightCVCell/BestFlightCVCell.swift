//
//  BestFlightCVCell.swift
//  Safariyati
//
//  Created by FCI on 06/04/24.
//

import UIKit

class BestFlightCVCell: UICollectionViewCell {
    
    @IBOutlet weak var holderview: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        holderview.layer.cornerRadius = 10
        holderview.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        setuplabels(lbl: titlelbl, text: "", textcolor: .WhiteColor, font: .InterBold(size: 16), align: .center)
    }

}
