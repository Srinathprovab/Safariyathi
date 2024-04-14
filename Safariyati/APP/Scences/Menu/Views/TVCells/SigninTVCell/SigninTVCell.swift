//
//  SigninTVCell.swift
//  Safariyati
//
//  Created by FCI on 14/04/24.
//

import UIKit
protocol SigninTVCellDelegate {
    func didTapOnBackBtnnAction(cell:SigninTVCell)
    func didTapOnSigninnBtnAction(cell:SigninTVCell)
    func didTapOnGotoSignupBtnAction(cell:SigninTVCell)
    func editingText(tf:UITextField)
}

class SigninTVCell: TableViewCell {
    
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    var delegate:SigninTVCellDelegate?
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
    
    
    @IBAction func didTapOnSigninnBtnAction(_ sender: Any) {
        delegate?.didTapOnSigninnBtnAction(cell: self)
    }
    
    
    
    @IBAction func didTapOnGotoSignupBtnAction(_ sender: Any) {
        delegate?.didTapOnGotoSignupBtnAction(cell: self)
    }
    
}
