//
//  MenuTitleTVCell.swift
//  Safariyati
//
//  Created by FCI on 06/04/24.
//

import UIKit

class MenuTitleTVCell: TableViewCell {
    
    @IBOutlet weak var mimage: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var imgwidth: NSLayoutConstraint!
    @IBOutlet weak var imgleft: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func updateUI() {
        mimage.image = UIImage(named: cellInfo?.image ?? "")
        titlelbl.text = cellInfo?.title ?? ""
        
        if cellInfo?.key == "more" {
            imgwidth.constant = 0
            imgleft.constant = 0
        }
    }
    
}
