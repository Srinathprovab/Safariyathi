//
//  BestFlightCVCell.swift
//  Safariyati
//
//  Created by FCI on 06/04/24.
//

import UIKit

class BestFlightCVCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img.layer.cornerRadius = 10
    }

}
