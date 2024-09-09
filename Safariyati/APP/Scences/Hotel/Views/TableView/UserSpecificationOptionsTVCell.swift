//
//  UserSpecificationOptionsTVCell.swift
//  Safariyati
//
//  Created by appal on 06/08/24.
//

import UIKit

class UserSpecificationOptionsTVCell:  TableViewCell {

    @IBOutlet weak var chkImg: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        chkImg.image = UIImage(named: "grayCheckbox")?.withRenderingMode(.alwaysOriginal)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
