//
//  GuestRegistrationTVCell.swift
//  Safariyati
//
//  Created by FCI on 11/04/24.
//

import UIKit
protocol GuestRegistrationTVCellDelegate {
    func didTapOnRegisterNowBtnAction(cell:GuestRegistrationTVCell)
    func didTapOnGuestLoginBtnAction(cell:GuestRegistrationTVCell)
    func didTapOnLoginBtnAction(cell:GuestRegistrationTVCell)
}

class GuestRegistrationTVCell: TableViewCell {
    
    @IBOutlet weak var passwordTxtfld: UITextField!
    
    @IBOutlet weak var phoneNumberTextfld: UITextField!
    @IBOutlet weak var emailTextFld: UITextField!
    @IBOutlet weak var mobileView: UIView!
    @IBOutlet weak var regView: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginBtnlbl: UILabel!
    

    var delegate:GuestRegistrationTVCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        
        
        emailTextFld.placeholder = "Email Address"
        phoneNumberTextfld.placeholder = "Phone Number"
        passwordTxtfld.placeholder = "Password"
//        emailTextFld.layer.borderWidth = 0.7
        emailTextFld.setLeftPaddingPoints(10)
        phoneNumberTextfld.setLeftPaddingPoints(10)
        passwordTxtfld.setLeftPaddingPoints(10)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func setupUI() {
        setupregisterUserView()
    }
    
    
    override func updateUI() {
        if regnowloginBtntap == "reg" {
            setupregisterUserView()
        }else {
            setupLoginView()
        }
    }
    
 
    
    func setupregisterUserView() {
        mobileView.isHidden = false
        regView.isHidden = false
        loginBtnlbl.text = "Continue As Guest"
    }
    

    func setupLoginView() {
        mobileView.isHidden = true
        regView.isHidden = true
        loginBtnlbl.text = "Login"
    }
    
    
    @IBAction func didTapOnRegisterNowBtnAction(_ sender: Any) {
        delegate?.didTapOnRegisterNowBtnAction(cell: self)
    }
    
    
    @IBAction func didTapOnGuestLoginBtnAction(_ sender: Any) {
        if loginBtnlbl.text == "Login" {
            delegate?.didTapOnLoginBtnAction(cell: self)
        }else {
            delegate?.didTapOnGuestLoginBtnAction(cell: self)
        }
        
    }
    
}
