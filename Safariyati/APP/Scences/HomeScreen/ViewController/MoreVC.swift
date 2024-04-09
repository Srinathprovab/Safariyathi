//
//  MoreVC.swift
//  Safariyati
//
//  Created by FCI on 09/04/24.
//

import UIKit

class MoreVC: BaseTableVC {
    
    
    @IBOutlet weak var topheadderView: UIView!
    
    static var newInstance: MoreVC? {
        let storyboard = UIStoryboard(name: Storyboard.Main.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? MoreVC
        return vc
    }
    
    
    var tablerow = [TableRow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    
    
    
}

extension MoreVC {
    func setupUI() {
        topheadderView.applyGradient(colors: [HexColor("#0095DA"), HexColor("#04587E")])
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["MenuTitleTVCell",
                                         "EmptyTVCell"])
        
        
        setupTV()
    }
    
    func setupTV() {
        tablerow.removeAll()
        
        
        
        tablerow.append((TableRow(title:"About Us",
                                  key:"more",
                                  cellType:.MenuTitleTVCell)))
        
        tablerow.append((TableRow(title:"Privacy And Policy",
                                  key:"more",
                                  cellType:.MenuTitleTVCell)))
        
        tablerow.append((TableRow(title:"Contact Us",
                                  key:"more",
                                  cellType:.MenuTitleTVCell)))
        
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? MenuTitleTVCell {
            switch cell.titlelbl.text {
            case "About Us":
                gotoMoreDetailsVC(str: "About Us")
                break
                
                
            case "Privacy And Policy":
                gotoMoreDetailsVC(str: "Privacy And Policy")
                break
                
            case "Contact Us":
                gotoMoreDetailsVC(str: "Contact Us")
                break
                
            default:
                break
            }
        }
    }
    
    
    func gotoMoreDetailsVC(str:String) {
        guard let vc = MoreDetailsVC.newInstance.self else {return}
        present_or_dismiss_vc.shared.fromRight(view: view)
        vc.modalPresentationStyle = .fullScreen
        vc.titleString = str
        present(vc, animated: false)
    }
    
    
}



