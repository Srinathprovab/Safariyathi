//
//  BookingDetailsVC.swift
//  Safariyati
//
//  Created by FCI on 10/04/24.
//

import UIKit

class BookingDetailsVC: BaseTableVC, BookingDetailsVMDelegate {
   
    
    @IBOutlet weak var holderview: UIView!
    
    static var newInstance: BookingDetailsVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? BookingDetailsVC
        return vc
    }
    
    
    var payload = [String:Any]()
    var tablerow = [TableRow]()
    var bdvm:BookingDetailsVM?
    
    
    override func viewWillAppear(_ animated: Bool) {
        addObserver()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        
        bdvm = BookingDetailsVM(self)
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
        callapibool = false
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
    
    
    func callMobilePreBookingAPI() {
        payload.removeAll()
        payload["search_id"] = selectedsearch_id
        payload["selectedResult"] = selectedselectedResultindex
        payload["booking_source"] = selectedbooking_source
        payload["user_id"] = defaults.string(forKey: UserDefaultsKeys.userid) ?? "0"
        
        bdvm?.CALL_MOBILE_PRE_PROCESS_BOOKING_API(dictParam: payload)
    }
    
    func preprocessBookingDetails(response: BookingDetailsModel) {
        
        holderview.isHidden = false
        DispatchQueue.main.async { [self] in
            setupTVcells()
        }
    }
    
    
    
    func setupUI() {
        holderview.isHidden = true
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["BDFlightDetailsTVCell",
                                         "GuestRegistrationTVCell",
                                         "GuestLoginButtonsTVCell",
                                         "FareSummaryTVCell",
                                         "TermsAndPrivacyCheckBoxTVCell", "ContactInformationTVCell"])
        
       
    }
    
    
    func setupTVcells() {
        tablerow.removeAll()
        
        
        tablerow.append(TableRow(title:"",
                                 characterLimit: flightscount,
                                 cellType:.BDFlightDetailsTVCell))
        
        tablerow.append(TableRow(cellType:.GuestLoginButtonsTVCell))
        tablerow.append(TableRow(cellType:.GuestRegistrationTVCell))
        tablerow.append(TableRow(cellType:.ContactInformationTVCell))
        tablerow.append(TableRow(cellType:.FareSummaryTVCell))
    
        
        tablerow.append(TableRow(title:"By booking this item, you agree to pay the total amount shown, which includes Service Fees, on the right and to the , User Terms, Privacy policy .",cellType:.TermsAndPrivacyCheckBoxTVCell))
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    
}



extension BookingDetailsVC  {
    
    
    func addObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(nointernet), name: Notification.Name("offline"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(resultnil), name: NSNotification.Name("resultnil"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(nointrnetreload), name: Notification.Name("nointrnetreload"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: Notification.Name("reload"), object: nil)
        
        if callapibool == true {
            DispatchQueue.main.async {
                self.callMobilePreBookingAPI()
            }
        }
        
    }
    
    
    @objc func reload() {
        DispatchQueue.main.async {[self] in
            commonTableView.reloadData()
        }
    }
    
    @objc func nointrnetreload() {
        
        DispatchQueue.main.async {
            self.callMobilePreBookingAPI()
        }
    }
    
    //MARK: - resultnil
    @objc func resultnil() {
        guard let vc = NoInternetConnectionVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        vc.key = "noresult"
        self.present(vc, animated: true)
    }
    
    
    //MARK: - nointernet
    @objc func nointernet() {
        
        guard let vc = NoInternetConnectionVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        vc.key = "nointernet"
        self.present(vc, animated: true)
    }
    
    
}
