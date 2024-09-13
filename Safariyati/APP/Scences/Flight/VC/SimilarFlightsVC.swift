//
//  SimilarFlightsVC.swift
//  Safariyati
//
//  Created by Admin on 13/09/24.
//

import UIKit

class SimilarFlightsVC: BaseTableVC {
    
    @IBOutlet weak var titlelbl: UILabel!
    
    
    static var newInstance: SimilarFlightsVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? SimilarFlightsVC
        return vc
    }
    
    
    var similarflightList = [[J_flight_list]]()
    var tablerow = [TableRow]()
    var privousjourneyType = String()
    var arrayIndex = 0
    var isFirstCell = true // Flag to check if it's the first cell
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setuplabels(lbl: titlelbl, text: "", textcolor: .WhiteColor, font: .InterBold(size: 16), align: .center)
        
        
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["SearchResultTVCell",
                                         "EmptyTVCell"])
        
        setupTVCell()
        
    }
    
    
    
    
    override func didTapOnFlightDetailsBtnAction(cell: SearchResultTVCell) {
        selectedbooking_source = cell.bookingsource
        selectedselectedResultindex = cell.selectedresult
        gotoFlightDetailsVC()
    }
    
    override func didTapOnSelectFareBtnAction(cell: SearchResultTVCell) {
        gotoSelectFareVC()
    }
    
    
    
    func gotoFlightDetailsVC() {
        callapibool = true
        guard let vc = FlightDetailsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
    
    
    func gotoSelectFareVC() {
        guard let vc = SelectFareVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
    
    
    
    
    
    @IBAction func didTapOnCloseBtnAction(_ sender: Any) {
        callapibool = false
        dismiss(animated: true)
    }
    
}


extension SimilarFlightsVC {
    
    
    
    
    func setupTVCell() {
        tablerow.removeAll()
        
        titlelbl.text = "\(similarflightList.count - 1) Flights Found"
        
        
       similarflightList.forEach { array in
            array.enumerated().forEach { (itemIndex, j) in
                
                let uniqueID = generateUniqueID(for: arrayIndex, bookingSource: j.booking_source!, itemIndex: itemIndex)
                if isFirstCell {
                    isFirstCell = false // Set to false after first iteration
                } else {
                    tablerow.append(TableRow(key: "similar",
                                             key1: uniqueID,
                                             moreData: j,
                                             cellType:.SearchResultTVCell))
                    
                }
            }
            
            arrayIndex += 1
        }
        
        
        
        tablerow.append(TableRow(height:50,cellType:.EmptyTVCell))
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    
    func generateUniqueID(for arrayIndex: Int, bookingSource: String, itemIndex: Int) -> String {
        // Prefix for ID: Array index starting from 1
        let prefix = "\(arrayIndex + 1)"
        
        // Booking source part
        let bookingSourcePart = bookingSource
        
        // Suffix for ID: Zero-padded item index starting from 1 within the array
        let suffix = String(format: "%08d", itemIndex + 1)
        
        // Combine all parts to form the unique ID
        return "\(prefix)\(bookingSourcePart)\((Int(prefix) ?? 0) - 1)"
    }
    
    
    
}
