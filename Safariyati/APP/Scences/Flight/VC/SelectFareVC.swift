//
//  SelectFareVC.swift
//  Safariyati
//
//  Created by FCI on 10/04/24.
//

import UIKit

class SelectFareVC: BaseTableVC {

    static var newInstance: SelectFareVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? SelectFareVC
        return vc
    }
    
    
    var tablerow = [TableRow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    

    @IBAction func didTapOnCloseBtnAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnBookNowBtynAction(_ sender: Any) {
        gotoBookingDetailsVC()
    }
    
    func gotoBookingDetailsVC() {
        guard let vc = BookingDetailsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
    
}


extension SelectFareVC {
    
    func setupUI() {
       
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["SelectFareTVCell"])
        setupTV()
    }
    
    
    func setupTV() {
        tablerow.removeAll()
       
        tablerow.append(TableRow(cellType: .SelectFareTVCell))
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
}
