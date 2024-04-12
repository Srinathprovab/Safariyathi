//
//  SelectCityVC.swift
//  Safariyati
//
//  Created by FCI on 09/04/24.
//

import UIKit

class SelectCityVC: BaseTableVC {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var searchTF: UITextField!
    
    
    static var newInstance: SelectCityVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? SelectCityVC
        return vc
    }
    
    var titleString = String()
    var tablerow = [TableRow]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    
    @IBAction func didTapOnCloseBtnAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

extension SelectCityVC {
    
    func setupUI() {
        titlelbl.text = titleString
        searchTF.setLeftPaddingPoints(35)
        searchTF.font = .InterRegular(size: 14)
        topView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        topView.layer.cornerRadius = 20
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["CityInfoTVCell"])
        setupTV()
    }
    
    
    func setupTV() {
        tablerow.removeAll()
        
        for _ in 0...100 {
            tablerow.append(TableRow(cellType:.CityInfoTVCell))
        }
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
}
