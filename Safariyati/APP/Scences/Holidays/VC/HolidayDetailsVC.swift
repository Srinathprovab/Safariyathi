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
    
    deinit {
        res = nil
        itineraryArray.removeAll()
    }
    
    
    var itineraryArray = [Tours_itinerary_dw]()
   
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
    
    
    //MARK: - didTapOnMoreBtnAction  HolidayImagesTVCell
    override func didTapOnMoreBtnAction(cell: HolidayImagesTVCell) {
        print("didTapOnMoreBtnAction")
    }
    
    
    //MARK: - didTapOnExpandViewBtnAction  ToursItineraryTVCell
    override func didTapOnExpandViewBtnAction(cell: ToursItineraryTVCell) {
        reloadToursItineraryTVCell()
    }
    
    func reloadToursItineraryTVCell() {
        if let indexPath = indexPathForToursItineraryTVCell() {
            commonTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    func indexPathForToursItineraryTVCell() -> IndexPath? {
        if let row = tablerow.firstIndex(where: { $0.cellType == .ToursItineraryTVCell }) {
            return IndexPath(row: row, section: 0)
        }
        return nil
    }


    
    
    //MARK: - HolidayDeatilsButtonsTVCell  Delegate Methods
    override func didTapOverviewBtnAction(cell: HolidayDeatilsButtonsTVCell) {
        
    }
    
    override func didTapItineraryBtnAction(cell: HolidayDeatilsButtonsTVCell) {
        setupItineraryTVCells()
    }
    
    override func didTapDatesAndPricesBtnAction(cell: HolidayDeatilsButtonsTVCell) {
        
    }
    
    override func didTapInclusionsBtnAction(cell: HolidayDeatilsButtonsTVCell) {
        
    }
    
    override func didTapTripNotesBtnAction(cell: HolidayDeatilsButtonsTVCell) {
        
    }
    
    override func didTapPostReviewBtnAction(cell: HolidayDeatilsButtonsTVCell) {
        
    }
    
    override func didTapTermsAndConditionsBtnAction(cell: HolidayDeatilsButtonsTVCell) {
        
    }
    
   //MARK: - HolidayAddTravel1ersTVCell Delegate Metghod
    override func didTapOnSendInquiryBtnAction(cell: HolidayAddTravel1ersTVCell) {
        print("didTapOnSendInquiryBtnAction")
    }
    
    
    override func didTapOnTravellerBtnAction(cell: HolidayAddTravel1ersTVCell) {
        reloadHolidayAddTravel1ersTVCell()
    }
    
    func reloadHolidayAddTravel1ersTVCell() {
        if let holidayAddTravel1ersTVCellIndex = tablerow.firstIndex(where: { $0.cellType == .HolidayAddTravel1ersTVCell }) {
            let indexPath = IndexPath(row: holidayAddTravel1ersTVCellIndex, section: 0)
            commonTableView.reloadRows(at: [indexPath], with: .none)
        }
    }
   
    
}


extension HolidayDetailsVC {
    
    func setupUI() {
        backBtn.addTarget(self, action: #selector(didTapOnBackButtonAction), for: .touchUpInside)
        
        commonTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        commonTableView.layer.cornerRadius = 20
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["HolidayImagesTVCell",
                                         "HolidayDeatilsButtonsTVCell",
                                         "ToursItineraryTVCell",
                                         "HolidayAddTravel1ersTVCell",
                                         "EmptyTVCell"])
        
        
        
    }
    
    
    func callGetHolidayDetailsAPI() {
        payload.removeAll()
        payload["tour_id"] = defaults.string(forKey: UserDefaultsKeys.holiday_package_id)
        vm?.CALL_HOLIDAYS_DETAILS_API(dictParam: payload)
    }
    
    
    func tourDetailsResponse(response: TourPackageDetailsModel) {
        
       
        res = response
        itineraryArray = response.tours_itinerary_dw ?? []
        
        DispatchQueue.main.async { [self] in
            setupTVCells()
        }
    }
    
    
    func setupTVCells() {
        tablerow.removeAll()
        
        
        tablerow.append(TableRow(image:res?.tour_data?.banner_image ?? "",
                                 moreData: res?.tour_data?.gallery ?? [],
                                 cellType:.HolidayImagesTVCell))
        
        tablerow.append((TableRow(cellType:.HolidayDeatilsButtonsTVCell)))
        
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


extension HolidayDetailsVC {
    
    func setupItineraryTVCells() {
        tablerow.removeAll()
        
        
        
        tablerow.append(TableRow(image:res?.tour_data?.banner_image ?? "",
                                 moreData: res?.tour_data?.gallery ?? [],
                                 cellType:.HolidayImagesTVCell))
        
        tablerow.append((TableRow(cellType:.HolidayDeatilsButtonsTVCell)))
        
        
        
        for (index,value) in itineraryArray.enumerated() {
            tablerow.append((TableRow(moreData:value,characterLimit: index,cellType:.ToursItineraryTVCell)))
        }
        
        
        tablerow.append((TableRow(title:res?.tour_data?.package_name,cellType:.HolidayAddTravel1ersTVCell)))
        
        tablerow.append((TableRow(height: 100, cellType:.EmptyTVCell)))
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    
    
    
    
}
