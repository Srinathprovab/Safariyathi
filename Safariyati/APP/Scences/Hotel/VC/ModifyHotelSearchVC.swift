//
//  ModifyHotelSearchVC.swift
//  Safariyati
//
//  Created by appal on 07/08/24.
//

import UIKit

class ModifyHotelSearchVC: BaseTableVC {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var backBtnView: UIButton!
    var tablerow = [TableRow]()
    static var newInstance: ModifyHotelSearchVC? {
        let storyboard = UIStoryboard(name: Storyboard.Hotel.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? ModifyHotelSearchVC
        return vc
    }
    
    var payload = [String:Any]()
    var payload1 = [String:Any]()
//    var viewModel:HotelSearchViewModel?
//    var viewmodel1:TopFlightDetailsViewModel?
    var isFromvc = String()
    var countrycode = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    
    func setupUI() {
        self.view.backgroundColor = .black.withAlphaComponent(0.4)
        topView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        topView.layer.cornerRadius = 15
        backBtnView.layer.cornerRadius = backBtnView.layer.frame.width / 2
        commonTableView.isScrollEnabled = true
        commonTableView.registerTVCells(["SearchHotelTVCell",
                                         "EmptyTVCell"])
        setuptv()
    }
    
    
    func setuptv() {
        tablerow.removeAll()
        tablerow.append(TableRow(cellType:. SearchHotelTVCell))
        tablerow.append(TableRow(height:16, cellType:.EmptyTVCell))
        commonTVData = tablerow
        commonTableView.reloadData()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     
     
    */
    
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }

}
