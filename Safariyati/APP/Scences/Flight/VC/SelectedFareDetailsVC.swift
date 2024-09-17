//
//  SelectedFareDetailsVC.swift
//  Safariyati
//
//  Created by Admin on 17/09/24.
//

import UIKit

class SelectedFareDetailsVC: UIViewController {
    
    
    
    static var newInstance: SelectedFareDetailsVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? SelectedFareDetailsVC
        return vc
    }
    
    
    var payload = [String:Any]()
    var tablerow = [TableRow]()
    
    override func viewWillAppear(_ animated: Bool) {
        print("******* \(selectedfaredata?.fare_heading ?? "") *******")
        addObserver()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        
    }
    
    @IBAction func didTapOnCloseBtnAction(_ sender: Any) {
        callapibool = false
        dismiss(animated: true)
    }
    
    
}


extension SelectedFareDetailsVC {
    
    
    
    
    func setupUI() {
        
//        commonTableView.backgroundColor = .WhiteColor
//        commonTableView.registerTVCells(["SelectFareTVCell"])
        
       // setupTV()
    }
    
    
//    func setupTV() {
//        tablerow.removeAll()
//        
//        tablerow.append(TableRow(cellType: .SelectFareTVCell))
//        
//        
//        commonTVData = tablerow
//        commonTableView.reloadData()
//    }
}




extension SelectedFareDetailsVC  {
    
    
    func addObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(nointernet), name: Notification.Name("offline"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(resultnil), name: NSNotification.Name("resultnil"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(nointrnetreload), name: Notification.Name("nointrnetreload"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: Notification.Name("reload"), object: nil)
        
        if callapibool == true {
            DispatchQueue.main.async {
                //   self.callSelecedFareDetailsAPI()
            }
        }
        
    }
    
    
    @objc func reload() {
        DispatchQueue.main.async {[self] in
           // commonTableView.reloadData()
        }
    }
    
    @objc func nointrnetreload() {
        
        DispatchQueue.main.async {
            // self.callSelecedFareDetailsAPI()
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
