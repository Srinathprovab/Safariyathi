//
//  SigninVC.swift
//  Safariyati
//
//  Created by FCI on 14/04/24.
//

import UIKit

class SigninVC: BaseTableVC {
    
    
    static var newInstance: SigninVC? {
        let storyboard = UIStoryboard(name: Storyboard.Menu.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? SigninVC
        return vc
    }
    var tablerow = [TableRow]()
    var email = String()
    var password = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .Buttoncolor
        setupUI()
    }
    

    
    override func didTapOnBackBtnnAction(cell: SigninTVCell) {
        dismiss(animated: true)
       // gotoTabbarVC()
    }
    
    func gotoTabbarVC() {
        guard let vc = TabbarVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.selectedIndex = 0
        present(vc, animated: false)
    }
    
    override func didTapOnSigninnBtnAction(cell: SigninTVCell) {
        if email.isEmpty == true {
            showToast(message: "Enter Email Address")
        }else if email.isValidEmail() == false {
            showToast(message: "Enter Valid Email Address")
        }else if password.isEmpty == true {
            showToast(message: "Enter Password")
        }else {
            print("Call Login API")
        }
    }
    
    override func didTapOnGotoSignupBtnAction(cell: SigninTVCell) {
        gotoSignupVC()
    }
    
    func gotoSignupVC() {
        guard let vc = SignupVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    override func editingText(tf: UITextField) {
        switch tf.tag {
        case 1:
            email = tf.text ?? ""
            break
            
        case 2:
            password = tf.text ?? ""
            break
            
            
            
        default:
            break
        }
    }
    
    
    
    
    
}

extension SigninVC {
    
    func setupUI() {
        commonTableView.backgroundColor = .WhiteColor
        
        commonTableView.registerTVCells(["SigninTVCell"])
        
        
        
        setupTV()
    }
    
    func setupTV() {
        tablerow.removeAll()
        
        
        tablerow.append((TableRow(cellType:.SigninTVCell)))
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    
    
    
    
}



