//
//  ViewFlightDetailsVC.swift
//  Safariyati
//
//  Created by Admin on 26/09/24.
//

import UIKit

class ViewFlightDetailsVC: BaseTableVC, FlightDetailsVMDelegate, TimerManagerDelegate {
    
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var tabsHolderView: UIView!
    @IBOutlet weak var flightItineraryBtn: UIButton!
    @IBOutlet weak var baggageInoBtn: UIButton!
    @IBOutlet weak var exchangeBtn: UIButton!
    
    static var newInstance: ViewFlightDetailsVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? ViewFlightDetailsVC
        return vc
    }
    
    
    var tablerow = [TableRow]()
    var fdvm:FlightDetailsVM?
    var payload = [String:Any]()
    var flightdetails = [[FlightDetails]]()
    var Baggagedetails = [Baggage_details]()
    
    
    deinit {
        flightdetails.removeAll()
        Baggagedetails.removeAll()
        cancelationcharges = nil
        changecharges = nil
        bagdata.removeAll()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        addObserver()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        MySingleton.shared.delegate = self
        fdvm = FlightDetailsVM(self)
    }
    
    func setupUI() {
        
        tabsHolderView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabsHolderView.layer.cornerRadius = 20
        flightItineraryBtn.layer.cornerRadius = 4
        baggageInoBtn.layer.cornerRadius = 4
        exchangeBtn.layer.cornerRadius = 4
        
        
        
        
        commonTableView.registerTVCells(["AddFlightltineraryTVCell",
                                         "BaggageTVCell",
                                         "ExchangeOrRefundTVCell",
                                         "EmptyTVCell",
                                         "NoteTVCell"])
        
        
    }
    
    
    
    
    
    @IBAction func didTapOnCloseBtnAction(_ sender: Any) {
        callapibool = false
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnFlightItienarayBtnAction(_ sender: Any) {
        setupItienaryBtn()
    }
    
    
    @IBAction func didTapOnBaggageInfoBtnAction(_ sender: Any) {
        setupBaggageInfo()
    }
    
    
    @IBAction func didTapOnExchangeBtnAction(_ sender: Any) {
        exchangeBtnView()
    }
    
    
    func setupItienaryBtn() {
        flightItineraryBtn.backgroundColor = .Buttoncolor
        flightItineraryBtn.setTitleColor(.WhiteColor, for: .normal)
        
        baggageInoBtn.backgroundColor = .TxtFldbgColor
        baggageInoBtn.setTitleColor(.TitleColor, for: .normal)
        
        exchangeBtn.backgroundColor = .TxtFldbgColor
        exchangeBtn.setTitleColor(.TitleColor, for: .normal)
        setupFlightItienaryTVCell()
    }
    
    func setupBaggageInfo() {
        flightItineraryBtn.backgroundColor = .TxtFldbgColor
        flightItineraryBtn.setTitleColor(.TitleColor, for: .normal)
        
        baggageInoBtn.backgroundColor = .Buttoncolor
        baggageInoBtn.setTitleColor(.WhiteColor, for: .normal)
        
        exchangeBtn.backgroundColor = .TxtFldbgColor
        exchangeBtn.setTitleColor(.TitleColor, for: .normal)
        setupBaggageTVCell()
    }
    
    func exchangeBtnView() {
        flightItineraryBtn.backgroundColor = .TxtFldbgColor
        flightItineraryBtn.setTitleColor(.TitleColor, for: .normal)
        
        baggageInoBtn.backgroundColor = .TxtFldbgColor
        baggageInoBtn.setTitleColor(.TitleColor, for: .normal)
        
        exchangeBtn.backgroundColor = .Buttoncolor
        exchangeBtn.setTitleColor(.WhiteColor, for: .normal)
        setupExchangeTVCell()
    }
    
    
    @IBAction func didTapOnBookNowBtynAction(_ sender: Any) {
        gotoBookingDetailsVC()
    }
    
    func gotoBookingDetailsVC() {
        callapibool = true
        guard let vc = BookingDetailsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
}


extension ViewFlightDetailsVC {
    
    
    func callGetFlightDetailsAPI(){
        payload.removeAll()
        
        
        payload["search_id"] = selectedsearch_id
        payload["selectedResultindex"] = selectedselectedResultindex
        payload["user_id"] = defaults.string(forKey: UserDefaultsKeys.userid) ?? "0"
        payload["booking_source"] = selectedbooking_source
        
        fdvm?.CALL_GET_FLIGHT_DETAILS_API(dictParam: payload)
    }
    
    func flightDetailsRespons(response: FlightDetailsModel) {
        holderView.isHidden = false
        flightdetails.removeAll()
        Baggagedetails.removeAll()
        cancelationcharges = nil
        changecharges = nil
        bagdata.removeAll()
        
        flightdetails = response.flightDetails ?? [[]]
        Baggagedetails = response.baggage_details ?? []
        cancelationcharges = response.cancellation
        changecharges = response.changecharges
        bagdata = response.bag_data ?? []
        
        
        DispatchQueue.main.async {
            self.setupItienaryBtn()
        }
        
        
    }
    
    
    func setupFlightItienaryTVCell() {
        tablerow.removeAll()
        
        
        
        for (_,value) in flightdetails.enumerated() {
            
            tablerow.append(TableRow(moreData: value,
                                     cellType: .AddFlightltineraryTVCell))
        }
        
        commonTVData = tablerow
        commonTableView.reloadData()
        
        
    }
    
    
    func setupBaggageTVCell() {
        tablerow.removeAll()
        
        
        //        Baggagedetails.forEach { i in
        //            tablerow.append(TableRow(moreData: i,
        //                                     cellType: .BaggageTVCell))
        //        }
        
        bagdata.forEach { i in
            tablerow.append(TableRow(moreData: i,
                                     cellType: .BaggageTVCell))
        }
        
        
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
        
        
    }
    
    
    func setupExchangeTVCell() {
        tablerow.removeAll()
        
        tablerow.append((TableRow(height: 10, cellType:.EmptyTVCell)))
        
        tablerow.append(TableRow(title:"Cancellation Charges :",
                                 key: "cancellation",
                                 cellType: .ExchangeOrRefundTVCell))
        
        tablerow.append((TableRow(height: 20, cellType:.EmptyTVCell)))
        
        tablerow.append(TableRow(title:"Exchange Charges :",
                                 key: "change",
                                 cellType: .ExchangeOrRefundTVCell))
        
        //   tablerow.append(TableRow(title:"AHT Charges :",
        //                           cellType: .ExchangeOrRefundTVCell))
        
        
         tablerow.append(TableRow(cellType: .NoteTVCell))
        
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
        
        
    }
    
}



extension ViewFlightDetailsVC  {
    
    
    func addObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(nointernet), name: Notification.Name("offline"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(resultnil), name: NSNotification.Name("resultnil"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(nointrnetreload), name: Notification.Name("nointrnetreload"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: Notification.Name("reload"), object: nil)
        
        if callapibool == true {
            holderView.isHidden = true
            DispatchQueue.main.async {
                self.callGetFlightDetailsAPI()
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
            self.callGetFlightDetailsAPI()
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
    
    
    //MARK: - updateTimer
    func updateTimer() {
        
    }
    
    
    func timerDidFinish() {
        gotoPopupScreen()
    }
    
    func gotoPopupScreen() {
        guard let vc = PopupVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
}

