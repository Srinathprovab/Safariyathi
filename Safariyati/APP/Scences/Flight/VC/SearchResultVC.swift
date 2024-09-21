//
//  SearchResultVC.swift
//  Safariyati
//
//  Created by FCI on 10/04/24.
//

import UIKit

class SearchResultVC: BaseTableVC, FlightSearchVMDelegate, TimerManagerDelegate {
    
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var filterSortView: BorderedView!
    @IBOutlet weak var cityslbl: UILabel!
    @IBOutlet weak var dateslbl: UILabel!
    
    @IBOutlet weak var sessionlbl: UILabel!
    @IBOutlet weak var flightsfoundlbl: UILabel!
    
    static var newInstance: SearchResultVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? SearchResultVC
        return vc
    }
    
    
    var arrayIndex = 0
    var flightlist = [[J_flight_list]]()
    var bsDataArray = [BookingSourceData]()
    var bookingSourceDataArrayCount = Int()
    var flightsearchVM: FlightSearchVM?
    var payload = [String:Any]()
    var tablerow = [TableRow]()
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        addObserver()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        
        MySingleton.shared.delegate = self
        flightsearchVM = FlightSearchVM(self)
    }
    
    
    //MARK: - didTapOnCloseBtnAction
    @IBAction func didTapOnCloseBtnAction(_ sender: Any) {
        // dismiss(animated: true)
        gotoSearchFlightsVC()
    }
    
    
    //MARK: - didTapOnFilterBtnAction didTapOnSortBtnAction
    @IBAction func didTapOnFilterBtnAction(_ sender: Any) {
        print("didTapOnFilterBtnAction")
    }
    
    
    @IBAction func didTapOnSortBtnAction(_ sender: Any) {
        print("didTapOnSortBtnAction")
    }
    
    
    
    //MARK: - SearchResultTVCell Delegate Methods
    override func didTapOnSelectFareBtnAction(cell: SearchResultTVCell) {
        selectedbooking_source_key = cell.bookingsourcekey
        selectedbooking_source = cell.bookingsource
        selectedselectedResultindex = cell.selectedresult
        selected_access_key = cell.selectedaccesskey
        gotoSelectFareVC()
    }
    
    override func didTapOnFlightDetailsBtnAction(cell: SearchResultTVCell) {
        selectedbooking_source = cell.bookingsource
        selectedselectedResultindex = cell.selectedresult
        selected_access_key = cell.selectedaccesskey
        gotoFlightDetailsVC()
    }
    
    override func didTapOnMoreSimilarResults(cell: SearchResultTVCell) {
        guard let vc = SimilarFlightsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.similarflightList = cell.newsimilarList
        present(vc, animated: true)
    }
    
    
    
    
    func gotoFlightDetailsVC() {
        callapibool = true
        guard let vc = FlightDetailsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func gotoSelectFareVC() {
        callapibool = true
        guard let vc = SelectFareVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func gotoSearchFlightsVC() {
        guard let vc = SearchFlightsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    
    
    //MARK: - gotoModifySearchVC
    @IBAction func didTapOnModifySearchBtnAction(_ sender: Any) {
        gotoModifySearchVC()
    }
    
    func gotoModifySearchVC() {
        guard let vc = ModifySearchVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

extension SearchResultVC {
    
    
    func setupUI() {
        
        holderView.isHidden = true
        setuplabels(lbl: sessionlbl, text: "", textcolor: .ApplabelColor, font: .InterMedium(size: 14), align: .left)
        setuplabels(lbl: flightsfoundlbl, text: "", textcolor: .ApplabelColor, font: .InterMedium(size: 14), align: .right)
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["SearchResultTVCell", "EmptyTVCell"])
    }
    
    
    func callActiveBookingSourceAPI() {
        basicloderBool = false
        showLoderScreen()
        flightsearchVM?.CALL_GET_ACTIVE_BOOKING_SOURCE_API(dictParam: [:])
    }
    
    func bookingSourceList(response: ActiveBookingSourceModel) {
        
        bsDataArray = response.data ?? []
        bookingSourceDataArrayCount = response.data?.count ?? 0
        
        
        let seconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {[self] in
            callGetFlightPreSearchAPI()
        }
    }
    
    
    func callGetFlightPreSearchAPI() {
        flightsearchVM?.CALL_PRE_FLIGHT_SEARCH_API(dictParam: flightiputspayload)
    }
    
    
    func flightPresearchResponse(response: FlightPresearchModel) {
        payload.removeAll()
        
        
        
        bsDataArray.forEach { i in
            
            let seconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {[self] in
                callFlightSearch(bookingsource: i.source_id ?? "",
                                 searchid: response.data?[0].search_id ?? 0)
            }
            
        }
        
    }
    
    
    
    func callFlightSearch(bookingsource:String,searchid:Int) {
        payload["search_id"] = "\(searchid)"
        payload["booking_source"] = bookingsource
        flightsearchVM?.CALL_GET_FLIGHT_LIST_API(dictParam: payload)
    }
    
    
    
    func flightListResponse(response: FlightListModel) {
        
       
        selectedsearch_id = response.data?.search_id ?? ""
        
        bookingSourceDataArrayCount -= 1
        
        if let newResults = response.data?.j_flight_list, !newResults.isEmpty {
            // Append the new data to the existing data
            flightlist.append(contentsOf: newResults)
        } else {
            // No more items to load, update UI accordingly
            print("No more items to load.")
            // You can show a message or hide a loading indicator here
        }
        
        if bookingSourceDataArrayCount == 0 {
            
            if flightlist.count <= 0 {
                resultnil()
            }else {
                appendFilterValues(list: flightlist)
            }
        }
        
        
    }
    
    
    func appendFilterValues(list:[[J_flight_list]]) {
        
        basicloderBool = true
        holderView.isHidden = false
        hideLoderScreen()
        
        
        MySingleton.shared.stopTimer()
        MySingleton.shared.startTimer(time: 1500)
        
        
        cityslbl.text = "\(defaults.string(forKey: UserDefaultsKeys.fromcityname) ?? "") - \(defaults.string(forKey: UserDefaultsKeys.tocityname) ?? "")"
        let adultcount = defaults.integer(forKey: UserDefaultsKeys.adultCount)
        let childcount = defaults.integer(forKey: UserDefaultsKeys.childCount)
        let infantcount = defaults.integer(forKey: UserDefaultsKeys.infantsCount)
        let classname = defaults.string(forKey: UserDefaultsKeys.selectClass)
        var labelText = adultcount > 1 ? "\(adultcount) Adults" : "\(adultcount) Adult"
        if childcount > 0 {
            labelText += ",\(childcount) Child"
        }
        if infantcount > 0 {
            labelText += ",\(infantcount) Infant"
        }
        dateslbl.text = "\(labelText) | \(classname ?? "")"
        
        prices.removeAll()
        noofStopsA.removeAll()
        fareTypeA.removeAll()
        airlinesA.removeAll()
        connectingFlightsA.removeAll()
        connectingAirportA.removeAll()
        
        list.forEach { i in
            i.forEach { j in
                
                prices.append("\(j.price?.api_total_display_fare ?? 0.0)")
                j.flight_details?.summary?.forEach({ k in
                   
                        airlinesA.append("\(k.operator_name ?? "") (\(k.operator_code ?? ""))")
                        
                        switch k.no_of_stops {
                        case 0:
                            noofStopsA.append("0 Stop")
                            break
                        case 1:
                            noofStopsA.append("1 Stop")
                            break
                        case 2:
                            noofStopsA.append("1+ Stops")
                            break
                        default:
                            break
                        }
                    })
                   
               
                
                j.flight_details?.details?.forEach({ l in
                    l.forEach { m in
                        connectingFlightsA.append("\(m.operator_name ?? "") (\(m.operator_code ?? ""))")
                        connectingAirportA.append("\( m.destination?.city ?? "") (\(m.destination?.loc ?? ""))")
                    }
                })
            }
        }
        
       
        prices = Array(Set(prices))
        noofStopsA = Array(Set(noofStopsA))
        fareTypeA = Array(Set(fareTypeA))
        airlinesA = Array(Set(airlinesA))
        connectingFlightsA = Array(Set(connectingFlightsA))
        connectingAirportA = Array(Set(connectingAirportA))
        
        
        DispatchQueue.main.async {
            self.setupTVcells(list: list)
        }
    }
    
    
    
    
    func setupTVcells(list:[[J_flight_list]]) {
        tablerow.removeAll()
        
        MySingleton.shared.setAttributedTextnew(str1: "\(list.count) ",
                                                str2: "Flights Found",
                                                lbl: flightsfoundlbl,
                                                str1font: .InterMedium(size: 14),
                                                str2font: .InterMedium(size: 14),
                                                str1Color: .ApplabelColor,
                                                str2Color: .Buttoncolor)
        
        
        var updatedUniqueList: [[J_flight_list]] = []
        updatedUniqueList = getUniqueElements_oneway(inputArray: list)
        
        
        updatedUniqueList.forEach { array in
            array.enumerated().forEach { (itemIndex, j) in
                
                let uniqueID = generateUniqueID(for: arrayIndex, bookingSource: j.booking_source!, itemIndex: itemIndex)
                let similarFlights1 = similar(fare: Double(String(format: "%.2f", j.price?.api_total_display_fare ?? "")) ?? 0.0)
                
                tablerow.append(TableRow(key: "flights",
                                         data: similarFlights1,
                                         key1: uniqueID,
                                         moreData: j,
                                         cellType:.SearchResultTVCell))
                
                
            }
            arrayIndex += 1
            
        }
        
        
        
        tablerow.append((TableRow(height: 60, cellType:.EmptyTVCell)))
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // Hide the filterSortView when scrolling begins
        filterSortView.isHidden = true
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            // Show the filterSortView when scrolling stops
            filterSortView.isHidden = false
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Show the filterSortView when scrolling stops after deceleration
        filterSortView.isHidden = false
    }
}



extension SearchResultVC  {
    
    
    func addObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(nointernet), name: Notification.Name("offline"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(resultnil), name: NSNotification.Name("resultnil"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(nointrnetreload), name: Notification.Name("nointrnetreload"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: Notification.Name("reload"), object: nil)
        
        if callapibool == true {
            DispatchQueue.main.async {
                self.callActiveBookingSourceAPI()
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
            self.callActiveBookingSourceAPI()
        }
    }
    
    //MARK: - resultnil
    @objc func resultnil() {
        hideLoderScreen()
        guard let vc = NoInternetConnectionVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.key = "noresult"
        self.present(vc, animated: true)
    }
    
    
    //MARK: - nointernet
    @objc func nointernet() {
        hideLoderScreen()
        guard let vc = NoInternetConnectionVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.key = "nointernet"
        self.present(vc, animated: true)
    }
    
    //MARK: - updateTimer
    func updateTimer() {
        let totalTime = MySingleton.shared.totalTime
        let minutes =  totalTime / 60
        let seconds = totalTime % 60
        let formattedTime = String(format: "%02d:%02d", minutes, seconds)
        
        
        MySingleton.shared.setAttributedTextnew(str1: "Your Session Expires In : ",
                                                str2: "\(formattedTime)",
                                                lbl: sessionlbl,
                                                str1font: .InterMedium(size: 14),
                                                str2font: .InterMedium(size: 14),
                                                str1Color: .ApplabelColor,
                                                str2Color: .Buttoncolor)
        
        
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


//MARK: - Function to get unique elements based on totalPrice oneway
extension SearchResultVC {
    
    func getUniqueElements_oneway(inputArray: [[J_flight_list]]) -> [[J_flight_list]] {
        var uniqueElements: [[J_flight_list]] = []
        var uniquePrices: Set<String> = []
        
        for array in inputArray {
            var uniqueArray: [J_flight_list] = []
            for item in array {
                if !uniquePrices.contains("\(item.price?.api_total_display_fare ?? 0.0)") {
                    uniquePrices.insert("\(item.price?.api_total_display_fare ?? 0.0)")
                    uniqueArray.append(item)
                }
            }
            if !uniqueArray.isEmpty {
                uniqueElements.append(uniqueArray)
            }
        }
        
        return uniqueElements
    }
    
    
    func getUniqueElements(inputArray: [J_flight_list]) -> [J_flight_list] {
        var uniqueElements: [J_flight_list] = []
        var uniquePrices: Set<String> = []
        
        for item in inputArray {
            if !uniquePrices.contains("\(item.price?.api_total_display_fare ?? 0.0)") {
                uniquePrices.insert("\(item.price?.api_total_display_fare ?? 0.0)")
                uniqueElements.append(item)
            }
        }
        
        return uniqueElements
    }
    
    
    func similar(fare: Double) -> [[J_flight_list]] {
        // Create a dictionary to group flights with the same api_total_display_fare
        var similarFlightsDictionary: [Double: [[J_flight_list]]] = [:]
        
        // Iterate through the FlightList (ensure that FlightList contains the correct data)
        self.flightlist.forEach { flightArray in
            flightArray.forEach { flight in
                if let flightFare = Double(String(format: "%.2f", flight.price?.api_total_display_fare ?? "")) {
                    // Check if the fare is already present in the dictionary
                    if let existingFlights = similarFlightsDictionary[flightFare] {
                        // If it exists, append the current flight to the existing array
                        var updatedFlights = existingFlights
                        updatedFlights.append([flight])
                        similarFlightsDictionary[flightFare] = updatedFlights
                    } else {
                        // If it doesn't exist, create a new array with the current flight
                        similarFlightsDictionary[flightFare] = [[flight]]
                    }
                }
            }
        }
        
        // To access the flights with a specific fare, you can do something like this:
        if let flightsWithFare = similarFlightsDictionary[fare] {
            // flightsWithFare will contain an array of flights with api_total_display_fare equal to the specified fare
            return flightsWithFare
        } else {
            // If no similar flights found for the specified fare, return an empty array
            return []
        }
    }
    
    
    
    func generateUniqueID(for arrayIndex: Int, bookingSource: String, itemIndex: Int) -> String {
        // Prefix for ID: Array index starting from 1
        let prefix = "\(arrayIndex + 1)"
        
        // Booking source part
        let bookingSourcePart = bookingSource
        
        // Suffix for ID: Zero-padded item index starting from 1 within the array
        _ = String(format: "%08d", itemIndex + 1)
        
        // Combine all parts to form the unique ID
        return "\(prefix)\(bookingSourcePart)\((Int(prefix) ?? 0) - 1)"
    }
    
    
}


extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: [Iterator.Element: Bool] = [:]
        return self.filter { seen.updateValue(true, forKey: $0) == nil }
    }
}
