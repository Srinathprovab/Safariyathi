//
//  AddTravellerVC.swift
//  Safariyati
//
//  Created by FCI on 10/04/24.
//

import UIKit

class AddTravellerVC: BaseTableVC {
    
    @IBOutlet weak var doneBTN: UIButton!
    
    @IBOutlet weak var topconstraint: NSLayoutConstraint!
    static var newInstance: AddTravellerVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? AddTravellerVC
        return vc
    }
    
    var titleString = String()
    var tablerow = [TableRow]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    
   
    
    @IBAction func didTapOnDoneBtnAction(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil)
        dismiss(animated: true)
    }
    
    override func didTapOnCloseTravellerBtnAction(cell: SelectTravellerTVCell) {
        dismiss(animated: true)
    }
    
    
}

extension AddTravellerVC {
    
    func setupUI() {
        if screenHeight < 750 {
            topconstraint.constant = 150
        }else {
            topconstraint.constant = 300
        }
        
        
        self.view.backgroundColor = .black.withAlphaComponent(0.5)
        doneBTN.layer.cornerRadius = 6
        commonTableView.isScrollEnabled = false
        commonTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        commonTableView.layer.cornerRadius = 20
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["SelectTravellerTVCell",
                                         "CabinClassTVCell"])
        
        setupTV()
    }
    
    
    func setupTV() {
        tablerow.removeAll()
        
        
        tablerow.append(TableRow(cellType:.SelectTravellerTVCell))
        tablerow.append(TableRow(cellType:.CabinClassTVCell))
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
}


