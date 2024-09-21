//
//  AcceptTermsAndConditionTVCell.swift
//  BabSafar
//
//  Created by FCI on 16/02/23.
//

import UIKit


protocol AcceptTermsAndConditionTVCellDelegate {
    func didTapOnTAndCAction(cell:AcceptTermsAndConditionTVCell)
    func didTapOnPrivacyPolicyAction(cell:AcceptTermsAndConditionTVCell)
}

class AcceptTermsAndConditionTVCell: TableViewCell {
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var checkImg: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    
    
    var checkBool = true
    var delegate: AcceptTermsAndConditionTVCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
    override func updateUI() {
        titlelbl.text = cellInfo?.title ?? ""
        
        
        let str1 = "By selecting to complete this booking I agree to pay the total amount shown, which includes Service Fees (if applicable), and I acknowledge that I have read and accept the "
        
        let str2 = "Booking Terms and Conditions"
        
        let str3 = " Ensure to check the passport validity requirements of the countries you are visiting prior to completing your booking."
        
        
        setAttributedString(str1: str1, str2: str2,str3: str3, str4: "")
    }
    
    func setupUI() {
        contentView.backgroundColor = .WhiteColor
        holderView.backgroundColor = .WhiteColor
        checkImg.image = UIImage(named: "uncheck")?.withRenderingMode(.alwaysOriginal).withTintColor(.Buttoncolor)
        checkBtn.setTitle("", for: .normal)
    }
    
    
    func setAttributedString(str1:String,str2:String,str3:String,str4:String) {
        
        let atter1 = [NSAttributedString.Key.foregroundColor:UIColor.ApplabelColor,NSAttributedString.Key.font:UIFont.InterRegular(size: 14)] as [NSAttributedString.Key : Any]
        let atter2 = [NSAttributedString.Key.foregroundColor:UIColor.Buttoncolor,
                      NSAttributedString.Key.font:UIFont.InterRegular(size: 14),
                      NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                      NSAttributedString.Key.underlineColor: UIColor.Buttoncolor ] as [NSAttributedString.Key : Any]
        
        let atterStr1 = NSMutableAttributedString(string: str1, attributes: atter1)
        let atterStr2 = NSMutableAttributedString(string: str2, attributes: atter2)
        let atterStr3 = NSMutableAttributedString(string: str3, attributes: atter1)
        let atterStr4 = NSMutableAttributedString(string: str4, attributes: atter1)
        
        let combination = NSMutableAttributedString()
        combination.append(atterStr1)
        combination.append(atterStr2)
        combination.append(atterStr3)
        combination.append(atterStr4)
        titlelbl.attributedText = combination
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        titlelbl.addGestureRecognizer(tapGesture)
        titlelbl.isUserInteractionEnabled = true
        
        titlelbl.numberOfLines = 0
    }
    
    @objc func labelTapped(gesture:UITapGestureRecognizer) {
        if gesture.didTapAttributedString("Booking Terms and Conditions", in: titlelbl) {
            checkBool = false
            checkTermsAndCondationStatus = true
            checkImg.image = UIImage(named: "checkbox")?.withRenderingMode(.alwaysOriginal).withTintColor(.Buttoncolor)
            delegate?.didTapOnTAndCAction(cell: self)
        }
    }
    
    
    @IBAction func didTapOnCheckTCBtnAction(_ sender: Any) {
        if checkBool == true {
            checkTermsAndCondationStatus = true
            checkImg.image = UIImage(named: "checkbox")?.withRenderingMode(.alwaysOriginal).withTintColor(.Buttoncolor)
            checkBool = false
        }else {
            checkTermsAndCondationStatus = false
            checkImg.image = UIImage(named: "uncheck")?.withRenderingMode(.alwaysOriginal).withTintColor(.Buttoncolor)
            checkBool = true
        }
    }
    
    
    
    
    
    
}
