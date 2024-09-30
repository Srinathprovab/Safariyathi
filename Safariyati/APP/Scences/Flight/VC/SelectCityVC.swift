//
//  SelectCityVC.swift
//  Safariyati
//
//  Created by FCI on 09/04/24.
//

import UIKit

class SelectCityVC: BaseTableVC, AirportCodeListVMDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var searchTF: UITextField!
    
    
    static var newInstance: SelectCityVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? SelectCityVC
        return vc
    }
    
    
    deinit {
        cityList.removeAll()
        tourList.removeAll()
        hotelCityList.removeAll()
        filtered.removeAll()
    }
    
    
    var payload = [String:Any]()
    var citylistvm:AirportCodeListVM?
    var titleString = String()
    var keystring = String()
    var tablerow = [TableRow]()
    var isSearchBool = Bool()
    var searchText = String()
    var filtered:[AirportCodeListModel] = []
    var cityList:[AirportCodeListModel] = []
    var tourList:[TourListData] = []
    var hotelCityList:[HotelCityListModel] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        addObserver()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        
        citylistvm = AirportCodeListVM(self)
    }
    
    
    @IBAction func didTapOnCloseBtnAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    
}

extension SelectCityVC {
    
    func setupUI() {
        
        searchTF.setLeftPaddingPoints(35)
        searchTF.font = .InterRegular(size: 14)
        topView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        topView.layer.cornerRadius = 20
        
        searchTF.becomeFirstResponder()
        
        searchTF.font = UIFont.poppinsRegular(size: 16)
        searchTF.addTarget(self, action: #selector(searchTextChanged(_:)), for: .editingChanged)
        searchTF.delegate = self
        
        
        
        
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["CityInfoTVCell"])
        
    }
    
    
    func setupTV(list:[AirportCodeListModel]) {
        tablerow.removeAll()
        
        
        list.forEach { i in
            tablerow.append(TableRow(key:"flight",moreData:i,cellType:.CityInfoTVCell))
        }
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CityInfoTVCell {
            
            if keystring == "flights" {
                if let journeyType = defaults.string(forKey: UserDefaultsKeys.journeyType),journeyType == "oneway" {
                    if titlelbl.text == "FROM" {
                        defaults.setValue(cell.id, forKey: UserDefaultsKeys.fromlocid)
                        defaults.setValue(cell.fromcity, forKey: UserDefaultsKeys.fromCity)
                        defaults.setValue("\(cell.cityname)", forKey: UserDefaultsKeys.fromcityname)
                        defaults.setValue("\(cell.cityname) (\(cell.code))", forKey: UserDefaultsKeys.fromcitynamewithcode)
                        defaults.setValue("\(cell.airportname)", forKey: UserDefaultsKeys.fromairportname)
                    }else {
                        defaults.setValue(cell.id, forKey: UserDefaultsKeys.tolocid)
                        defaults.setValue(cell.fromcity, forKey: UserDefaultsKeys.toCity)
                        defaults.setValue("\(cell.cityname)", forKey: UserDefaultsKeys.tocityname)
                        defaults.setValue("\(cell.cityname) (\(cell.code))", forKey: UserDefaultsKeys.tocitynamewithcode)
                        defaults.setValue("\(cell.airportname)", forKey: UserDefaultsKeys.toairportname)
                    }
                }else {
                    if titlelbl.text == "FROM" {
                        defaults.setValue(cell.id, forKey: UserDefaultsKeys.fromlocid)
                        defaults.setValue(cell.fromcity, forKey: UserDefaultsKeys.fromCity)
                        defaults.setValue("\(cell.cityname)", forKey: UserDefaultsKeys.fromcityname)
                        defaults.setValue("\(cell.cityname) (\(cell.code))", forKey: UserDefaultsKeys.fromcitynamewithcode)
                        defaults.setValue("\(cell.airportname)", forKey: UserDefaultsKeys.fromairportname)
                    }else {
                        defaults.setValue(cell.id, forKey: UserDefaultsKeys.tolocid)
                        defaults.setValue(cell.fromcity, forKey: UserDefaultsKeys.toCity)
                        defaults.setValue("\(cell.cityname)", forKey: UserDefaultsKeys.tocityname)
                        defaults.setValue("\(cell.cityname) (\(cell.code))", forKey: UserDefaultsKeys.tocitynamewithcode)
                        defaults.setValue("\(cell.airportname)", forKey: UserDefaultsKeys.toairportname)
                    }
                }
                
                
                NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil)
                dismiss(animated: true)
            }else  if keystring == "hotel" {
                
                defaults.setValue(cell.fromcity, forKey: UserDefaultsKeys.locationcity)
                defaults.setValue(cell.id, forKey: UserDefaultsKeys.locationid)
                
                NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil)
                dismiss(animated: true)
                
            }else {
                
                
                defaults.setValue(cell.fromcity, forKey: UserDefaultsKeys.holiday_package_name)
                defaults.setValue(cell.code, forKey: UserDefaultsKeys.holiday_package_id)
                
                NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil)
                //                dismiss(animated: true)
                gotoHolidayDetailsVC()
            }
        }
    }
    
    
    
    func gotoHolidayDetailsVC() {
        callapibool = true
        guard let vc = HolidayDetailsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}




extension SelectCityVC {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if keystring == "holidays" {
            self.setupTourListTVCells(list: self.tourList)
        }else if keystring == "hotel" {
            self.setupHotelCityListTVCells(list: self.hotelCityList)
        }else{
            self.setupTV(list: self.cityList)
        }
    }
    
    @objc func searchTextChanged(_ sender: UITextField) {
        searchText = sender.text ?? ""
        
        
        if keystring == "holidays" {
            
            if searchText == "" {
                callGetToureListData(term: searchText)
            }else {
                callGetToureListData(term: searchText)
            }
        }else if keystring == "hotel" {
            
            if searchText == "" {
                callGetHotelListAPI(term: searchText)
            }else {
                callGetHotelListAPI(term: searchText)
            }
        }else {
            if searchText == "" {
                callGetAirportCodeListAPI(term: searchText)
            }else {
                callGetAirportCodeListAPI(term: searchText)
            }
        }
        
        
    }
    
    
    
    func callGetAirportCodeListAPI(term:String) {
        payload.removeAll()
        payload["term"] = term
        citylistvm?.CallShowCityListAPI(dictParam: payload)
    }
    
    func ShowCityList(response: [AirportCodeListModel]) {
        cityList.removeAll()
        cityList = response
        
        print(response)
        
        DispatchQueue.main.async {
            self.setupTV(list: self.cityList)
        }
        
    }
}


extension SelectCityVC  {
    
    
    func addObserver() {
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(nointernet), name: Notification.Name("offline"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(resultnil), name: NSNotification.Name("resultnil"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(nointrnetreload), name: Notification.Name("nointrnetreload"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: Notification.Name("reload"), object: nil)
        
        
        
        if keystring == "holidays" {
            titlelbl.text = ""
            searchTF.placeholder = "Enter City"
            callGetToureListData(term: "")
        }else if keystring == "hotel" {
            titlelbl.text = ""
            searchTF.placeholder = "Enter City/ Hotel Name"
            callGetHotelListAPI(term: "")
        }else{
            titlelbl.text = titleString
            searchTF.placeholder = "Enter City/Airport Name"
            callGetAirportCodeListAPI(term: "")
        }
    }
    
    
    @objc func reload() {
        commonTableView.reloadData()
    }
    
    @objc func nointrnetreload() {
        callGetAirportCodeListAPI(term: "")
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


extension SelectCityVC {
    
    
    func callGetToureListData(term:String) {
        payload.removeAll()
        payload["term"] = term
        citylistvm?.CALL_GET_TOUR_LIST_API(dictParam: payload)
    }
    
    
    func tourListResponse(response: TourListModel) {
        tourList.removeAll()
        tourList = response.data ?? []
        
        
        
        DispatchQueue.main.async {
            self.setupTourListTVCells(list: self.tourList)
        }
        
    }
    
    func setupTourListTVCells(list:[TourListData]) {
        tablerow.removeAll()
        
        
        tourList.forEach { i in
            tablerow.append(TableRow(key:"holidays",moreData:i,cellType:.CityInfoTVCell))
        }
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    
    
}



extension SelectCityVC {
    
    
    func callGetHotelListAPI(term:String) {
        payload.removeAll()
        payload["term"] = term
        citylistvm?.CALL_GET_CITY_OR_HOTEL_LIST_API(dictParam: payload)
    }
    
    
    func hotelcitylist(response: [HotelCityListModel]) {
        
        hotelCityList.removeAll()
        hotelCityList = response
        
        print(hotelCityList)
        DispatchQueue.main.async {
            self.setupHotelCityListTVCells(list: self.hotelCityList)
        }
        
    }
    
    
    func setupHotelCityListTVCells(list:[HotelCityListModel]) {
        tablerow.removeAll()
        
        
        list.forEach { i in
            tablerow.append(TableRow(key:"hotel",
                                     moreData:i,
                                     cellType:.CityInfoTVCell))
        }
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
}
