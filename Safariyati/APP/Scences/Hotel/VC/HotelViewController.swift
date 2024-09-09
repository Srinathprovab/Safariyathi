//
//  HotelViewController.swift
//  Safariyati
//
//  Created by appal on 02/08/24.
//

import UIKit

class HotelViewController: BaseTableVC {
    @IBOutlet weak var tittleLabel: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    static var newInstance: HotelViewController? {
        let storyboard = UIStoryboard(name: Storyboard.Hotel.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? HotelViewController
        return vc
    }
    
    var tablerow = [TableRow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        tittleLabel.text = "Search Hotel"
        commonTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        commonTableView.layer.cornerRadius = 12
        backBtn.addTarget(self, action: #selector(didTapOnBackButtonAction), for: .touchUpInside)
        commonTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        commonTableView.layer.cornerRadius = 20
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["SearchHotelTVCell","EmptyTVCell"])
     
        
        setupTV()
    }
    
    
    func setupTV() {
        tablerow.removeAll()
        tablerow.append(TableRow(cellType:.SearchHotelTVCell))
        tablerow.append((TableRow(height: 30, cellType:.EmptyTVCell)))
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
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
    
    
    override func didtaponSearchBtn(cell: SearchHotelTVCell) {
        guard let vc = HotelSearchResultVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    
    override func didtapAddRoomBtn(cell: SearchHotelTVCell) {
        guard let vc = AddRoomsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: false)
    }
}

