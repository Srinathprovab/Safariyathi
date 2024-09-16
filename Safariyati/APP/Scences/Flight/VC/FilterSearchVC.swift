//
//  FilterSearchVC.swift
//  BeeoonsApp
//
//  Created by MA673 on 19/08/22.
//

import UIKit

struct FlightFilterModel {
    var minPriceRange: Double?
    var maxPriceRange: Double?
    var noOfStops: [String] = []
    var refundableTypes: [String] = []
    var airlines: [String] = []
    var departureTime: [String] = []
    var arrivalTime: [String] = []
    var noOvernightFlight: [String] = []
    var connectingFlights: [String] = []
    var connectingAirports: [String] = []
    var luggage: [String] = []
    
}


enum SortParameter {
    case PriceHigh
    case PriceLow
    case DurationHigh
    case DurationLow
    case DepartureHigh
    case DepartureLow
    case ArrivalHigh
    case ArrivalLow
    case starLow
    case starHeigh
    case airlineaz
    case airlineza
    case hotelaz
    case hotelza
    case nothing
}

protocol AppliedFilters:AnyObject {
    
    func filtersSortByApplied(sortBy: SortParameter)
    func filterByApplied(minpricerange:Double,
                         maxpricerange:Double,
                         noofstopsFA:[String],
                         departureTimeFilter:[String],
                         arrivalTimeFilter:[String],
                         airlinesFA:[String],
                         cancellationTypeFA:[String],
                         connectingFlightsFA:[String],
                         connectingAirportsFA:[String])
    
   
}



class FilterSearchVC: BaseTableVC {
    
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var sortview: UIView!
    @IBOutlet weak var sortlbl: UILabel!
    @IBOutlet weak var sortul: UIView!
    @IBOutlet weak var sortbtn: UIButton!
    @IBOutlet weak var filterview: UIView!
    @IBOutlet weak var filterlbl: UILabel!
    @IBOutlet weak var filterul: UIView!
    @IBOutlet weak var filterbtn: UIButton!
    @IBOutlet weak var buttonsViewHeight: NSLayoutConstraint!
    
    
    static var newInstance: FilterSearchVC? {
        let storyboard = UIStoryboard(name: Storyboard.Main.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? FilterSearchVC
        return vc
    }
    
    override func viewDidLoad() {
        
    }
    
    //    weak var delegate: AppliedFilters?
    //    var tablerow = [TableRow]()
    //    var departurnTimeArray = ["12 am - 6 am","06 am - 12 pm","12 pm - 06 pm","06 pm - 12 am"]
    //    var hpricesArray = ["Deal","Name"," Star"]
    //    var amenitiesArray = ["Wi-Fi","Breakfast","Parking","Swimming Pool"]
    //    var amenitiesArray1 = ["Others(379)","Others(379)"]
    //    var facilitiesArray = ["Air condition"]
    //
    //    var filterTapKey = String()
    //    var minpricerangefilter = Double()
    //    var maxpricerangefilter = Double()
    //
    //    var noOfStopsFilterArray = [String]()
    //    var refundablerTypeFilteArray = [String]()
    //    var departureTimeFilter = [String]()
    //    var arrivalTimeFilter = [String]()
    //    var airlinesFilterArray = [String]()
    //    var connectingFlightsFilterArray = [String]()
    //    var ConnectingAirportsFilterArray = [String]()
    //
    //
    //    var selectedNeighbourwoodArray = [String]()
    //    var selectednearBylocationsArray = [String]()
    //    var selectedamenitiesArray = [String]()
    //    var selectedStartRatingArray = [String]()
    //
    //
    //    override func viewWillAppear(_ animated: Bool) {
    //        addObserver()
    //    }
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //
    //        // Do any additional setup after loading the view.
    //        setupUI()
    //
    //    }
    //
    //
    //    func setupUI() {
    //        self.view.backgroundColor = .clear
    //        holderView.backgroundColor = .black.withAlphaComponent(0.3)
    //        commonTableView.backgroundColor = .WhiteColor
    //        closeBtn.setTitle("", for: .normal)
    //
    //
    //
    //        sortview.backgroundColor = .WhiteColor
    //        sortul.backgroundColor = .AppNavBackColor
    //        setuplabels(lbl: sortlbl, text: "SORT", textcolor: .AppLabelColor, font: .OpenSansMedium(size: 16), align: .center)
    //        sortbtn.setTitle("", for: .normal)
    //        sortbtn.addTarget(self, action: #selector(didTapOnSortBtnAction(_:)), for: .touchUpInside)
    //
    //
    //        filterview.backgroundColor = .WhiteColor
    //        filterul.backgroundColor = .WhiteColor
    //        setuplabels(lbl: filterlbl, text: "FILTER", textcolor: .AppLabelColor, font: .OpenSansMedium(size: 16), align: .center)
    //        filterbtn.setTitle("", for: .normal)
    //        filterbtn.addTarget(self, action: #selector(didTapOnFilterBtnAction(_:)), for: .touchUpInside)
    //
    //        commonTableView.registerTVCells(["EmptyTVCell",
    //                                         "CheckBoxTVCell",
    //                                         "SliderTVCell",
    //                                         "ButtonTVCell",
    //                                         "SortByPriceTVCell",
    //                                         "StarRatingTVCell"])
    //        if let tabSelected = defaults.string(forKey: UserDefaultsKeys.tabselect) {
    //            if tabSelected == "Flight" {
    //                buttonsView.layer.cornerRadius = 8
    //                buttonsView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    //                buttonsView.clipsToBounds = true
    //                buttonsViewHeight.constant = 50
    //
    //                if filterTapKey == "filter" {
    //                    setupFilterTVCells()
    //                }else {
    //                    setupSortTVCells()
    //                }
    //
    //            }else {
    //                buttonsView.layer.cornerRadius = 8
    //                buttonsView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    //                buttonsView.clipsToBounds = true
    //
    //                if filterTapKey == "filter" {
    //                    setupHotelFilterTVCells()
    //                }else {
    //                    setupHotelSortTVCells()
    //                }
    //            }
    //        }
    //    }
    //
    //
    //
    //    @objc func didTapOnSortBtnAction(_ sender:UIButton) {
    //        filterTapKey = "sort"
    //        sortul.backgroundColor = .AppNavBackColor
    //        filterul.backgroundColor = .WhiteColor
    //
    //
    //        if let tabSelected = defaults.string(forKey: UserDefaultsKeys.tabselect) {
    //            if tabSelected == "Flight" {
    //                sortBy = .nothing
    //                NotificationCenter.default.post(name: NSNotification.Name("sorttap"), object: nil)
    //                setupSortTVCells()
    //            }else {
    //                setupHotelSortTVCells()
    //            }
    //        }
    //    }
    //
    //    @objc func didTapOnFilterBtnAction(_ sender:UIButton) {
    //
    //        filterTapKey = "filter"
    //        sortul.backgroundColor = .WhiteColor
    //        filterul.backgroundColor = .AppNavBackColor
    //
    //        if let tabSelected = defaults.string(forKey: UserDefaultsKeys.tabselect) {
    //            if tabSelected == "Flight" {
    //                setupFilterTVCells()
    //            }else {
    //                setupHotelFilterTVCells()
    //            }
    //        }
    //
    //    }
    //
    //    func setupFilterTVCells() {
    //        tablerow.removeAll()
    //
    //
    //        tablerow.append(TableRow(title:"Prices",cellType:.SliderTVCell))
    //        tablerow.append(TableRow(title:"No Of Stops",data: noofStopsA,cellType:.CheckBoxTVCell))
    //        tablerow.append(TableRow(title:"Departure Time",key:"time", data: departurnTimeArray,cellType:.CheckBoxTVCell))
    //        tablerow.append(TableRow(title:"Arrival Time",key:"time", data: departurnTimeArray,cellType:.CheckBoxTVCell))
    //        tablerow.append(TableRow(title:"Airlines",data: airlinesA,cellType:.CheckBoxTVCell))
    //        tablerow.append(TableRow(title:"Cancellations Type",data: fareTypeA,cellType:.CheckBoxTVCell))
    //        tablerow.append(TableRow(title:"Connecting Flights",data: connectingFlightsA,cellType:.CheckBoxTVCell))
    //        tablerow.append(TableRow(title:"Connecting Airports",data: connectingAirportA,cellType:.CheckBoxTVCell))
    //
    //
    //        tablerow.append(TableRow(height:50,cellType:.EmptyTVCell))
    //        //        tablerow.append(TableRow(title:"Apply",key: "hotel",cellType:.ButtonTVCell))
    //        //        tablerow.append(TableRow(height:50,cellType:.EmptyTVCell))
    //
    //
    //        commonTVData = tablerow
    //        commonTableView.reloadData()
    //
    //    }
    //
    //
    //
    //    func setupSortTVCells() {
    //        tablerow.removeAll()
    //
    //        // tablerow.append(TableRow(height:20,cellType:.EmptyTVCell))
    //        tablerow.append(TableRow(title:"PRICE",subTitle: "Low to high",buttonTitle: "High to low",cellType:.SortByPriceTVCell))
    //        tablerow.append(TableRow(title:"Departure Time",subTitle: "Earlist  flight",buttonTitle: "Latest flight",cellType:.SortByPriceTVCell))
    //        tablerow.append(TableRow(title:"Arrival Time",subTitle: "Earlist  flight",buttonTitle: "Latest flight",cellType:.SortByPriceTVCell))
    //        tablerow.append(TableRow(title:"Duration",subTitle: "Low to high",buttonTitle: "High to low",cellType:.SortByPriceTVCell))
    //        tablerow.append(TableRow(title:"AIRLINE",subTitle: "A-Z",buttonTitle: "Z-A",cellType:.SortByPriceTVCell))
    //
    //
    //        tablerow.append((TableRow(height:30,cellType: .EmptyTVCell)))
    //        //        tablerow.append((TableRow(title:"Apply",key: "btn",cellType: .ButtonTVCell)))
    //        //        tablerow.append((TableRow(height:50,cellType: .EmptyTVCell)))
    //
    //
    //        commonTVData = tablerow
    //        commonTableView.reloadData()
    //    }
    //
    //
    //
    //    func setupHotelFilterTVCells() {
    //
    //        tablerow.removeAll()
    //
    //        tablerow.append(TableRow(title:"Prices",key: "hotel",cellType:.SliderTVCell))
    //        tablerow.append(TableRow(title:"Star Rating",cellType:.StarRatingTVCell))
    //        tablerow.append(TableRow(title:"Refundable Type",data: faretypeArray,cellType:.CheckBoxTVCell))
    //        tablerow.append(TableRow(title:"Hotel Location",data: nearBylocationsArray,cellType:.CheckBoxTVCell))
    //
    //        if facilityArray.isEmpty == false {
    //            tablerow.append(TableRow(title:"Facilities",data: facilityArray,cellType:.CheckBoxTVCell))
    //        }
    //
    //        tablerow.append(TableRow(height:50,cellType:.EmptyTVCell))
    //
    //
    //
    //
    //
    //        commonTVData = tablerow
    //        commonTableView.reloadData()
    //
    //    }
    //
    //
    //    func setupHotelSortTVCells() {
    //        tablerow.removeAll()
    //
    //        tablerow.append(TableRow(title:"Price",
    //                                 subTitle: "Low to high",
    //                                 buttonTitle: "High to low",
    //                                 tempInfo: sortBy,
    //                                 cellType:.SortByPriceTVCell))
    //
    //        tablerow.append(TableRow(title:"Hotel",
    //                                 subTitle: "A-Z",
    //                                 buttonTitle: "Z-A",
    //                                 tempInfo: sortBy,
    //                                 cellType:.SortByPriceTVCell))
    //
    //        tablerow.append((TableRow(height:30,cellType: .EmptyTVCell)))
    //
    //        commonTVData = tablerow
    //        commonTableView.reloadData()
    //
    //    }
    //
    //
    //
    //
    //    override func didTapOnShowSliderBtn(cell: SliderTVCell) {
    //
    //
    //        print("Selected minimum value: \(cell.minValue1)")
    //        print("Selected maximum value: \(cell.maxValue1)")
    //
    //        minpricerangefilter = cell.minValue1
    //        maxpricerangefilter = cell.maxValue1
    //    }
    //
    //
    //
    //    override func didTapOnLowToHeighBtnAction(cell: SortByPriceTVCell) {
    //
    //
    //        if let tabSelected = defaults.string(forKey: UserDefaultsKeys.tabselect) {
    //            if tabSelected == "Flight" {
    //
    //                if cell.titlelbl.text == "PRICE" {
    //                    sortBy = .PriceLow
    //
    //                    if let cell2 = commonTableView.cellForRow(at: IndexPath(item: 1, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell2)
    //                    }
    //
    //                    if let cell3 = commonTableView.cellForRow(at: IndexPath(item: 2, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell3)
    //                    }
    //                    if let cell4 = commonTableView.cellForRow(at: IndexPath(item: 3, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell4)
    //                    }
    //
    //                    if let cell5 = commonTableView.cellForRow(at: IndexPath(item: 4, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell5)
    //                    }
    //                }else if cell.titlelbl.text == "Departure Time" {
    //                    sortBy = .DepartureLow
    //
    //                    if let cell1 = commonTableView.cellForRow(at: IndexPath(item: 0, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell1)
    //                    }
    //
    //                    if let cell3 = commonTableView.cellForRow(at: IndexPath(item: 2, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell3)
    //                    }
    //                    if let cell4 = commonTableView.cellForRow(at: IndexPath(item: 3, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell4)
    //                    }
    //
    //                    if let cell5 = commonTableView.cellForRow(at: IndexPath(item: 4, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell5)
    //                    }
    //                }else if cell.titlelbl.text == "Arrival Time" {
    //                    sortBy = .ArrivalLow
    //                    if let cell1 = commonTableView.cellForRow(at: IndexPath(item: 0, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell1)
    //                    }
    //                    if let cell2 = commonTableView.cellForRow(at: IndexPath(item: 1, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell2)
    //                    }
    //
    //
    //                    if let cell4 = commonTableView.cellForRow(at: IndexPath(item: 3, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell4)
    //                    }
    //
    //                    if let cell5 = commonTableView.cellForRow(at: IndexPath(item: 4, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell5)
    //                    }
    //                }else if cell.titlelbl.text == "Duration" {
    //                    sortBy = .DurationLow
    //
    //                    if let cell1 = commonTableView.cellForRow(at: IndexPath(item: 0, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell1)
    //                    }
    //                    if let cell2 = commonTableView.cellForRow(at: IndexPath(item: 1, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell2)
    //                    }
    //
    //                    if let cell3 = commonTableView.cellForRow(at: IndexPath(item: 2, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell3)
    //                    }
    //
    //                    if let cell5 = commonTableView.cellForRow(at: IndexPath(item: 4, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell5)
    //                    }
    //
    //                }else {
    //                    sortBy = .airlineaz
    //                    if let cell1 = commonTableView.cellForRow(at: IndexPath(item: 0, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell1)
    //                    }
    //                    if let cell2 = commonTableView.cellForRow(at: IndexPath(item: 1, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell2)
    //                    }
    //
    //                    if let cell3 = commonTableView.cellForRow(at: IndexPath(item: 2, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell3)
    //                    }
    //                    if let cell4 = commonTableView.cellForRow(at: IndexPath(item: 3, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell4)
    //                    }
    //
    //                }
    //
    //            }else {
    //
    //
    //                if cell.titlelbl.text == "Price" {
    //                    sortBy = .PriceLow
    //
    //
    //
    //                    if let cell2 = commonTableView.cellForRow(at: IndexPath(item: 1, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell2)
    //                    }
    //
    //                }else if cell.titlelbl.text == "Hotel" {
    //                    sortBy = .hotelaz
    //
    //                    if let cell1 = commonTableView.cellForRow(at: IndexPath(item: 0, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell1)
    //                    }
    //
    //
    //
    //
    //                }
    //
    //            }
    //        }
    //    }
    //
    //    override func didTapOnHeighToLowBtnAction(cell: SortByPriceTVCell) {
    //
    //        if let tabSelected = defaults.string(forKey: UserDefaultsKeys.tabselect) {
    //            if tabSelected == "Flight" {
    //
    //                if cell.titlelbl.text == "PRICE" {
    //                    sortBy = .PriceHigh
    //
    //
    //                    if let cell2 = commonTableView.cellForRow(at: IndexPath(item: 1, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell2)
    //                    }
    //
    //                    if let cell3 = commonTableView.cellForRow(at: IndexPath(item: 2, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell3)
    //                    }
    //                    if let cell4 = commonTableView.cellForRow(at: IndexPath(item: 3, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell4)
    //                    }
    //
    //                    if let cell5 = commonTableView.cellForRow(at: IndexPath(item: 4, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell5)
    //                    }
    //                }else if cell.titlelbl.text == "Departure Time" {
    //                    sortBy = .DepartureHigh
    //
    //                    if let cell1 = commonTableView.cellForRow(at: IndexPath(item: 0, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell1)
    //                    }
    //
    //                    if let cell3 = commonTableView.cellForRow(at: IndexPath(item: 2, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell3)
    //                    }
    //                    if let cell4 = commonTableView.cellForRow(at: IndexPath(item: 3, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell4)
    //                    }
    //
    //                    if let cell5 = commonTableView.cellForRow(at: IndexPath(item: 4, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell5)
    //                    }
    //                }else if cell.titlelbl.text == "Arrival Time" {
    //                    sortBy = .ArrivalHigh
    //                    if let cell1 = commonTableView.cellForRow(at: IndexPath(item: 0, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell1)
    //                    }
    //                    if let cell2 = commonTableView.cellForRow(at: IndexPath(item: 1, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell2)
    //                    }
    //
    //
    //                    if let cell4 = commonTableView.cellForRow(at: IndexPath(item: 3, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell4)
    //                    }
    //
    //                    if let cell5 = commonTableView.cellForRow(at: IndexPath(item: 4, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell5)
    //                    }
    //                }else if cell.titlelbl.text == "Duration" {
    //                    sortBy = .DurationHigh
    //
    //                    if let cell1 = commonTableView.cellForRow(at: IndexPath(item: 0, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell1)
    //                    }
    //                    if let cell2 = commonTableView.cellForRow(at: IndexPath(item: 1, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell2)
    //                    }
    //
    //                    if let cell3 = commonTableView.cellForRow(at: IndexPath(item: 2, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell3)
    //                    }
    //
    //                    if let cell5 = commonTableView.cellForRow(at: IndexPath(item: 4, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell5)
    //                    }
    //
    //                }else {
    //                    sortBy = .airlineza
    //                    if let cell1 = commonTableView.cellForRow(at: IndexPath(item: 0, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell1)
    //                    }
    //                    if let cell2 = commonTableView.cellForRow(at: IndexPath(item: 1, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell2)
    //                    }
    //
    //                    if let cell3 = commonTableView.cellForRow(at: IndexPath(item: 2, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell3)
    //                    }
    //                    if let cell4 = commonTableView.cellForRow(at: IndexPath(item: 3, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell4)
    //                    }
    //
    //                }
    //
    //            }else{
    //
    //
    //                if cell.titlelbl.text == "Price" {
    //                    sortBy = .PriceHigh
    //
    //
    //
    //                    if let cell2 = commonTableView.cellForRow(at: IndexPath(item: 1, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell2)
    //                    }
    //
    //                }else if cell.titlelbl.text == "Hotel" {
    //                    sortBy = .hotelza
    //
    //                    if let cell1 = commonTableView.cellForRow(at: IndexPath(item: 0, section: 0)) as? SortByPriceTVCell {
    //                        resetSortBy(cell: cell1)
    //                    }
    //
    //
    //
    //
    //                }
    //
    //            }
    //        }
    //
    //
    //    }
    //
    //
    //    func resetSortBy(cell:SortByPriceTVCell) {
    //        cell.lowlbl.textColor = .AppLabelColor
    //        cell.lowView.backgroundColor = .WhiteColor
    //        cell.heighlbl.textColor = .AppLabelColor
    //        cell.heightView.backgroundColor = .WhiteColor
    //    }
    //
    //
    //    override func didTapOnCheckBoxDropDownBtn(cell:CheckBoxTVCell){
    //        print("didTapOnCheckBoxDropDownBtn")
    //    }
    //
    //
    //    override func didTapOnShowMoreBtn(cell:CheckBoxTVCell){
    //        print("didTapOnShowMoreBtn")
    //    }
    //
    //
    //    override func didTapOnStarRatingCell(cell: StarRatingCVCell) {
    //        starRatingFilter = cell.titlelbl.text ?? ""
    //        print(startRatingArray.joined(separator: ","))
    //    }
    //
    //
    //
    //    @IBAction func didTapOnCloseBtn(_ sender: Any) {
    //        dismiss(animated: true)
    //    }
    //
    //
    //
    //    override func didTapOnCheckBox(cell:checkOptionsTVCell){
    //
    //        if let tabselect = defaults.object(forKey: UserDefaultsKeys.tabselect) as? String {
    //            if tabselect == "Flight" {
    //
    //                switch cell.filtertitle {
    //                case "No Of Stops":
    //
    //                    if cell.titlelbl.text == "0 Stop" {
    //                        noOfStopsFilterArray.append("0")
    //                    }else if cell.titlelbl.text == "1 Stop" {
    //                        noOfStopsFilterArray.append("1")
    //                    }else {
    //                        noOfStopsFilterArray.append("2")
    //                    }
    //
    //                    print(noOfStopsFilterArray.joined(separator: "---"))
    //                    break
    //
    //
    //
    //                case "Departure Time":
    //                    departureTimeFilter.append(cell.titlelbl.text ?? "")
    //                    break
    //
    //                case "Arrival Time":
    //                    arrivalTimeFilter.append(cell.titlelbl.text ?? "")
    //                    break
    //
    //                case "Cancellations Type":
    //
    //                    refundablerTypeFilteArray.append(cell.titlelbl.text ?? "")
    //                    break
    //
    //                case "Airlines":
    //                    airlinesFilterArray.append(cell.titlelbl.text ?? "")
    //
    //                    break
    //
    //
    //
    //                case "Connecting Flights":
    //                    connectingFlightsFilterArray.append(cell.titlelbl.text ?? "")
    //
    //                    break
    //
    //
    //                case "Connecting Airports":
    //                    ConnectingAirportsFilterArray.append(cell.titlelbl.text ?? "")
    //
    //                    break
    //
    //
    //
    //                default:
    //                    break
    //                }
    //            }else {
    //
    //
    //
    //                switch cell.filtertitle {
    //
    //
    //                case "Refundable Type":
    //                    refundablerTypeFilteArray.append(cell.titlelbl.text ?? "")
    //                    break
    //
    //
    //                case "Hotel Location":
    //                    selectednearBylocationsArray.append(cell.titlelbl.text ?? "")
    //
    //                    break
    //
    //
    //                case "Facilities":
    //                    selectedamenitiesArray.append(cell.titlelbl.text ?? "")
    //
    //                    break
    //
    //
    //
    //
    //                default:
    //                    break
    //                }
    //
    //            }
    //        }
    //
    //
    //
    //
    //    }
    //
    //
    //    override func didTapOnDeselectCheckBox(cell:checkOptionsTVCell){
    //
    //
    //        if let tabselect = defaults.object(forKey: UserDefaultsKeys.tabselect) as? String {
    //            if tabselect == "Flight" {
    //
    //                switch cell.filtertitle {
    //                case "No Of Stops":
    //
    //
    //
    //                    if cell.titlelbl.text == "0 Stop" {
    //                        if let index = noOfStopsFilterArray.firstIndex(of: "0") {
    //                            noOfStopsFilterArray.remove(at: index)
    //                        }
    //                    }else if cell.titlelbl.text == "1 Stop" {
    //                        if let index = noOfStopsFilterArray.firstIndex(of: "1") {
    //                            noOfStopsFilterArray.remove(at: index)
    //                        }
    //                    }else {
    //                        if let index = noOfStopsFilterArray.firstIndex(of: "2") {
    //                            noOfStopsFilterArray.remove(at: index)
    //                        }
    //                    }
    //                    break
    //
    //
    //                case "Departure Time":
    //                    if let index = departureTimeFilter.firstIndex(of: cell.titlelbl.text ?? "") {
    //                        departureTimeFilter.remove(at: index)
    //                    }
    //                    break
    //
    //                case "Arrival Time":
    //                    if let index = arrivalTimeFilter.firstIndex(of: cell.titlelbl.text ?? "") {
    //                        arrivalTimeFilter.remove(at: index)
    //                    }
    //                    break
    //
    //                case "Cancellations Type":
    //
    //                    if let index = refundablerTypeFilteArray.firstIndex(of: cell.titlelbl.text ?? "") {
    //                        refundablerTypeFilteArray.remove(at: index)
    //                    }
    //                    break
    //
    //
    //                case "Airlines":
    //                    if let index = airlinesFilterArray.firstIndex(of: cell.titlelbl.text ?? "") {
    //                        airlinesFilterArray.remove(at: index)
    //                    }
    //                    break
    //
    //
    //                case "Connecting Flights":
    //                    if let index = connectingFlightsFilterArray.firstIndex(of: cell.titlelbl.text ?? "") {
    //                        connectingFlightsFilterArray.remove(at: index)
    //                    }
    //                    break
    //
    //
    //                case "Connecting Airports":
    //                    if let index = ConnectingAirportsFilterArray.firstIndex(of: cell.titlelbl.text ?? "") {
    //                        ConnectingAirportsFilterArray.remove(at: index)
    //                    }
    //                    break
    //
    //
    //
    //                default:
    //                    break
    //                }
    //            }else {
    //                switch cell.filtertitle {
    //
    //
    //
    //                case "Refundable Type":
    //
    //                    if let index = refundablerTypeFilteArray.firstIndex(of: cell.titlelbl.text ?? "") {
    //                        refundablerTypeFilteArray.remove(at: index)
    //                    }
    //                    break
    //
    //
    //
    //
    //                case "Hotel Location":
    //
    //                    if let index = selectednearBylocationsArray.firstIndex(of: cell.titlelbl.text ?? "") {
    //                        selectednearBylocationsArray.remove(at: index)
    //                    }
    //                    break
    //
    //
    //                case "Facilities":
    //
    //                    if let index = selectedamenitiesArray.firstIndex(of: cell.titlelbl.text ?? "") {
    //                        selectedamenitiesArray.remove(at: index)
    //                    }
    //                    break
    //
    //
    //                default:
    //                    break
    //                }
    //            }
    //
    //        }
    //
    //    }
    //
    //
    //    @IBAction func didTapOnFilterApplyBtnAction(_ sender: Any) {
    //
    //        isfilterApplied = true
    //        //  override func btnAction(cell: ButtonTVCell) {
    //
    //        let pricesFloat = prices.compactMap { Float($0) }
    //
    //        if let tabSelected = defaults.string(forKey: UserDefaultsKeys.tabselect) {
    //            if tabSelected == "Flight" {
    //                if filterTapKey == "sort" {
    //                    delegate?.filtersSortByApplied(sortBy: sortBy)
    //                }else {
    //
    //
    //
    //                    if minpricerangefilter != 0.0 {
    //                        filterModel.minPriceRange = minpricerangefilter
    //                    }else {
    //                        filterModel.minPriceRange = Double(pricesFloat.min() ?? 0.0)
    //                    }
    //
    //                    if maxpricerangefilter != 0.0 {
    //                        filterModel.maxPriceRange = maxpricerangefilter
    //                    }else {
    //                        filterModel.maxPriceRange = Double(pricesFloat.max() ?? 0.0)
    //                    }
    //
    //
    //                    if departureTimeFilter.isEmpty == false {
    //                        filterModel.departureTime = departureTimeFilter
    //                    }else {
    //                        filterModel.departureTime.removeAll()
    //                    }
    //
    //                    if arrivalTimeFilter.isEmpty == false {
    //                        filterModel.arrivalTime = arrivalTimeFilter
    //                    }else {
    //                        filterModel.arrivalTime.removeAll()
    //                    }
    //
    //
    //                    if !noOfStopsFilterArray.isEmpty {
    //                        filterModel.noOfStops = noOfStopsFilterArray
    //                    }else {
    //                        filterModel.noOfStops.removeAll()
    //                    }
    //
    //                    if !refundablerTypeFilteArray.isEmpty {
    //                        filterModel.refundableTypes = refundablerTypeFilteArray
    //                    }else {
    //                        filterModel.refundableTypes.removeAll()
    //                    }
    //
    //                    if !airlinesFilterArray.isEmpty {
    //                        filterModel.airlines = airlinesFilterArray
    //                    }else {
    //                        filterModel.airlines.removeAll()
    //                    }
    //
    //                    if !connectingFlightsFilterArray.isEmpty {
    //                        filterModel.connectingFlights = connectingFlightsFilterArray
    //                    }else {
    //                        filterModel.connectingFlights.removeAll()
    //                    }
    //
    //
    //                    if !ConnectingAirportsFilterArray.isEmpty {
    //                        filterModel.connectingAirports = ConnectingAirportsFilterArray
    //                    }else {
    //                        filterModel.connectingAirports.removeAll()
    //                    }
    //
    //
    //
    //
    //                    delegate?.filterByApplied(minpricerange: filterModel.minPriceRange ?? 0.0 ,
    //                                              maxpricerange: filterModel.maxPriceRange ?? 0.0 ,
    //                                              noofstopsFA: filterModel.noOfStops,
    //                                              departureTimeFilter: filterModel.departureTime,
    //                                              arrivalTimeFilter: filterModel.arrivalTime,
    //                                              airlinesFA: filterModel.airlines,
    //                                              cancellationTypeFA: filterModel.refundableTypes,
    //                                              connectingFlightsFA: filterModel.connectingFlights,
    //                                              connectingAirportsFA: filterModel.connectingAirports)
    //
    //
    //
    //                }
    //
    //            }else {
    //
    //
    //                if filterTapKey == "sort" {
    //
    //                    delegate?.filtersSortByApplied(sortBy: sortBy)
    //
    //                }else {
    //
    //                    if minpricerangefilter != 0.0 {
    //                        hotelfiltermodel.minPriceRange = minpricerangefilter
    //                    }else {
    //                        hotelfiltermodel.minPriceRange = Double(pricesFloat.min() ?? 0.0)
    //                    }
    //
    //                    if maxpricerangefilter != 0.0 {
    //                        hotelfiltermodel.maxPriceRange = maxpricerangefilter
    //                    }else {
    //                        hotelfiltermodel.maxPriceRange = Double(pricesFloat.max() ?? 0.0)
    //                    }
    //
    //
    //                    if !starRatingFilter.isEmpty {
    //                        hotelfiltermodel.starRating = starRatingFilter
    //                    }else {
    //                        hotelfiltermodel.starRating = ""
    //                    }
    //
    //
    //
    //                    if !startRatingArray.isEmpty {
    //                        hotelfiltermodel.starRatingNew = startRatingArray
    //                    }else {
    //                        hotelfiltermodel.starRatingNew.removeAll()
    //                    }
    //
    //
    //                    if !refundablerTypeFilteArray.isEmpty {
    //                        hotelfiltermodel.refundableTypes = refundablerTypeFilteArray
    //                    }else {
    //                        hotelfiltermodel.refundableTypes.removeAll()
    //                    }
    //
    //                    if !selectednearBylocationsArray.isEmpty {
    //                        hotelfiltermodel.nearByLocA = selectednearBylocationsArray
    //                    }else {
    //                        hotelfiltermodel.nearByLocA.removeAll()
    //                    }
    //
    //
    //                    if !selectedNeighbourwoodArray.isEmpty {
    //                        hotelfiltermodel.niberhoodA = selectedNeighbourwoodArray
    //                    }else {
    //                        hotelfiltermodel.niberhoodA.removeAll()
    //                    }
    //
    //                    if !selectedamenitiesArray.isEmpty {
    //                        hotelfiltermodel.aminitiesA = selectedamenitiesArray
    //                    }else {
    //                        hotelfiltermodel.aminitiesA.removeAll()
    //                    }
    //
    //
    //                    delegate?.hotelFilterByApplied(minpricerange:  hotelfiltermodel.minPriceRange ?? 0.0,
    //                                                   maxpricerange:  hotelfiltermodel.maxPriceRange ?? 0.0,
    //                                                   starRating:  hotelfiltermodel.starRating,
    //                                                   starRatingNew: startRatingArray,
    //                                                   refundableTypeArray: hotelfiltermodel.refundableTypes,
    //                                                   nearByLocA: hotelfiltermodel.nearByLocA,
    //                                                   niberhoodA: hotelfiltermodel.niberhoodA,
    //                                                   aminitiesA: hotelfiltermodel.aminitiesA)
    //
    //
    //                }
    //
    //            }
    //        }
    //
    //        callapibool = false
    //        dismiss(animated: true)
    //    }
    //
    //
    //
    //
    //    @IBAction func didTapOnResetBtn(_ sender: Any) {
    //
    //
    //        callapibool = false
    //        isfilterApplied = false
    //
    //
    //        if let tabSelected = defaults.string(forKey: UserDefaultsKeys.tabselect) {
    //            if tabSelected == "Flight" {
    //                if filterTapKey == "filter" {
    //                    DispatchQueue.main.async {[self] in
    //                        resetFilter()
    //                    }
    //                }else {
    //
    //                    DispatchQueue.main.async {[self] in
    //                        sortBy = .nothing
    //                        resetFlightSortFilter()
    //                    }
    //                }
    //            }else {
    //
    //                if filterTapKey == "filter" {
    //                    DispatchQueue.main.async {[self] in
    //                        resetHotelFilter()
    //                    }
    //                }else {
    //
    //                    sortBy = .nothing
    //                    // Reload the table view to reflect the changes
    //                    commonTableView.reloadData()
    //
    //                }
    //
    //
    //            }
    //        }
    //    }
    //
    //}
    //
    //
    //extension FilterSearchVC {
    //
    //
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    //        if let cell = tableView.cellForRow(at: indexPath) as? CheckBoxTVCell {
    //
    //            if cell.showbool == true {
    //                cell.expand()
    //                cell.showbool = false
    //            }else {
    //                cell.hide()
    //                cell.showbool = true
    //            }
    //
    //        }else if let cell = tableView.cellForRow(at: indexPath) as? SliderTVCell {
    //            if cell.showbool == true {
    //                cell.expand()
    //                cell.showbool = false
    //            }else {
    //                cell.hide()
    //                cell.showbool = true
    //            }
    //        }
    //
    //        UIView.animate(withDuration: 0.3) {
    //            tableView.performBatchUpdates(nil)
    //        }
    //    }
    //
    //}
    //
    //
    //
    //extension FilterSearchVC {
    //
    //    func resetFilter() {
    //        // Reset all values in the FilterModel
    //
    //        sortBy = .nothing
    //        let pricesFloat = prices.compactMap { Float($0) }
    //
    //        filterModel.minPriceRange = Double(String(format: "%.3f", (pricesFloat.min() ?? prices.compactMap { Float($0) }.min()) ?? 0.0))
    //        filterModel.maxPriceRange = Double(String(format: "%.3f", (pricesFloat.max() ?? prices.compactMap { Float($0) }.max()) ?? 0.0))
    //        if let cell = commonTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? SliderTVCell {
    //            cell.setupUI()
    //        }
    //        minpricerangefilter = filterModel.minPriceRange ?? 0.0
    //        maxpricerangefilter = filterModel.maxPriceRange ?? 0.0
    //
    //
    //        filterModel.noOfStops = []
    //        filterModel.refundableTypes = []
    //        filterModel.airlines = []
    //        filterModel.connectingFlights = []
    //        filterModel.connectingAirports = []
    //        filterModel.luggage.removeAll()
    //        filterModel.noOvernightFlight = []
    //        filterModel.departureTime = []
    //        filterModel.arrivalTime = []
    //
    //        noOfStopsFilterArray.removeAll()
    //        airlinesFilterArray.removeAll()
    //        refundablerTypeFilteArray.removeAll()
    //        connectingFlightsFilterArray.removeAll()
    //        ConnectingAirportsFilterArray.removeAll()
    //        departureTimeFilter.removeAll()
    //        arrivalTimeFilter.removeAll()
    //
    //
    //
    //        // Deselect all cells in your checkOptionsTVCell table view
    //        deselectAllCheckOptionsCells()
    //
    //        // Reload the table view to reflect the changes
    //        commonTableView.reloadData()
    //    }
    //
    //    func deselectAllCheckOptionsCells() {
    //        // Iterate through the table view and deselect all cells
    //        for section in 0..<commonTableView.numberOfSections {
    //            for row in 0..<commonTableView.numberOfRows(inSection: section) {
    //                if let cell = commonTableView.cellForRow(at: IndexPath(row: row, section: section)) as? checkOptionsTVCell {
    //                    cell.unselected()
    //                }
    //            }
    //        }
    //    }
    //
    //
    //    func resetFlightSortFilter() {
    //
    //        if let tabSelected = defaults.string(forKey: UserDefaultsKeys.tabselect) {
    //            if tabSelected == "Flight" {
    //
    //                if let cell1 = commonTableView.cellForRow(at: IndexPath(item: 0, section: 0)) as? SortByPriceTVCell {
    //                    resetSortBy(cell: cell1)
    //                }
    //                if let cell2 = commonTableView.cellForRow(at: IndexPath(item: 1, section: 0)) as? SortByPriceTVCell {
    //                    resetSortBy(cell: cell2)
    //                }
    //
    //                if let cell3 = commonTableView.cellForRow(at: IndexPath(item: 2, section: 0)) as? SortByPriceTVCell {
    //                    resetSortBy(cell: cell3)
    //                }
    //                if let cell4 = commonTableView.cellForRow(at: IndexPath(item: 3, section: 0)) as? SortByPriceTVCell {
    //                    resetSortBy(cell: cell4)
    //                }
    //
    //                if let cell5 = commonTableView.cellForRow(at: IndexPath(item: 4, section: 0)) as? SortByPriceTVCell {
    //                    resetSortBy(cell: cell5)
    //                }
    //
    //
    //            }else {
    //                if let cell1 = commonTableView.cellForRow(at: IndexPath(item: 0, section: 0)) as? SortByPriceTVCell {
    //                    resetSortBy(cell: cell1)
    //                }
    //                if let cell2 = commonTableView.cellForRow(at: IndexPath(item: 1, section: 0)) as? SortByPriceTVCell {
    //                    resetSortBy(cell: cell2)
    //                }
    //            }
    //        }
    //    }
    //
    //
    //}
    //
    //
    //
    //extension FilterSearchVC {
    //
    //    func addObserver() {
    //
    //        if let tabSelected = defaults.string(forKey: UserDefaultsKeys.tabselect) {
    //            if tabSelected == "Flight" {
    //                loadinitiallFlightFilterValues()
    //            }else {
    //                loadinitiallHotelFilterValues()
    //            }
    //        }
    //    }
    //
    //    @objc func resetallFilters() {
    //
    //        DispatchQueue.main.async {
    //            self.resetFilter()
    //        }
    //
    //        DispatchQueue.main.async {
    //            sortBy = .nothing
    //        }
    //
    //    }
    //
    //
    //
    //
    //    func loadinitiallFlightFilterValues(){
    //
    //
    //        if !UserDefaults.standard.bool(forKey: "flightfilteronce") {
    //            resetFilter()
    //            defaults.set(true, forKey: "flightfilteronce")
    //        }
    //
    //
    //        if filterModel.minPriceRange != 0.0 {
    //            minpricerangefilter = filterModel.minPriceRange ?? Double(prices.compactMap { Float($0) }.min()!)
    //        }
    //
    //        if filterModel.maxPriceRange != 0.0 {
    //            maxpricerangefilter = filterModel.maxPriceRange ?? Double(prices.compactMap { Float($0) }.max()!)
    //        }
    //
    //
    //        if !filterModel.refundableTypes.isEmpty {
    //            refundablerTypeFilteArray = filterModel.refundableTypes
    //        }
    //
    //
    //        if !filterModel.departureTime.isEmpty {
    //            departureTimeFilter = filterModel.departureTime
    //        }
    //
    //
    //        if !filterModel.arrivalTime.isEmpty {
    //            arrivalTimeFilter = filterModel.arrivalTime
    //        }
    //
    //        if !filterModel.noOfStops.isEmpty {
    //            noOfStopsFilterArray = filterModel.noOfStops
    //        }
    //
    //
    //        if !filterModel.connectingFlights.isEmpty {
    //            connectingFlightsFilterArray = filterModel.connectingFlights
    //        }
    //
    //
    //        if !filterModel.connectingAirports.isEmpty {
    //            ConnectingAirportsFilterArray = filterModel.connectingAirports
    //        }
    //
    //        if !filterModel.airlines.isEmpty {
    //            airlinesFilterArray = filterModel.airlines
    //        }
    //
    //    }
    //
    //
    //    func loadinitiallHotelFilterValues(){
    //
    //        if !UserDefaults.standard.bool(forKey: "hoteltfilteronce") {
    //            resetHotelFilter()
    //            defaults.set(true, forKey: "hoteltfilteronce")
    //        }
    //
    //
    //        if hotelfiltermodel.minPriceRange != 0.0 {
    //       //     minpricerangefilter = hotelfiltermodel.minPriceRange ?? Double(prices.compactMap { Float($0) }.min()!)
    //            minpricerangefilter = Double(String(format: "%.2f", hotelfiltermodel.minPriceRange ?? Double(prices.compactMap { Float($0) }.min()!))) ?? 0.0
    //
    //        }
    //
    //        if hotelfiltermodel.maxPriceRange != 0.0 {
    //            // maxpricerangefilter = hotelfiltermodel.maxPriceRange ?? Double(prices.compactMap { Float($0) }.max()!)
    //            maxpricerangefilter = Double(String(format: "%.2f", hotelfiltermodel.maxPriceRange ?? Double(prices.compactMap { Float($0) }.max()!))) ?? 0.0
    //        }
    //
    //
    //
    //        if !hotelfiltermodel.refundableTypes.isEmpty {
    //            refundablerTypeFilteArray = hotelfiltermodel.refundableTypes
    //        }
    //
    //        if !hotelfiltermodel.aminitiesA.isEmpty {
    //            selectedamenitiesArray = hotelfiltermodel.aminitiesA
    //        }
    //
    //        if !hotelfiltermodel.nearByLocA.isEmpty {
    //            selectednearBylocationsArray = hotelfiltermodel.nearByLocA
    //        }
    //
    //        if !hotelfiltermodel.niberhoodA.isEmpty {
    //            selectedNeighbourwoodArray = hotelfiltermodel.niberhoodA
    //        }
    //
    //        if !hotelfiltermodel.starRatingNew.isEmpty {
    //            startRatingArray = hotelfiltermodel.starRatingNew
    //        }
    //
    //    }
    //
    //
    //
    //
    //    func resetHotelFilter() {
    //        // Reset all values in the FilterModel
    //
    //        let pricesFloat = prices.compactMap { Float($0) }
    //        hotelfiltermodel.minPriceRange = Double(String(format: "%.3f", (pricesFloat.min() ?? prices.compactMap { Float($0) }.min()) ?? 0.0))
    //        hotelfiltermodel.maxPriceRange = Double(String(format: "%.3f", (pricesFloat.max() ?? prices.compactMap { Float($0) }.max()) ?? 0.0))
    //        if let cell = commonTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? SliderTVCell {
    //            cell.setupUI()
    //        }
    //        minpricerangefilter = hotelfiltermodel.minPriceRange ?? 0.0
    //        maxpricerangefilter = hotelfiltermodel.maxPriceRange ?? 0.0
    //
    //        hotelfiltermodel.refundableTypes.removeAll()
    //        hotelfiltermodel.aminitiesA.removeAll()
    //        hotelfiltermodel.nearByLocA.removeAll()
    //        hotelfiltermodel.niberhoodA.removeAll()
    //        hotelfiltermodel.starRating = ""
    //        hotelfiltermodel.starRatingNew.removeAll()
    //
    //        starRatingFilter = ""
    //        if let cell = commonTableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? StarRatingTVCell {
    //            cell.starratingCV.reloadData()
    //        }
    //
    //        refundablerTypeFilteArray.removeAll()
    //        selectednearBylocationsArray.removeAll()
    //        selectedNeighbourwoodArray.removeAll()
    //        selectedamenitiesArray.removeAll()
    //        startRatingArray.removeAll()
    //
    //        // Deselect all cells in your checkOptionsTVCell table view
    //        deselectAllCheckOptionsCells()
    //
    //        // Reload the table view to reflect the changes
    //        commonTableView.reloadData()
    //    }
    //}
    
}
