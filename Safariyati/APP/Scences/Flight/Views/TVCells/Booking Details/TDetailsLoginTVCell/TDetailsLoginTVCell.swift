//
//  TDetailsLoginTVCell.swift
//  BabSafar
//
//  Created by MA673 on 25/07/22.
//

import UIKit
protocol TDetailsLoginTVCellDelegate {
    func didTapOnLoginBtn(cell:TDetailsLoginTVCell)
}

class TDetailsLoginTVCell: TableViewCell {
    

    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var imgView: UIView!
    @IBOutlet weak var loginImg: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var loginBtnView: UIView!
    @IBOutlet weak var loginlbl: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    
    var delegate:TDetailsLoginTVCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupUI() {
        contentView.backgroundColor = .WhiteColor
        holderView.backgroundColor = HexColor("#DCF4FF")
        holderView.layer.borderWidth = 0.4
        holderView.layer.borderColor = UIColor.BorderColor.cgColor
        holderView.layer.cornerRadius = 4
        holderView.clipsToBounds = true
        loginImg.image = UIImage(named: "login")?.withRenderingMode(.alwaysOriginal).withTintColor(.Buttoncolor)
        loginBtnView.backgroundColor = .Buttoncolor
        loginBtnView.layer.cornerRadius = 4
        loginBtnView.clipsToBounds = true
    
        titlelbl.text = "If you already have an account with HolidaysCenter Please do sign in here."
        titlelbl.textColor = .ApplabelColor
        titlelbl.font = UIFont.InterRegular(size: 14)
        titlelbl.numberOfLines = 0
        
        loginlbl.text = "Login"
        loginlbl.textColor = .WhiteColor
        loginlbl.font = UIFont.InterBold(size: 14)
        
        loginBtn.setTitle("", for: .normal)
        
        imgView.backgroundColor = .WhiteColor
        imgView.layer.cornerRadius = 20
        imgView.clipsToBounds = true
    }
    
    
    @IBAction func didTapOnLoginBtn(_ sender: Any) {
        delegate?.didTapOnLoginBtn(cell: self)
    }
    
    
}
