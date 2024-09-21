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
    
    
    
    var payload = [String:Any]()
    var citylistvm:AirportCodeListVM?
    var titleString = String()
    var tablerow = [TableRow]()
    var isSearchBool = Bool()
    var searchText = String()
    var filtered:[AirportCodeListModel] = []
    var cityList:[AirportCodeListModel] = []
    
    
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
        titlelbl.text = titleString
        searchTF.setLeftPaddingPoints(35)
        searchTF.font = .InterRegular(size: 14)
        topView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        topView.layer.cornerRadius = 20
        
        searchTF.becomeFirstResponder()
        searchTF.placeholder = "Enter City/Airport Name"
        searchTF.font = UIFont.poppinsRegular(size: 16)
        searchTF.addTarget(self, action: #selector(searchTextChanged(_:)), for: .editingChanged)
        searchTF.delegate = self
        
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["CityInfoTVCell"])
        
    }
    
    
    
    
    
    func setupTV(list:[AirportCodeListModel]) {
        tablerow.removeAll()
        
        
        list.forEach { i in
            tablerow.append(TableRow(moreData:i,cellType:.CityInfoTVCell))
        }
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CityInfoTVCell {
            
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
        }
    }
}




extension SelectCityVC {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.setupTV(list: self.cityList)
    }
    
    @objc func searchTextChanged(_ sender: UITextField) {
        searchText = sender.text ?? ""
        
        
        if searchText == "" {
            callGetAirportCodeListAPI(term: searchText)
        }else {
            callGetAirportCodeListAPI(term: searchText)
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
        
        
        callGetAirportCodeListAPI(term: "")
        
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
