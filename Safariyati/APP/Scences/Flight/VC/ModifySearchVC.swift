//
//  ModifySearchVC.swift
//  Safariyati
//
//  Created by FCI on 11/04/24.
//

import UIKit

class ModifySearchVC: BaseTableVC {
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    
    static var newInstance: ModifySearchVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? ModifySearchVC
        return vc
    }
    
    var tablerow = [TableRow]()
    
    
    //MARK: - Loading Functions
    override func viewWillAppear(_ animated: Bool) {
        addObserver()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    
    //MARK: - setupUI
    func setupUI() {
        
        setupOneWay()
        backBtn.addTarget(self, action: #selector(didTapOnBackButtonAction), for: .touchUpInside)
        commonTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        commonTableView.layer.cornerRadius = 20
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["SearchFlightsTVCell"])
        
        setupTV()
    }
    
    @objc func didTapOnBackButtonAction() {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func didTapOnOnewayBtnAction(cell: SearchFlightsTVCell) {
        setupOneWay()
    }
    
    override func didTapOnRoundtripBtnAction(cell: SearchFlightsTVCell) {
        setupRoundTrip()
    }
    
    
    func setupOneWay() {
        defaults.setValue("oneway", forKey: UserDefaultsKeys.journeyType)
        commonTableView.reloadData()
    }
    
    func setupRoundTrip() {
        defaults.setValue("circle", forKey: UserDefaultsKeys.journeyType)
        commonTableView.reloadData()
    }
    
    
    override func didTapOnSelectFromCityBtnAction(cell:SearchFlightsTVCell) {
        gotoSelectCityVC(str: "FROM")
    }
    
    
    override func didTapOnSelectToCityBtnAction(cell:SearchFlightsTVCell) {
        gotoSelectCityVC(str: "TO")
    }
    
    override func didTapOnAddTravellerBtnAction(cell:SearchFlightsTVCell) {
        gotoAddTravellerVC()
    }
    
    override func didTapOnSearchFlightsBtnAction(cell:SearchFlightsTVCell) {
        
        flightiputspayload.removeAll()
        flightiputspayload["trip_type"] = defaults.string(forKey: UserDefaultsKeys.journeyType)
        flightiputspayload["adult"] = defaults.string(forKey: UserDefaultsKeys.adultCount)
        flightiputspayload["child"] = defaults.string(forKey: UserDefaultsKeys.childCount)
        flightiputspayload["infant"] = defaults.string(forKey: UserDefaultsKeys.infantsCount)
        flightiputspayload["v_class"] = defaults.string(forKey: UserDefaultsKeys.selectClass)
        flightiputspayload["from"] = defaults.string(forKey: UserDefaultsKeys.fromCity)
        flightiputspayload["from_loc_id"] = defaults.string(forKey: UserDefaultsKeys.fromlocid)
        flightiputspayload["to"] = defaults.string(forKey: UserDefaultsKeys.toCity)
        flightiputspayload["to_loc_id"] = defaults.string(forKey: UserDefaultsKeys.tolocid)
        flightiputspayload["depature"] = defaults.string(forKey: UserDefaultsKeys.calDepDate)
        flightiputspayload["return"] = defaults.string(forKey: UserDefaultsKeys.calRetDate)
        flightiputspayload["out_jrn"] = "All Times"
        flightiputspayload["ret_jrn"] = "All Times"
        flightiputspayload["direct_flight"] = ""
        flightiputspayload["psscarrier"] = ""
        flightiputspayload["search_flight"] = "Search"
        flightiputspayload["user_id"] = defaults.string(forKey: UserDefaultsKeys.userid) ?? "0"
        flightiputspayload["search_source"] = "Postman"
        flightiputspayload["currency"] = defaults.string(forKey: UserDefaultsKeys.selectedCurrency) ?? "KWD"
        
        
        let journeyType = defaults.string(forKey: UserDefaultsKeys.journeyType)
        let from = defaults.string(forKey: UserDefaultsKeys.fromCity)
        let to = defaults.string(forKey: UserDefaultsKeys.toCity)
        let dep = defaults.string(forKey: UserDefaultsKeys.calDepDate)
        let ret = defaults.string(forKey: UserDefaultsKeys.calRetDate)
        
        
        
        if journeyType == "oneway" {
            if from == "Origin" || from == nil{
                showToast(message: "Select From Location")
            }else if to == "Destination" || to == nil{
                showToast(message: "Select To Location")
            }else if dep == "Add Date" || dep == nil{
                showToast(message: "Select Departure Date")
            }else {
                gotoSearchResultVC()
            }
        }else {
            if from == "Origin" || from == nil{
                showToast(message: "Select From Location")
            }else if to == "Destination" || to == nil{
                showToast(message: "Select To Location")
            }else if dep == "Add Date" || dep == nil{
                showToast(message: "Select Departure Date")
            }else if ret == "Add Date" || ret == nil{
                showToast(message: "Select Return Date")
            }else {
                gotoSearchResultVC()
            }
        }
        
        
        
    }
    
    func gotoSelectCityVC(str:String) {
        guard let vc = SelectCityVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func gotoAddTravellerVC() {
        guard let vc = AddTravellerVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
    
    func gotoSearchResultVC() {
        callapibool = true
        guard let vc = SearchResultVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
    
    
    //MARK: - donedatePicker cancelDatePicker
    override func donedatePicker(cell:SearchFlightsTVCell){
        
        let journyType = defaults.string(forKey: UserDefaultsKeys.journeyType)
        if journyType == "oneway" {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            defaults.set(formatter.string(from: cell.depDatePicker.date), forKey: UserDefaultsKeys.calDepDate)
            
        }else {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            
            
            if cell.departureTF.isFirstResponder == true {
                defaults.set(formatter.string(from: cell.depDatePicker.date), forKey: UserDefaultsKeys.calDepDate)
                defaults.set(formatter.string(from: cell.depDatePicker.date), forKey: UserDefaultsKeys.calRetDate)
                
                cell.retDatePicker.minimumDate = cell.depDatePicker.date
            }else {
                defaults.set(formatter.string(from: cell.depDatePicker.date), forKey: UserDefaultsKeys.calDepDate)
                defaults.set(formatter.string(from: cell.retDatePicker.date), forKey: UserDefaultsKeys.calRetDate)
                
            }
        }
        
        commonTableView.reloadData()
        self.view.endEditing(true)
    }
    
    override func cancelDatePicker(cell:SearchFlightsTVCell){
        self.view.endEditing(true)
    }
    
    
}


extension ModifySearchVC {
    
    func setupTV() {
        tablerow.removeAll()
        tablerow.append(TableRow(cellType:.SearchFlightsTVCell))
        commonTVData = tablerow
        commonTableView.reloadData()
    }
}



extension ModifySearchVC {
    func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: Notification.Name("reload"), object: nil)
    }
    
    
    @objc func reload() {
        commonTableView.reloadData()
    }
}

//extension SearchFlightsVC: UIViewControllerTransitioningDelegate {
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return SlideInFromLeftTransitionAnimator() // Use SlideInFromLeftTransitionAnimator for presenting from left to right
//    }
//
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return SlideInFromRightTransitionAnimator() // Use SlideInFromRightTransitionAnimator for dismissing from right to left
//    }
//}
