//
//  InclusionsCVCell.swift
//  Safariyati
//
//  Created by Admin on 23/09/24.
//

import UIKit

class InclusionsCVCell: UICollectionViewCell {
    
    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var img: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        titlelbl.numberOfLines = 0
    }

}
