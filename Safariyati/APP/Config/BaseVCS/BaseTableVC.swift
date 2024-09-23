//
//  BaseTableVC.swift
//  Clique
//
//  Created by Codebele-03 on 03/06/21.
//

import UIKit
import MaterialComponents

class BaseTableVC: UIViewController, TabselectTVCellDelegate, SearchFlightsTVCellDelagate, SelectTravellerTVCellDelegate, SearchResultTVCellDelegate, SigninTVCellDelegate, SignupTVCellDelegate, MenuBGTVCellDelegate, GuestLoginButtonsTVCellDelegate, GuestRegistrationTVCellDelegate, SearchHotelTVCellDelegate, HotelImagesTVCellDelegate, RoomsTVcellDelegate, BookingHotelDetailsTVCellDelegate, AddDeatilsOfGuestTVCellDelegate, MainRoomTVCellDelegate, ButtonTVCellDelegate, SelectFareTVCellDelegate, AcceptTermsAndConditionTVCellDelegate, AddDeatilsOfTravellerTVCellDelegate, ContactInformationTVCellDelegate, SearchHolidayTVCellDelegate, HolidayImagesTVCellDelegate {
    
    
    
   
    @IBOutlet weak var commonScrollView: UITableView!
    @IBOutlet weak var commonTableView: UITableView!
    @IBOutlet weak var commonTVTopConstraint: NSLayoutConstraint!
    
    var loaderVC: LoderVC?
    var commonTVData = [TableRow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Disable vertical bounce
        commonTableView.bounces = false
        
        self.modalPresentationCapturesStatusBarAppearance = true
        self.navigationController?.navigationBar.isHidden = true
        configureTableView()
        //        self.automaticallyAdjustsScrollViewInsets = false
        
        // Do any additional setup after loading the view.
    }
    
    
    func configureTableView() {
        if commonTableView != nil {
            makeDefaultConfigurationForTable(tableView: commonTableView)
        } else {
            print("commonTableView is nil")
        }
    }
    
    func makeDefaultConfigurationForTable(tableView: UITableView) {
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableFooterView = UIView()
        
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
        } else {
            // Fallback on earlier versions
        }
    }
    
    func serviceCall_Completed_ForNoDataLabel(noDataMessage: String? = nil, data: [Any]? = nil, centerVal:CGFloat? = nil, color: UIColor = HexColor("#182541")) {
        dealWithNoDataLabel(message: noDataMessage, data: data, centerVal: centerVal ?? 2.0, color: color)
    }
    
    func dealWithNoDataLabel(message: String?, data: [Any]?, centerVal: CGFloat = 2.0, color: UIColor = HexColor("#182541")) {
        if commonTableView == nil { return; }
        
        commonTableView.viewWithTag(100)?.removeFromSuperview()
        
        if let message = message, let data = data {
            if data.count == 0 {
                let tableSize = commonTableView.frame.size
                
                let label = UILabel(frame: CGRect(x: 15, y: 15, width: tableSize.width, height: 60))
                label.center = CGPoint(x: (tableSize.width/2), y: (tableSize.height/centerVal))
                label.tag = 100
                label.numberOfLines = 0
                
                label.textAlignment = NSTextAlignment.center
                //                label.font = UIFont.CircularStdMedium(size: 14)
                label.textColor = color
                label.text = message
                
                commonTableView.addSubview(label)
            }
        }
        
    }
    func didtapAddRoomBtn(cell: SearchHotelTVCell) {}
    func btnAction(cell: ButtonTVCell) {}
    func didTapOnDualBtn1(cell: ButtonTVCell) {}
    func didTapOnDualBtn2(cell: ButtonTVCell) {}
    func didTaponBookNow(cell: MainRoomTVCell) {}
    func didTapOnMoreBtnAction(cell: HotelImagesTVCell) {}
    func didtaponSearchBtn(cell: SearchHotelTVCell) {}
    func didTaponMenuBtnAction(cell: TabselectTVCell) {}
    func didTapOnSelectCurrencyBtnAction(cell: TabselectTVCell) {}
    func didTapOnFlightBtnAction(cell: TabselectTVCell) {}
    func didTapOnHotelBtnAction(cell: TabselectTVCell) {}
    func didTapOnHolidaysBtnAction(cell: TabselectTVCell) {}
    func didTapOnInsurenceBtnAction(cell: TabselectTVCell) {}
    
    func didTapOnOnewayBtnAction(cell: SearchFlightsTVCell) {}
    func didTapOnRoundtripBtnAction(cell: SearchFlightsTVCell) {}
    func didTapOnSelectFromCityBtnAction(cell:SearchFlightsTVCell) {}
    func didTapOnSelectToCityBtnAction(cell:SearchFlightsTVCell) {}
    func didTapOnAddTravellerBtnAction(cell:SearchFlightsTVCell) {}
    func didTapOnSearchFlightsBtnAction(cell:SearchFlightsTVCell) {}
    func donedatePicker(cell: SearchFlightsTVCell) {}
    func cancelDatePicker(cell: SearchFlightsTVCell) {}
    func didTapOnDepartureBtnAction(cell:SearchFlightsTVCell) {}
    func didTapOnReturnBtnAction(cell:SearchFlightsTVCell) {}
    
    func didTapOnCloseTravellerBtnAction(cell: SelectTravellerTVCell) {}
    func didTapOnSelectFareBtnAction(cell: SearchResultTVCell) {}
    func didTapOnFlightDetailsBtnAction(cell: SearchResultTVCell) {}
    func didTapOnMoreSimilarResults(cell: SearchResultTVCell) {}
    
   
    
    func didTapOnBackBtnnAction(cell: SignupTVCell) {}
    func didTapOnSignupBtnAction(cell: SignupTVCell) {}
    func didTapOnGotoSigninBtnAction(cell: SignupTVCell) {}
    func didTapOnBackBtnnAction(cell: SigninTVCell) {}
    func didTapOnSigninnBtnAction(cell: SigninTVCell) {}
    func didTapOnGotoSignupBtnAction(cell: SigninTVCell) {}
    func editingText(tf: UITextField) {}
    func didTapOnLoginBtnAction(cell: MenuBGTVCell) {}
    
    func didTapOnRegisterNowOrLoginBtnACtion(cell: GuestLoginButtonsTVCell) {}
    func didTapOnRegisterNowBtnAction(cell: GuestRegistrationTVCell) {}
    func didTapOnGuestLoginBtnAction(cell: GuestRegistrationTVCell) {}
    func didTapOnLoginBtnAction(cell: GuestRegistrationTVCell) {}
    
    
    // hotel
    func didTapOnExpandAdultViewbtnAction(cell: AddDeatilsOfGuestTVCell) {}
    func tfeditingChanged(tf: UITextField) {}
    func didTapOnTitleBtnAction(cell: AddDeatilsOfGuestTVCell) {}
    func didTapOnMrBtnAction(cell: AddDeatilsOfGuestTVCell) {}
    func didTapOnMrsBtnAction(cell: AddDeatilsOfGuestTVCell) {}
    func didTapOnVoucherBtn(cell: BookingHotelDetailsTVCell) {}
    func didTapOnRoomsBtn(cell: RoomsTVcell) {}
    func didTapOnHotelsDetailsBtn(cell: RoomsTVcell) {}
    func didTapOnAmenitiesBtn(cell: RoomsTVcell) {}
    func didTapOnSelectedFare(cell: AddFareInfoTVCell) {}
    
    func didTapOnExpandAdultViewbtnAction(cell: AddDeatilsOfTravellerTVCell) {}
    func didTapOnTitleBtnAction(cell: AddDeatilsOfTravellerTVCell) {}
    func donedatePicker(cell: AddDeatilsOfTravellerTVCell) {}
        func cancelDatePicker(cell: AddDeatilsOfTravellerTVCell) {}
    func didTapOnSelectIssuingCountryBtn(cell: AddDeatilsOfTravellerTVCell) {}
    func didTapOnFlyerProgramBtnAction(cell: AddDeatilsOfTravellerTVCell) {}
    func didTapOnTAndCAction(cell: AcceptTermsAndConditionTVCell) {}
    func didTapOnPrivacyPolicyAction(cell: AcceptTermsAndConditionTVCell) {}
    func didTapOnCountryCodeBtn(cell: ContactInformationTVCell) {}
    func editingTextField(tf: UITextField) {}
    func didTapOnDropDownBtn(cell: ContactInformationTVCell) {}
    func didTapOnSearchTravellingtoBtnAction(cell: SearchHolidayTVCell) {}
    func didTapOnViewAllHolidaysBtnAction(cell: SearchHolidayTVCell) {}
    func didTapOnSearchHoliodaysBtnAction(cell: SearchHolidayTVCell) {}
    func didTapOnMoreBtnAction(cell: HolidayImagesTVCell) {}
    
    
   

}

extension BaseTableVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = commonTVData[indexPath.row].height
        
        if let height = height {
            return height
        }
        
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
    
}
extension BaseTableVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == commonTableView {
            return commonTVData.count
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var commonCell: TableViewCell!
        
        var data: TableRow?
        var commonTV = UITableView()
        
        if tableView == commonTableView {
            data = commonTVData[indexPath.row]
            commonTV = commonTableView
        }
        
        
        if let cellType = data?.cellType {
            switch cellType {
                
                //Sign & SignUp Cells
                
                
            case .EmptyTVCell:
                let cell: EmptyTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .TabselectTVCell:
                let cell: TabselectTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
            case .BestFlightTVCell:
                let cell: BestFlightTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .TopDestinationsTVCell:
                let cell: TopDestinationsTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .MenuBGTVCell:
                let cell: MenuBGTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
            case .MenuTitleTVCell:
                let cell: MenuTitleTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .CityInfoTVCell:
                let cell: CityInfoTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .SearchFlightsTVCell:
                let cell: SearchFlightsTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
            case .SelectTravellerTVCell:
                let cell: SelectTravellerTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
            case .CabinClassTVCell:
                let cell: CabinClassTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .SearchResultTVCell:
                let cell: SearchResultTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
            case .AddFlightltineraryTVCell:
                let cell: AddFlightltineraryTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .BaggageTVCell:
                let cell: BaggageTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .ExchangeOrRefundTVCell:
                let cell: ExchangeOrRefundTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .SelectFareTVCell:
                let cell: SelectFareTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
            case .BDFlightDetailsTVCell:
                let cell: BDFlightDetailsTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .GuestRegistrationTVCell:
                let cell: GuestRegistrationTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
            case .TermsAndPrivacyCheckBoxTVCell:
                let cell: TermsAndPrivacyCheckBoxTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .NoteTVCell:
                let cell: NoteTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .SigninTVCell:
                let cell: SigninTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
            case .SignupTVCell:
                let cell: SignupTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
                
            case .GuestLoginButtonsTVCell:
                let cell: GuestLoginButtonsTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
            case .FareSummaryTVCell:
                let cell: FareSummaryTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .PassengerDetailsTVCell:
                let cell: PassengerDetailsTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .BookingReceiptTVCell:
                let cell: BookingReceiptTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
        // Hotel
                
            case .SearchHotelTVCell:
                let cell: SearchHotelTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
            case .HotelResultTVCell:
                let cell: HotelResultTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .HotelImagesTVCell:
                let cell: HotelImagesTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
            case .RoomsTVcell:
                let cell: RoomsTVcell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
            case .HotelCheckinInfoTVCell:
                let cell: HotelCheckinInfoTVCell = commonTV.dequeTVCell(indexPath: indexPath)
//                cell.delegate = self
                commonCell = cell
                
                
            case .NewRoomDetailsTVCell:
                let cell: NewRoomDetailsTVCell = commonTV.dequeTVCell(indexPath: indexPath)
//                cell.delegate = self
                commonCell = cell
                
            case .MainRoomTVCell:
                let cell: MainRoomTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
            case .AmentiesTVCell:
                let cell: AmentiesTVCell = commonTV.dequeTVCell(indexPath: indexPath)
//                cell.delegate = self
                commonCell = cell
                
            case .HotelDetailsTVCell:
                let cell: HotelDetailsTVCell = commonTV.dequeTVCell(indexPath: indexPath)
//                cell.delegate = self
                commonCell = cell
                
            case .BookingHotelDetailsTVCell:
                let cell: BookingHotelDetailsTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
            case .AddDeatilsOfGuestTVCell:
                let cell: AddDeatilsOfGuestTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
            case .UserSpecificationOptionsTVCell:
                let cell: UserSpecificationOptionsTVCell = commonTV.dequeTVCell(indexPath: indexPath)
//                cell.delegate = self
                commonCell = cell
                
                
            case .UserSpecificationTVCell:
                let cell: UserSpecificationTVCell = commonTV.dequeTVCell(indexPath: indexPath)
//                cell.delegate = self
                commonCell = cell
                
            case .ContactInformationTVCell:
                let cell: ContactInformationTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
            case .NewHotelPriceSummeryTVCell:
                let cell: NewHotelPriceSummeryTVCell = commonTV.dequeTVCell(indexPath: indexPath)
//                cell.delegate = self
                commonCell = cell
                
            case .TotalNoofTravellerTVCell:
                let cell: TotalNoofTravellerTVCell = commonTV.dequeTVCell(indexPath: indexPath)
//                cell.delegate = self
                commonCell = cell
                
                
            case .ButtonTVCell:
                let cell: ButtonTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
            case .AcceptTermsAndConditionTVCell:
                let cell: AcceptTermsAndConditionTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
            case .AddDeatilsOfTravellerTVCell:
                let cell: AddDeatilsOfTravellerTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
                
            case .FareFamilyTVCell:
                let cell: FareFamilyTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .FareBaggageTVCells:
                let cell: FareBaggageTVCells = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
                
            case .FareBreakdownTVCell:
                let cell: FareBreakdownTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
       
                
            case .SearchHolidayTVCell:
                let cell: SearchHolidayTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
                
            case .HolidaysSearchResultTVCell:
                let cell: HolidaysSearchResultTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                commonCell = cell
                
            case .HolidayImagesTVCell:
                let cell: HolidayImagesTVCell = commonTV.dequeTVCell(indexPath: indexPath)
                cell.delegate = self
                commonCell = cell
                
                
            default:
                print("handle this case in getCurrentCellAt")
            }
        }
        
        commonCell.cellInfo = data
        commonCell.indexPath = indexPath
        commonCell.selectionStyle = .none
        
        return commonCell
    }
}



extension UITableView {
    func registerTVCells(_ classNames: [String]) {
        for className in classNames {
            register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
        }
    }
    
    func dequeTVCell<T: UITableViewCell>(indexPath: IndexPath, osVersion: String? = nil) -> T {
        let className = String(describing: T.self) + "\(osVersion ?? "")"
        guard let cell = dequeueReusableCell(withIdentifier: className, for: indexPath) as? T  else { fatalError("Couldn’t get cell with identifier \(className)") }
        return cell
    }
    
    func dequeTVCellForFooter<T: UITableViewCell>() -> T {
        let className = String(describing: T.self)
        guard let cell = dequeueReusableCell(withIdentifier: className) as? T  else { fatalError("Couldn’t get cell with identifier \(className)") }
        return cell
    }
    
    
    
    func isLast(for indexPath: IndexPath) -> Bool {
        
        let indexOfLastSection = numberOfSections > 0 ? numberOfSections - 1 : 0
        let indexOfLastRowInLastSection = numberOfRows(inSection: indexOfLastSection) - 1
        
        return indexPath.section == indexOfLastSection && indexPath.row == indexOfLastRowInLastSection
    }
    
}


//MARK: Loder Child View
//extension BaseTableVC {
//
//
//    func setupLoaderVC() {
//        // Instantiate LoderVC from the storyboard
//        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
//        loaderVC = storyboard.instantiateViewController(withIdentifier: "LoderVC") as? LoderVC
//        addChild(loaderVC!)
//
//        // Set the frame or constraints for the child view controller's view
//        loaderVC?.view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
//
//        // Add the child view controller's view to the parent view controller's view
//        view.addSubview(loaderVC!.view)
//
//        // Notify the child view controller that it has been added
//        loaderVC?.didMove(toParent: self)
//    }
//
//    // Function to remove the child view controller
//    func removeLoader() {
//        loaderVC?.willMove(toParent: nil)
//        loaderVC?.view.removeFromSuperview()
//        loaderVC?.removeFromParent()
//    }
//
//    // Function to show the loader
//    func showLoadera() {
//        setupLoaderVC()
//    }
//
//    // Function to hide the loader
//    func hideLoadera() {
//        removeLoader()
//    }
//}



//MARK: Loder Child View
extension BaseTableVC {
    
    
    func setupLoaderVC() {
        // Instantiate LoderVC from the storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace "Main" with your storyboard name
        loaderVC = storyboard.instantiateViewController(withIdentifier: "LoderVC") as? LoderVC
        addChild(loaderVC!)
        
        // Set the frame or constraints for the child view controller's view
        loaderVC?.view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
        
        // Add the child view controller's view to the parent view controller's view
        view.addSubview(loaderVC!.view)
        
        // Notify the child view controller that it has been added
        loaderVC?.didMove(toParent: self)
    }
    
    // Function to remove the child view controller
    func removeLoader() {
       // loaderVC?.stopGifAnimation()
        loaderVC?.stopGifAnimation()
        loaderVC?.willMove(toParent: nil)
        loaderVC?.view.removeFromSuperview()
        loaderVC?.removeFromParent()
        loaderVC = nil // Set loaderVC to nil to ensure deallocation
    }

    
    // Function to show the loader
    func showLoderScreen() {
        setupLoaderVC()
    }
    
    // Function to hide the loader
    func hideLoderScreen() {
        removeLoader()
    }
}
