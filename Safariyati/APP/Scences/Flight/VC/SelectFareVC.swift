//
//  SelectFareVC.swift
//  Safariyati
//
//  Created by FCI on 10/04/24.
//

import UIKit

class SelectFareVC: BaseTableVC, SelectFareVMDelegate {
    
    
    @IBOutlet weak var holderview: UIView!
    
    static var newInstance: SelectFareVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? SelectFareVC
        return vc
    }
    
    
    var payload = [String:Any]()
    var tablerow = [TableRow]()
    var vm:SelectFareVM?
    
    override func viewWillAppear(_ animated: Bool) {
        addObserver()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        
        vm = SelectFareVM(self)
    }
    
    
    @IBAction func didTapOnCloseBtnAction(_ sender: Any) {
        callapibool = false
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnBookNowBtynAction(_ sender: Any) {
        gotoBookingDetailsVC()
    }
    
    func gotoBookingDetailsVC() {
        guard let vc = BookingDetailsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    //MARK: - didTapOnSelectedFare  AddFareInfoTVCell
    override func didTapOnSelectedFare(cell: AddFareInfoTVCell) {
        selectedfaredata = cell.faredata
        gotoSelectedFareDetailsVC()
    }
    
    
    func gotoSelectedFareDetailsVC() {
        guard let vc = SelectedFareDetailsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}


extension SelectFareVC {
    
    
    func callSelecedFareDetailsAPI() {
       
        holderview.isHidden = true
        payload.removeAll()
        payload["data_access_key"] = selected_access_key
        payload["booking_source"] = selectedbooking_source_key
        payload["search"] = selectedsearch_id
        
        vm?.CALL_SELECTED_FARE_DETAILS_API(dictParam: payload)
    }
    
    
    func selectedFareDetails(response: SelectFareModel) {
        
        holderview.isHidden = false
        faredata.removeAll()
        faredata = response.data ?? []
        
        
        
        DispatchQueue.main.async { [self] in
            setupTV()
        }
    }
    
    func setupUI() {
        
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["SelectFareTVCell"])
        
    }
    
    
    func setupTV() {
        tablerow.removeAll()
        
        tablerow.append(TableRow(cellType: .SelectFareTVCell))
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
}




extension SelectFareVC  {
    
    
    func addObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(nointernet), name: Notification.Name("offline"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(resultnil), name: NSNotification.Name("resultnil"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(nointrnetreload), name: Notification.Name("nointrnetreload"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: Notification.Name("reload"), object: nil)
        
        if callapibool == true {
            DispatchQueue.main.async {
                self.callSelecedFareDetailsAPI()
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
            self.callSelecedFareDetailsAPI()
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
