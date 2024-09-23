//
//  HolidayDetailsVC.swift
//  Safariyati
//
//  Created by Admin on 23/09/24.
//

import UIKit

class HolidayDetailsVC: BaseTableVC, TourPackageDetailsVMDelegate {
    
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    
    
    static var newInstance: HolidayDetailsVC? {
        let storyboard = UIStoryboard(name: Storyboard.Holidays.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? HolidayDetailsVC
        return vc
    }
    
    var tablerow = [TableRow]()
    var payload = [String:Any]()
    var vm:TourPackageDetailsVM?
    
    override func viewWillAppear(_ animated: Bool) {
        addObserver()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        vm = TourPackageDetailsVM(self)
    }
    
    
    
    
    
    //MARK: - didTapOnBackButtonAction
    @objc func didTapOnBackButtonAction() {
        callapibool = false
        dismiss(animated: true, completion: nil)
    }
    
    
    
    //MARK: - SearchHolidayTVCell Delegate Methods
    override func didTapOnSearchTravellingtoBtnAction(cell: SearchHolidayTVCell) {
        gotoSelectCityVC(str: "holidays")
    }
    
    override func didTapOnViewAllHolidaysBtnAction(cell: SearchHolidayTVCell) {
        gotoTourListResultsVC()
    }
    
    override func didTapOnSearchHoliodaysBtnAction(cell: SearchHolidayTVCell) {
        print("didTapOnSearchHoliodaysBtnAction")
    }
    
    func gotoSelectCityVC(str:String) {
        guard let vc = SelectCityVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.titleString = str
        vc.keystring = "holidays"
        present(vc, animated: true)
    }
    
    func gotoTourListResultsVC() {
        callapibool = true
        guard let vc = TourListResultsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    
    
    override func didTapOnMoreBtnAction(cell: HolidayImagesTVCell) {
        print("didTapOnMoreBtnAction")
    }
    
}


extension HolidayDetailsVC {
    
    func setupUI() {
        backBtn.addTarget(self, action: #selector(didTapOnBackButtonAction), for: .touchUpInside)
        
        commonTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        commonTableView.layer.cornerRadius = 20
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["HolidayImagesTVCell"
                                         ,"EmptyTVCell"])
        
        
        
    }
    
    
    func callGetHolidayDetailsAPI() {
        payload.removeAll()
        payload["tour_id"] = defaults.string(forKey: UserDefaultsKeys.holiday_package_id)
        vm?.CALL_HOLIDAYS_DETAILS_API(dictParam: payload)
    }
    
    
    func tourDetailsResponse(response: TourPackageDetailsModel) {
    
        
        DispatchQueue.main.async { [self] in
            setupTVCells(res: response)
        }
    }
    
    
    
    
    
    
    func setupTVCells(res:TourPackageDetailsModel) {
        tablerow.removeAll()
        
        
        tablerow.append(TableRow(image:res.tour_data?.banner_image ?? "",
                                 moreData: res.tour_data?.gallery ?? [],
                                 cellType:.HolidayImagesTVCell))
        
        tablerow.append((TableRow(height: 30, cellType:.EmptyTVCell)))
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
}



extension HolidayDetailsVC  {
    
    
    func addObserver() {
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(nointernet), name: Notification.Name("offline"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(resultnil), name: NSNotification.Name("resultnil"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(nointrnetreload), name: Notification.Name("nointrnetreload"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: Notification.Name("reload"), object: nil)
        
        
        if callapibool == true {
            callGetHolidayDetailsAPI()
        }
        
        
    }
    
    
    @objc func reload() {
        DispatchQueue.main.async {[self] in
            commonTableView.reloadData()
        }
    }
    
    @objc func nointrnetreload() {
        
        DispatchQueue.main.async {[self] in
            commonTableView.reloadData()
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
