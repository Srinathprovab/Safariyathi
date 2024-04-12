//
//  BookingDetailsVC.swift
//  Safariyati
//
//  Created by FCI on 10/04/24.
//

import UIKit

class BookingDetailsVC: BaseTableVC {
    
    static var newInstance: BookingDetailsVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? BookingDetailsVC
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
    
    @IBAction func didTapOnContinuePaymentBtynAction(_ sender: Any) {
        print("didTapOnContinuePaymentBtynAction")
    }
    
    
    override func didTapOnregOrLoginBtnAction(cell:GuestRegistrationTVCell) {
        commonTableView.reloadData()
    }
}


extension BookingDetailsVC {
    
    
    func setupUI() {
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["BDFlightDetailsTVCell",
                                        "GuestRegistrationTVCell",
                                         "TermsAndPrivacyCheckBoxTVCell"])
        
        setupTVcells()
    }
    
    func setupTVcells() {
        tablerow.removeAll()
        
        
        tablerow.append(TableRow(title:"",
                                 characterLimit: flightscount,
                                 cellType:.BDFlightDetailsTVCell))
        
        tablerow.append(TableRow(cellType:.GuestRegistrationTVCell))
        
        tablerow.append(TableRow(title:"By booking this item, you agree to pay the total amount shown, which includes Service Fees, on the right and to the , User Terms, Privacy policy .",cellType:.TermsAndPrivacyCheckBoxTVCell))
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
}
