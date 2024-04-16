//
//  GuestLoginButtonsTVCell.swift
//  Safariyati
//
//  Created by FCI on 15/04/24.
//

import UIKit
protocol GuestLoginButtonsTVCellDelegate {
    func didTapOnRegisterNowOrLoginBtnACtion(cell:GuestLoginButtonsTVCell)
}

class GuestLoginButtonsTVCell: TableViewCell {
    
    @IBOutlet weak var registerradioImg: UIImageView!
    @IBOutlet weak var loginradioImg: UIImageView!

    
    var delegate:GuestLoginButtonsTVCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func didTapOnRegisterNowOrLoginBtnACtion(_ sender: Any) {
        
        if (sender as AnyObject).tag == 1 {
            registerradioImg.image = UIImage(named: "rselect")?.withRenderingMode(.alwaysOriginal).withTintColor(HexColor("#0095DA"))
            loginradioImg.image = UIImage(named: "runselect")?.withRenderingMode(.alwaysOriginal)
            regnowloginBtntap = "reg"
        }else {
            registerradioImg.image = UIImage(named: "runselect")?.withRenderingMode(.alwaysOriginal)
            loginradioImg.image = UIImage(named: "rselect")?.withRenderingMode(.alwaysOriginal).withTintColor(HexColor("#0095DA"))
            regnowloginBtntap = "login"
        }
        
        delegate?.didTapOnRegisterNowOrLoginBtnACtion(cell: self)
    }
    
    
}
