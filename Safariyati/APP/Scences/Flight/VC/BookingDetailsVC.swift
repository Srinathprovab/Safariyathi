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
    
    
    
    
    override func didTapOnRegisterNowOrLoginBtnACtion(cell: GuestLoginButtonsTVCell) {
        commonTableView.reloadData()
    }
    override func didTapOnRegisterNowBtnAction(cell: GuestRegistrationTVCell) {
        print("didTapOnRegisterNowBtnAction")
    }
    override func didTapOnGuestLoginBtnAction(cell: GuestRegistrationTVCell) {
        print("didTapOnGuestLoginBtnAction")
    }
    override func didTapOnLoginBtnAction(cell: GuestRegistrationTVCell) {
        print("didTapOnLoginBtnAction")
    }
    
    
    @IBAction func didTapOnCloseBtnAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnContinuePaymentBtynAction(_ sender: Any) {
        gotoProcessingToPaymentVC()
    }
    
    
    func gotoProcessingToPaymentVC() {
        guard let vc = ProcessingToPaymentVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
    
}


extension BookingDetailsVC {
    
    
    func setupUI() {
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["BDFlightDetailsTVCell",
                                         "GuestRegistrationTVCell",
                                         "GuestLoginButtonsTVCell",
                                         "FareSummaryTVCell",
                                         "TermsAndPrivacyCheckBoxTVCell"])
        
        setupTVcells()
    }
    
    
    func setupTVcells() {
        tablerow.removeAll()
        
        
        tablerow.append(TableRow(title:"",
                                 characterLimit: flightscount,
                                 cellType:.BDFlightDetailsTVCell))
        
        tablerow.append(TableRow(cellType:.GuestLoginButtonsTVCell))
        tablerow.append(TableRow(cellType:.GuestRegistrationTVCell))
        tablerow.append(TableRow(cellType:.FareSummaryTVCell))
        
        
        
        tablerow.append(TableRow(title:"By booking this item, you agree to pay the total amount shown, which includes Service Fees, on the right and to the , User Terms, Privacy policy .",cellType:.TermsAndPrivacyCheckBoxTVCell))
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    
}
