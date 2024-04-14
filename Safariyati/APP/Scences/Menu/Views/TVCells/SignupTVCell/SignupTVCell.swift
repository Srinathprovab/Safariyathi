//
//  SignupTVCell.swift
//  Safariyati
//
//  Created by FCI on 14/04/24.
//

import UIKit

protocol SignupTVCellDelegate {
    func didTapOnBackBtnnAction(cell:SignupTVCell)
    func didTapOnSignupBtnAction(cell:SignupTVCell)
    func didTapOnGotoSigninBtnAction(cell:SignupTVCell)
    func editingText(tf:UITextField)
}


class SignupTVCell: TableViewCell {
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var MobileTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var delegate:SignupTVCellDelegate?
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
        setupTF(tf: emailTF)
        setupTF(tf: MobileTF)
        setupTF(tf: passwordTF)
        passwordTF.isSecureTextEntry = true
    }
    
    
    
    func setupTF(tf:UITextField) {
        tf.font = UIFont.InterRegular(size: 14)
        tf.setLeftPaddingPoints(2)
        tf.addTarget(self, action: #selector(editingText(textField:)), for: .editingChanged)
    }
    
    
    @objc func editingText(textField:UITextField) {
        delegate?.editingText(tf: textField)
    }
    
    @IBAction func didTapOnBackBtnnAction(_ sender: Any) {
        delegate?.didTapOnBackBtnnAction(cell: self)
    }
    
    
    @IBAction func didTapOnSignupBtnAction(_ sender: Any) {
        delegate?.didTapOnSignupBtnAction(cell: self)
    }
    
    
    
    @IBAction func didTapOnGotoSigninBtnAction(_ sender: Any) {
        delegate?.didTapOnGotoSigninBtnAction(cell: self)
    }
    
}
