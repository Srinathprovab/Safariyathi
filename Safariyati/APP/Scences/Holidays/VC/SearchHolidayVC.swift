//
//  SearchHolidayVC.swift
//  Safariyati
//
//  Created by Admin on 23/09/24.
//

import UIKit

class SearchHolidayVC: BaseTableVC {
    
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    
    
    static var newInstance: SearchHolidayVC? {
        let storyboard = UIStoryboard(name: Storyboard.Holidays.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? SearchHolidayVC
        return vc
    }
    
    var tablerow = [TableRow]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        addObserver()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    
    
    
    
    //MARK: - didTapOnBackButtonAction
    @objc func didTapOnBackButtonAction() {
        //  dismiss(animated: true, completion: nil)
        gotoTabbarVC()
    }
    
    func gotoTabbarVC() {
        guard let vc = TabbarVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.selectedIndex = 0
        present(vc, animated: false)
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
}


extension SearchHolidayVC {
    
    func setupUI() {
        backBtn.addTarget(self, action: #selector(didTapOnBackButtonAction), for: .touchUpInside)
        
        commonTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        commonTableView.layer.cornerRadius = 20
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["SearchHolidayTVCell"
                                         ,"EmptyTVCell"])
        
        
        DispatchQueue.main.async { [self] in
            setupTVCells()
        }
    }
    
    
    
    
    func setupTVCells() {
        tablerow.removeAll()
        
        
        tablerow.append(TableRow(cellType:.SearchHolidayTVCell))
        tablerow.append((TableRow(height: 30, cellType:.EmptyTVCell)))
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
}



extension SearchHolidayVC  {
    
    
    func addObserver() {
        
      
        NotificationCenter.default.addObserver(self, selector: #selector(nointernet), name: Notification.Name("offline"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(resultnil), name: NSNotification.Name("resultnil"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(nointrnetreload), name: Notification.Name("nointrnetreload"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: Notification.Name("reload"), object: nil)
        
        
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
