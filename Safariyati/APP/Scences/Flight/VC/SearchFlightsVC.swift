//
//  SearchFlightsVC.swift
//  Safariyati
//
//  Created by FCI on 08/04/24.
//

import UIKit

class SearchFlightsVC: BaseTableVC {
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    
    static var newInstance: SearchFlightsVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? SearchFlightsVC
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
      //  dismiss(animated: true, completion: nil)
        gotoTabbarVC()
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
        gotoSearchResultVC()
    }
    
    func gotoSelectCityVC(str:String) {
        guard let vc = SelectCityVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.titleString = str
        present(vc, animated: true)
    }
    
    func gotoAddTravellerVC() {
        guard let vc = AddTravellerVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
    
    func gotoSearchResultVC() {
        guard let vc = SearchResultVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
    
    
    func gotoTabbarVC() {
        guard let vc = TabbarVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.selectedIndex = 0
        present(vc, animated: false)
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
            defaults.set(formatter.string(from: cell.depDatePicker.date), forKey: UserDefaultsKeys.calDepDate)
            defaults.set(formatter.string(from: cell.retDatePicker.date), forKey: UserDefaultsKeys.calRetDate)
        }
        
        commonTableView.reloadData()
        self.view.endEditing(true)
    }
    
    override func cancelDatePicker(cell:SearchFlightsTVCell){
        self.view.endEditing(true)
    }
    
    
    //MARK: - gotoCalenderVC
    
    
    override func didTapOnDepartureBtnAction(cell:SearchFlightsTVCell) {
        gotoCalenderVC(key: "dep", titleStr: "Departure Date")
    }
    
    override func didTapOnReturnBtnAction(cell:SearchFlightsTVCell) {
         gotoCalenderVC(key: "ret", titleStr: "Ruturn Date")
    }
    
    func gotoCalenderVC(key:String,titleStr:String) {
        dateSelectKey = key
        guard let vc = Calvc.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        vc.titleStr = titleStr
        callapibool = true
        self.present(vc, animated: false)
    }
    
    
    
}


extension SearchFlightsVC {
    
    func setupTV() {
        tablerow.removeAll()
        tablerow.append(TableRow(cellType:.SearchFlightsTVCell))
        commonTVData = tablerow
        commonTableView.reloadData()
    }
}



extension SearchFlightsVC {
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
