//
//  RoomSelectionViewController.swift
//  Safariyati
//
//  Created by appal on 05/08/24.
//

import UIKit


class RoomSelectionViewController: BaseTableVC, Output {
  
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    static var newInstance: RoomSelectionViewController? {
        let storyboard = UIStoryboard(name: Storyboard.Hotel.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? RoomSelectionViewController
        return vc
    }
    
    var tablerow = [TableRow]()
    var section: Rows? = .rooms
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        titleLabel.text = "Search Results"
        titleLabel.font = .InterMedium(size: 20)
        commonTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        commonTableView.layer.cornerRadius = 12
        backBtn.addTarget(self, action: #selector(didTapOnBackButtonAction), for: .touchUpInside)
        commonTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        commonTableView.layer.cornerRadius = 20
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["HotelCheckinInfoTVCell","HotelImagesTVCell", "RoomsTVcell","NewRoomDetailsTVCell","EmptyTVCell", "MainRoomTVCell", "HotelDetailsTVCell", "AmentiesTVCell"])
        setupTV(key: "rooms")
    }
    
    func setupTV(key: String) {
        tablerow.removeAll()
        tablerow.append(TableRow(height: 20, cellType:.EmptyTVCell))
        tablerow.append(TableRow(cellType:.HotelCheckinInfoTVCell))
        tablerow.append(TableRow(cellType:.HotelImagesTVCell))
        tablerow.append(TableRow(key: key, cellType:.RoomsTVcell))
        tablerow.append(TableRow(height: 15,cellType:.EmptyTVCell))
        
        if section == .rooms {
            tablerow.append(TableRow(cellType:.MainRoomTVCell))
        } else if section == .details {
            tablerow.append(TableRow(cellType:.HotelDetailsTVCell))
        } else {
            tablerow.append(TableRow(cellType:.AmentiesTVCell))
        }
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    
    @objc func didTapOnBackButtonAction() {
      //  dismiss(animated: true, completion: nil)
        dismiss(animated: true)
    }
    
    
    override func didTapOnRoomsBtn(cell:RoomsTVcell) {
        section = .rooms
        setupTV(key: "rooms")
    }
    override func didTapOnHotelsDetailsBtn(cell:RoomsTVcell) {
        section = .details
        setupTV(key: "details")
    }
    
    override func didTapOnAmenitiesBtn(cell:RoomsTVcell) {
        section = .amenties
        setupTV(key: "amenties")
    }
    
    override func didTaponBookNow(cell: MainRoomTVCell) {
        gotoGuestDetailsVC()
    }
    
    func gotoGuestDetailsVC() {
        guard let vc = GuestDetailsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}
