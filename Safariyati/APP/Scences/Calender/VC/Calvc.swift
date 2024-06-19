//
//  Calvc.swift
//  BabSafar
//
//  Created by FCI on 14/06/23.
//

import UIKit
import JTAppleCalendar

class Calvc: UIViewController {
    
    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var currentSelectedDatelbl: UILabel!
    @IBOutlet weak var okbtn: UIButton!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var leftbtn: UIButton!
    
    
    
    static var newInstance: Calvc? {
        let storyboard = UIStoryboard(name: Storyboard.Calender.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? Calvc
        return vc
    }
    
    var titleStr: String?
    var selectedfirstDate : Date?
    var selectedlastDate : Date?
    let df = DateFormatter()
    var selectedDays: Date?
    let grayView = UIView()
    var btnDoneActionBool = Bool()
    var calstartDate = String()
    var calendDate = String()
    var celltag = Int()
    var depDay = String()
    var retDay = String()
    var isvcfrom = ""
    
    let currentDate = Date()
    let calendar = Calendar.current
    lazy var startDate: Date = {
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: Date())
        return startOfDay
    }()
    
    lazy var endDate: Date = {
        let calendar = Calendar.current
        let endOfMonth = calendar.date(byAdding: .year, value: 1, to: Date())!.endOfMonth
        return endOfMonth
    }()
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        callapibool = false
    }
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        
        self.celltag = Int(defaults.string(forKey: UserDefaultsKeys.cellTag) ?? "0") ?? 0
        NotificationCenter.default.addObserver(self, selector: #selector(nointernet), name: Notification.Name("nointernet"), object: nil)
        
      
        
        let lastdateselected = defaults.string(forKey: UserDefaultsKeys.calDepDate) ?? ""
        if !lastdateselected.isEmpty {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            if let lastSelectedDate = dateFormatter.date(from: lastdateselected) {
                DispatchQueue.main.async {
                    self.calendarView.scrollToDate(lastSelectedDate, animateScroll: false)
                }
            }
        } else {
            DispatchQueue.main.async {
                self.calendarView.scrollToDate(Date(), animateScroll: false)
            }
        }

        
        
        
        let calDepDate = defaults.string(forKey: UserDefaultsKeys.calDepDate) ?? ""
        let calRetDate = defaults.string(forKey: UserDefaultsKeys.calRetDate) ?? ""
        calstartDate = calDepDate
        calendDate = calRetDate
        
        guard let journeyType = defaults.string(forKey: UserDefaultsKeys.journeyType) else {
            return
        }
        if journeyType == "oneway" {
            
            
            currentSelectedDatelbl.text = MySingleton.shared.convertDateFormat(inputDate: calstartDate, f1: "dd-MM-yyyy", f2: "MMM dd, yyyy")
        }else {
            currentSelectedDatelbl.text = "\(MySingleton.shared.convertDateFormat(inputDate: calstartDate, f1: "dd-MM-yyyy", f2: "MMM dd, yyyy")) - \(MySingleton.shared.convertDateFormat(inputDate: calendDate, f1: "dd-MM-yyyy", f2: "MMM dd, yyyy"))"
        }
        
        
    }
    
    
    
    
    //MARK: - nointernet
    @objc func nointernet() {
        // Your nointernet method implementation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupViews(v: UIView, radius: CGFloat, color: UIColor) {
        v.backgroundColor = color
        v.layer.cornerRadius = radius
        v.clipsToBounds = true
        v.layer.borderWidth = 0.5
        v.layer.borderColor = UIColor.BorderColor.cgColor
    }
    
    func setupLabels(lbl: UILabel, text: String, textcolor: UIColor, font: UIFont) {
        lbl.text = text
        lbl.textColor = textcolor
        lbl.font = font
    }
    
    func setupUI() {
        self.view.backgroundColor = .black.withAlphaComponent(0.70)
        okbtn.layer.cornerRadius = 4
        topview.layer.cornerRadius = 20
        topview.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        setupCalView()
    }
    
    func setupCalView() {
        calendarView.scrollDirection = .horizontal
        calendarView.scrollingMode = .stopAtEachSection
        calendarView.showsHorizontalScrollIndicator = false
        
        calendarView.scrollToDate(Date(), animateScroll: false)
        
        calendarView.register(UINib(nibName: "calendarCVCell", bundle: nil), forCellWithReuseIdentifier: "calendarCVCell")
        calendarView.isRangeSelectionUsed = true
        
        calendarView.ibCalendarDelegate = self
        calendarView.ibCalendarDataSource = self
        calendarView.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        calendarView.minimumLineSpacing = 10
        calendarView.minimumInteritemSpacing = 10
        
        calendarView.visibleDates { (visibleDates) in
            self.setupMonthLabel(date: visibleDates.monthDates.first?.date ?? Date())
        }
        
        let panGensture = UILongPressGestureRecognizer(target: self, action: #selector(didStartRangeSelecting(gesture:)))
        panGensture.minimumPressDuration = 0.5
        calendarView.addGestureRecognizer(panGensture)
        let tabselect = defaults.string(forKey: UserDefaultsKeys.tabselect)
        if tabselect == "Flights" {
            let journyType = defaults.string(forKey: UserDefaultsKeys.journeyType)
            if journyType == "oneway" {
                calendarView.allowsMultipleSelection = false
            } else if journyType == "circle" {
                calendarView.allowsMultipleSelection = true
            } else {
                calendarView.allowsMultipleSelection = false
            }
        }
    }
    
    @objc func didStartRangeSelecting(gesture: UITapGestureRecognizer) {
        let point = gesture.location(in: gesture.view!)
        let rangeSelectedDates = calendarView.selectedDates
        
        guard let cellState = calendarView.cellStatus(at: point) else { return }
        
        if !rangeSelectedDates.contains(cellState.date) {
            let dateRange = calendarView.generateDateRange(from: rangeSelectedDates.first ?? cellState.date, to: cellState.date)
            calendarView.selectDates(dateRange, keepSelectionIfMultiSelectionAllowed: true)
        }
    }
    
    func setupMonthLabel(date: Date) {
        monthLabel.text = date.monthYearName
    }
    
    func handleConfiguration(cell: JTAppleCell?, cellState: CellState) {
        guard let cell = cell as? calendarCVCell else { return }
        
        handleCellColor(cell: cell, cellState: cellState)
        handleCellSelected(cell: cell, cellState: cellState)
    }
    
    func handleCellColor(cell: calendarCVCell, cellState: CellState) {
        let today = Date()
        
        if cellState.dateBelongsTo == .thisMonth {
            if cellState.date >= today && cellState.date <= endDate{
                cell.label.textColor = UIColor.black
                cell.isUserInteractionEnabled = true
            } else {
                cell.label.textColor = UIColor.lightGray
                cell.isUserInteractionEnabled = false
            }
        } else {
            cell.label.textColor = UIColor.lightGray
            cell.isUserInteractionEnabled = false
        }
        
        
       
        
    }
    
    func handleCellSelected(cell: calendarCVCell, cellState: CellState) {
        cell.selectedView.isHidden = !cellState.isSelected
        
//        if cellState.isSelected {
//            cell.selectedView.backgroundColor = UIColor.Buttoncolor
//            cell.label.textColor = UIColor.white
//        } else {
//            cell.selectedView.backgroundColor = UIColor.clear
//            cell.label.textColor = UIColor.black
//        }
        
        
      
        
        
        cell.selectedView.layer.cornerRadius = cell.selectedView.frame.width / 2
        cell.clipsToBounds = true
        
        
        
        switch cellState.selectedPosition() {
        case .left:
            //            cell.selectedView.layer.cornerRadius = 3
            //            cell.selectedView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
            //            cell.selectedView.isHidden = false
            cell.selectedView.backgroundColor = UIColor.Buttoncolor
            cell.label.textColor = UIColor.white
        case .middle:
            //            cell.selectedView.layer.cornerRadius = 3
            //            cell.selectedView.layer.maskedCorners = []
            //            cell.selectedView.isHidden = false
            cell.selectedView.backgroundColor = UIColor.Buttoncolor.withAlphaComponent(0.3)
            cell.label.textColor = UIColor.TitleColor.withAlphaComponent(0.4)
        case .right:
            //            cell.selectedView.layer.cornerRadius = 3
            //            cell.selectedView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
            //            cell.selectedView.isHidden = false
            cell.selectedView.backgroundColor = UIColor.Buttoncolor
            cell.label.textColor = UIColor.white
        case .full:
            //            cell.selectedView.layer.cornerRadius = 3
            //            cell.selectedView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
            //            cell.selectedView.isHidden = false
            cell.selectedView.backgroundColor = UIColor.Buttoncolor
            cell.label.textColor = UIColor.white
        default: break
        }
        
        
    }
    
    @IBAction func leftButtonClick(_ sender: Any) {
        calendarView.scrollToSegment(.previous)
    }
    
    @IBAction func rightButtonClick(_ sender: Any) {
        calendarView.scrollToSegment(.next)
    }
    
    @IBAction func didTapOnBackButton(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func selectDateBtnAction(_ sender: Any) {
        if let selectedTab = defaults.string(forKey: UserDefaultsKeys.tabselect) {
            if selectedTab == "Flights" {
                if let journeyType = defaults.string(forKey: UserDefaultsKeys.journeyType) {
                    if journeyType == "oneway" {
                        if calstartDate == "" {
                            showToast(message: "Please Select Date")
                        } else {
                            defaults.set(calstartDate, forKey: UserDefaultsKeys.calDepDate)
                            gotoSearchFlightsVC()
                        }
                    } else if journeyType == "circle" {
                        if calstartDate == "" && calendDate == "" {
                            showToast(message: "Please Select Dates")
                        } else if calstartDate == calendDate {
                            showToast(message: "Please Select Multiple Dates")
                        } else {
                            defaults.set(calstartDate, forKey: UserDefaultsKeys.calDepDate)
                            defaults.set(calendDate, forKey: UserDefaultsKeys.calRetDate)
                            gotoSearchFlightsVC()
                        }
                    } else {
                        // Handle other journey types
                    }
                }
            }
        }
    }
    
    
    func gotoSearchFlightsVC() {
        NotificationCenter.default.post(name: Notification.Name("reload"), object: nil)
        dismiss(animated: false)
    }
    
    
}

extension Calvc: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        handleConfiguration(cell: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, shouldSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) -> Bool {
        return date >= Date() && date <= endDate
    }
    
    
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "calendarCVCell", for: indexPath) as! calendarCVCell
        cell.label.text = cellState.text
        handleConfiguration(cell: cell, cellState: cellState)

        // Configure cell appearance
        if cellState.dateBelongsTo == .thisMonth {
            cell.isHidden = false
            
            // Allow selecting dates including the current day
            let currentDate = Date().stripTime()
            let cellDate = date.stripTime()
            
            // Check if date is within valid range (current date included)
            if cellDate < currentDate {
                cell.label.textColor = UIColor.lightGray
                cell.isUserInteractionEnabled = false
            } else if cellDate > endDate.stripTime() {
                cell.label.textColor = UIColor.lightGray
                cell.isUserInteractionEnabled = false
            } else {
                // Date is within valid range, including the current date
                cell.label.textColor = UIColor.black
                cell.isUserInteractionEnabled = true

                // Check if the cell date is selected
                let selectedDatesString = defaults.array(forKey: "selectedDates") as? [String] ?? []
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MM-yyyy"
                let selectedDates = selectedDatesString.compactMap { dateFormatter.date(from: $0) }

                if selectedDates.contains(cellDate) {
                    cell.selectedView.backgroundColor = UIColor.red
                    cell.label.textColor = UIColor.white
                } else {
                    cell.selectedView.backgroundColor = UIColor.clear
                    cell.label.textColor = UIColor.black
                }
                
                
                // Date is within valid range
                cell.label.textColor = UIColor.black
                cell.isUserInteractionEnabled = true

                // Check if the cell date matches calDepDate (start date)
                let calDepDate = defaults.string(forKey: UserDefaultsKeys.calDepDate) ?? ""
                let calRetDate = defaults.string(forKey: UserDefaultsKeys.calRetDate) ?? ""
                let cellDateString = dateFormatter.string(from: date)
                
                
                
                // Apply styles based on journey type
                if let journeyType = defaults.string(forKey: UserDefaultsKeys.journeyType) {
                    if journeyType == "oneway" {
                        if cellDateString == calDepDate {
                            cell.selectedView.backgroundColor = UIColor.red
                            cell.label.textColor = UIColor.red
                           
                           
                        } else {
                            cell.selectedView.backgroundColor = UIColor.clear
                            cell.label.textColor = UIColor.black
                        }
                    } else {
                        // For round-trip or multi-date selection
                        if cellDateString == calDepDate {
                            cell.selectedView.backgroundColor = UIColor.red
                            cell.label.textColor = UIColor.white
                           
                        } else if cellDateString == calRetDate {
                            cell.selectedView.backgroundColor = UIColor.red
                            cell.label.textColor = UIColor.white
                            
                        } else {
                            cell.selectedView.backgroundColor = UIColor.clear
                            cell.label.textColor = UIColor.black
                        }
                    }
                }
                
                
            }
        } else {
            // Dates that do not belong to the current month are hidden
            cell.isHidden = true
        }

        return cell
    }

    
//    
//    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
//        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "calendarCVCell", for: indexPath) as! calendarCVCell
//        cell.label.text = cellState.text
//        handleConfiguration(cell: cell, cellState: cellState)
//
//        // Configure cell appearance
//        if cellState.dateBelongsTo == .thisMonth {
//            cell.isHidden = false
//
//            // Check if date is within valid range
//            if date < Date() {
//                cell.label.textColor = UIColor.lightGray
//                cell.isUserInteractionEnabled = false
//                
//               
//            } else if date > endDate {
//                cell.label.textColor = UIColor.lightGray
//                cell.isUserInteractionEnabled = false
//            } else {
//                
//                
//                
//               
//            }
//        } else {
//            // Dates that do not belong to the current month are hidden
//            cell.isHidden = true
//            
//        }
//
//        return cell
//    }


    
    
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupMonthLabel(date: visibleDates.monthDates.first!.date)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleConfiguration(cell: cell, cellState: cellState)
        
        
        // Save selected dates to UserDefaults
           let selectedDates = calendarView.selectedDates
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd"
            
           let dateStrings = selectedDates.map { dateFormatter.string(from: $0) }
           defaults.set(dateStrings, forKey: "selectedDates")
        
       
      
        
        if selectedfirstDate != nil {
            if date < selectedfirstDate! {
                calendarView.selectDates(from: date, to: selectedfirstDate!, triggerSelectionDelegate: false, keepSelectionIfMultiSelectionAllowed: true)
                selectedlastDate = calendarView.selectedDates.last
                selectedfirstDate = calendarView.selectedDates.first
            } else {
                selectedlastDate = calendarView.selectedDates.last
                calendarView.selectDates(from: selectedfirstDate!, to: date, triggerSelectionDelegate: false, keepSelectionIfMultiSelectionAllowed: true)
            }
        } else {
            selectedfirstDate = calendarView.selectedDates.first
            selectedlastDate = nil
            handleConfiguration(cell: cell, cellState: cellState)
        }
        
        if selectedfirstDate == nil {
            selectedfirstDate = date
            calstartDate = date.customDateStringFormat("dd-MM-yyyy")
        } else {
            selectedlastDate = date
            calstartDate = selectedfirstDate?.customDateStringFormat("dd-MM-yyyy") ?? ""
            calendDate = date.customDateStringFormat("dd-MM-yyyy")
        }
        
        
        guard let journeyType = defaults.string(forKey: UserDefaultsKeys.journeyType) else {
            return
        }
        
        if journeyType == "oneway" {
            currentSelectedDatelbl.text = MySingleton.shared.convertDateFormat(inputDate: calstartDate, f1: "dd-MM-yyyy", f2: "MMM dd, yyyy")
        }else {
            currentSelectedDatelbl.text = "\(MySingleton.shared.convertDateFormat(inputDate: calstartDate, f1: "dd-MM-yyyy", f2: "MMM dd, yyyy")) - \(MySingleton.shared.convertDateFormat(inputDate: calendDate, f1: "dd-MM-yyyy", f2: "MMM dd, yyyy"))"
        }
       
        
       
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        handleConfiguration(cell: cell, cellState: cellState)
        
        // Save the selected dates to UserDefaults
        let selectedDates = calendarView.selectedDates
        let dateStrings = selectedDates.map { $0.customDateStringFormat("yyyy-MM-dd") }
        defaults.set(dateStrings, forKey: "selectedDates")
        
        if selectedfirstDate != nil {
            if date > (selectedfirstDate!) {
                calendarView.deselectDates(from: selectedfirstDate!, to: date, triggerSelectionDelegate: false)
                selectedfirstDate = calendarView.selectedDates.first
            } else if selectedlastDate == nil || date == selectedlastDate {
                selectedfirstDate = nil
                selectedlastDate = nil
                handleConfiguration(cell: cell, cellState: cellState)
            } else {
                handleConfiguration(cell: cell, cellState: cellState)
            }
        }
        
        if date == selectedfirstDate {
            selectedfirstDate = nil
            calstartDate = ""
        } else if date == selectedlastDate {
            selectedlastDate = nil
            calendDate = ""
        }
        
        guard let journeyType = defaults.string(forKey: UserDefaultsKeys.journeyType) else {
            return
        }
        if journeyType == "oneway" {
            currentSelectedDatelbl.text = MySingleton.shared.convertDateFormat(inputDate: calstartDate, f1: "dd-MM-yyyy", f2: "MMM dd, yyyy")
        }else {
            currentSelectedDatelbl.text = "\(MySingleton.shared.convertDateFormat(inputDate: calstartDate, f1: "dd-MM-yyyy", f2: "MMM dd, yyyy")) - \(MySingleton.shared.convertDateFormat(inputDate: calendDate, f1: "dd-MM-yyyy", f2: "MMM dd, yyyy"))"
        }
    }
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let parameters = ConfigurationParameters(
            startDate: self.startDate,
            endDate: self.endDate,
            numberOfRows: 6,
            generateInDates: .forAllMonths,
            generateOutDates: .tillEndOfGrid,
            firstDayOfWeek: .monday,
            hasStrictBoundaries: true
        )
        return parameters
    }
}

extension Date {
    func customDateStringFormat(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    
    func stripTime() -> Date {
            let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
            return Calendar.current.date(from: components) ?? self
        }
}

