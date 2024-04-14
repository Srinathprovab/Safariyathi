//
//  SignupVC.swift
//  Safariyati
//
//  Created by FCI on 14/04/24.
//

import UIKit

class SignupVC: BaseTableVC {
    
    
    static var newInstance: SignupVC? {
        let storyboard = UIStoryboard(name: Storyboard.Menu.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? SignupVC
        return vc
    }
    var tablerow = [TableRow]()
    var email = String()
    var password = String()
    var mobile = String()
    var countrycode = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .Buttoncolor
        setupUI()
    }
    
    
    
    override func editingText(tf: UITextField) {
        switch tf.tag {
        case 1:
            email = tf.text ?? ""
            break
            
        case 2:
            mobile = tf.text ?? ""
            break
            
            
        case 3:
            password = tf.text ?? ""
            break
            
            
        default:
            break
        }
    }
    
    override func didTapOnBackBtnnAction(cell: SignupTVCell) {
        dismiss(animated: true)
    }
    
    override func didTapOnSignupBtnAction(cell: SignupTVCell) {
         if email.isEmpty == true {
            showToast(message: "Enter Email Address")
        }else if email.isValidEmail() == false {
            showToast(message: "Enter Valid Email Address")
        }else if mobile.isEmpty == true {
            showToast(message: "Enter Mobile")
        } else if password.isEmpty == true {
            showToast(message: "Enter Password")
        }else {
            print("Call Signup API")
        }
    }
    
    override func didTapOnGotoSigninBtnAction(cell: SignupTVCell) {
        gotoSigninVC()
    }
    
    func gotoSigninVC() {
        guard let vc = SigninVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
}

extension SignupVC {
    
    func setupUI() {
        commonTableView.backgroundColor = .WhiteColor
        
        commonTableView.registerTVCells(["SignupTVCell"])
        
        
        
        setupTV()
    }
    
    func setupTV() {
        tablerow.removeAll()
        
        
        tablerow.append((TableRow(cellType:.SignupTVCell)))
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    
    
    
    
}



