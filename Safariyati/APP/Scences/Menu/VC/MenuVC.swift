//
//  MenuVC.swift
//  Safariyati
//
//  Created by FCI on 06/04/24.
//

import UIKit

class MenuVC: BaseTableVC {
    
    
    static var newInstance: MenuVC? {
        let storyboard = UIStoryboard(name: Storyboard.Menu.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? MenuVC
        return vc
    }
    var tablerow = [TableRow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .Buttoncolor
        setupUI()
    }
    
    
    
    
    @IBAction func didTapOnLogoutBtnAction(_ sender: Any) {
        print("Logout")
    }
}

extension MenuVC {
    func setupUI() {
        commonTableView.backgroundColor = .WhiteColor
        
        commonTableView.registerTVCells(["MenuBGTVCell",
                                         "MenuTitleTVCell",
                                         "EmptyTVCell"])
        
        
        
        setupTV()
    }
    
    func setupTV() {
        tablerow.removeAll()
        
        
        tablerow.append((TableRow(cellType:.MenuBGTVCell)))
        tablerow.append((TableRow(title:"Flight",
                                  image: "mflight",
                                  cellType:.MenuTitleTVCell)))
        tablerow.append((TableRow(title:"Hotel",
                                  image: "mhotel",
                                  cellType:.MenuTitleTVCell)))
        tablerow.append((TableRow(title:"Holidays",
                                  image: "mholiday",
                                  cellType:.MenuTitleTVCell)))
        tablerow.append((TableRow(title:"Insurance",
                                  image: "minsurence",
                                  cellType:.MenuTitleTVCell)))
        
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? MenuTitleTVCell {
            switch cell.titlelbl.text {
            case "Flight":
                showToast(message: "Flight module not yet implemented")
                break
                
            case "Hotel":
                showToast(message: "Hotel module not yet implemented")
                break
                
            case "Holidays":
                showToast(message: "Holidays module not yet implemented")
                break
                
            case "Insurance":
                showToast(message: "Insurance module not yet implemented")
                break
                
            default:
                break
            }
        }
    }
    
    
}



