//
//  TourListResultsVC.swift
//  Safariyati
//
//  Created by Admin on 23/09/24.
//

import UIKit

class TourListResultsVC: BaseTableVC, TourSearchListVMDelegate {
    
    
    
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var modifybtn: UIButton!
    
    
    static var newInstance: TourListResultsVC? {
        let storyboard = UIStoryboard(name: Storyboard.Holidays.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? TourListResultsVC
        return vc
    }
    
    var tablerow = [TableRow]()
    var listvm : TourSearchListVM?
    
    override func viewWillAppear(_ animated: Bool) {
        addObserver()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        listvm = TourSearchListVM(self)
    }
    
    
   
    
    
    //MARK: - didTapOnBackButtonAction
    @objc func didTapOnBackButtonAction() {
          dismiss(animated: true, completion: nil)
    }
    
    func gotoTabbarVC() {
        guard let vc = TabbarVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.selectedIndex = 0
        present(vc, animated: false)
    }
    
    
    @objc func didTapOnModifySearchAction() {
        gotoModifySearchHolidayVC()
    }
    
    func gotoModifySearchHolidayVC() {
        guard let vc = ModifySearchHolidayVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }

    
    
    func gotoHolidayDetailsVC() {
        callapibool = true
        guard let vc = HolidayDetailsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}





extension TourListResultsVC  {
    
    func setupUI() {
        backBtn.addTarget(self, action: #selector(didTapOnBackButtonAction), for: .touchUpInside)
        modifybtn.addTarget(self, action: #selector(didTapOnModifySearchAction), for: .touchUpInside)
        
        commonTableView.registerTVCells(["HolidaysSearchResultTVCell"
                                         ,"EmptyTVCell"])
        
        
       
        
        
    }
    
    
    
    func callGetAllHolidaysTourPackeges() {
        listvm?.CALL_GET_ALL_HOLIDAYS_TOUR_PACKEGES_API(dictParam: [:])
    }
   
    
    func tourListResults(response: TourSearchListModel) {
        holderView.isHidden = false
        
        DispatchQueue.main.async { [self] in
            setupTVCells(list: response)
        }
    }
    
    
    func setupTVCells(list:TourSearchListModel) {
        tablerow.removeAll()
        
        
        list.data?.forEach({ i in
            tablerow.append(TableRow(moreData:i,cellType:.HolidaysSearchResultTVCell))
        })
       
        tablerow.append((TableRow(height: 30, cellType:.EmptyTVCell)))
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? HolidaysSearchResultTVCell {
            defaults.set(cell.tourpackageName, forKey: UserDefaultsKeys.holiday_package_id)
            defaults.set(cell.tourid, forKey: UserDefaultsKeys.holiday_package_id)
            
            gotoHolidayDetailsVC()
        }
    }
    
}



extension TourListResultsVC  {
    
    
    func addObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(nointernet), name: Notification.Name("offline"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(resultnil), name: NSNotification.Name("resultnil"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(nointrnetreload), name: Notification.Name("nointrnetreload"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: Notification.Name("reload"), object: nil)
        
        
        if callapibool == true {
            holderView.isHidden = true
            DispatchQueue.main.async {
                self.callGetAllHolidaysTourPackeges()
            }
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
