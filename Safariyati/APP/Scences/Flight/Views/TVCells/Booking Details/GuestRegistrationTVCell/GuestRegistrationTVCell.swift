//
//  GuestRegistrationTVCell.swift
//  Safariyati
//
//  Created by FCI on 11/04/24.
//

import UIKit
protocol GuestRegistrationTVCellDelegate {
    func didTapOnRegisterBtnAction(cell:GuestRegistrationTVCell)
    func didTapOnLoginNowBtnAction(cell:GuestRegistrationTVCell)
    func didTapOnregOrLoginBtnAction(cell:GuestRegistrationTVCell)
}

class GuestRegistrationTVCell: TableViewCell {
    
    
    @IBOutlet weak var mobileView: UIView!
    @IBOutlet weak var registerradioImg: UIImageView!
    @IBOutlet weak var loginradioImg: UIImageView!
    @IBOutlet weak var regView: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginBtnlbl: UILabel!
    
    
    var delegate:GuestRegistrationTVCellDelegate?
    
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
        setupregisterUserView()
    }
    
    
    override func updateUI() {
        
    }
    
    
    
    
    
    @IBAction func didTapOnRegisterBtnAction(_ sender: Any) {
        setupregisterUserView()
        delegate?.didTapOnregOrLoginBtnAction(cell: self)
    }
    
    func setupregisterUserView() {
        mobileView.isHidden = false
        regView.isHidden = false
        loginBtnlbl.text = "Countinue As Guest"
        registerradioImg.image = UIImage(named: "rselect")?.withRenderingMode(.alwaysOriginal).withTintColor(HexColor("#0095DA"))
        loginradioImg.image = UIImage(named: "runselect")?.withRenderingMode(.alwaysOriginal)
    }
    
    
    @IBAction func didTapOnLoginBtnAction(_ sender: Any) {
        setupLoginView()
        delegate?.didTapOnregOrLoginBtnAction(cell: self)
    }
    
    func setupLoginView() {
        mobileView.isHidden = true
        regView.isHidden = true
        loginBtnlbl.text = "Login"
        registerradioImg.image = UIImage(named: "runselect")?.withRenderingMode(.alwaysOriginal)
        loginradioImg.image = UIImage(named: "rselect")?.withRenderingMode(.alwaysOriginal).withTintColor(HexColor("#0095DA"))
    }
    
    @IBAction func didTapOnRegisterNowBtnAction(_ sender: Any) {
        delegate?.didTapOnRegisterBtnAction(cell: self)
    }
    
    
    @IBAction func didTapOnLoginNowBtnAction(_ sender: Any) {
        delegate?.didTapOnLoginNowBtnAction(cell: self)
    }
    
}
