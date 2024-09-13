//
//  BookingConfirmationVC.swift
//  Safariyati
//
//  Created by Admin on 18/06/24.
//

import UIKit

class BookingConfirmationVC: BaseTableVC {
    
    
    @IBOutlet weak var viewVoutreBtn: UIButton!
    
    
    static var newInstance: BookingConfirmationVC? {
        let storyboard = UIStoryboard(name: Storyboard.BookingConfirmation.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? BookingConfirmationVC
        return vc
    }
    
    var tablerow = [TableRow]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        viewVoutreBtn.layer.cornerRadius = 6
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.layer.cornerRadius = 20
        commonTableView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        commonTableView.registerTVCells(["AddFlightltineraryTVCell",
                                         "BookingReceiptTVCell",
                                         "PassengerDetailsTVCell",
                                         "EmptyTVCell"])
        
        setupFlightItienaryTVCell()
        
    }
    
    
    
    
    @IBAction func didTapOnCloseBtnAction(_ sender: Any) {
        gotoSearchFlightsVC()
    }
    
    
    func setupFlightItienaryTVCell() {
        tablerow.removeAll()
        
        tablerow.append(TableRow(cellType: .BookingReceiptTVCell))
        tablerow.append(TableRow(title:"",
                                 characterLimit: 2,
                                 cellType: .AddFlightltineraryTVCell))
        
        tablerow.append(TableRow(height:10,cellType: .EmptyTVCell))
        tablerow.append(TableRow(cellType: .PassengerDetailsTVCell))
        
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
        
        
    }
    
    
    @IBAction func didTapOnViewVoucherBtynAction(_ sender: Any) {
        print("didTapOnViewVoucherBtynAction")
    }
    
    
    func gotoSearchFlightsVC() {
        guard let vc = SearchFlightsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
}




