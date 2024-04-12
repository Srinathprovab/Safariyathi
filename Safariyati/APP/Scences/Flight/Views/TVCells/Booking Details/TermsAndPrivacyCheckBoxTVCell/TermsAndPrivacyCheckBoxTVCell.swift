//
//  TermsAndPrivacyCheckBoxTVCell.swift
//  Safariyati
//
//  Created by FCI on 11/04/24.
//

import UIKit

class TermsAndPrivacyCheckBoxTVCell: TableViewCell {
    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var checkBoxImg: UIImageView!
    
    
    var termsBool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    override func updateUI() {
        titlelbl.text = cellInfo?.title ?? ""
        
        
        
    }
    
  
    
    @IBAction func didTapOnCheckBoxBtnAction(_ sender: Any) {
        termsBool.toggle()
        if termsBool {
            checkBoxImg.image = UIImage(named: "checkbox")?.withRenderingMode(.alwaysOriginal).withTintColor(.Buttoncolor)
        }else {
            checkBoxImg.image = UIImage(named: "uncheck")?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    
    
    
    
    
}
