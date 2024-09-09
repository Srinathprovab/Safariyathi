//
//  HotelSearchResultVC.swift
//  Safariyati
//
//  Created by appal on 02/08/24.
//

import UIKit

class HotelSearchResultVC: BaseTableVC {
    @IBOutlet weak var filterSortView: BorderedView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    static var newInstance: HotelSearchResultVC? {
        let storyboard = UIStoryboard(name: Storyboard.Hotel.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? HotelSearchResultVC
        return vc
    }
    
    var tablerow = [TableRow]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    
    func setupUI() {
        titleLabel.text = "Search Results"
        commonTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        commonTableView.layer.cornerRadius = 12
        backBtn.addTarget(self, action: #selector(didTapOnBackButtonAction), for: .touchUpInside)
        commonTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        commonTableView.layer.cornerRadius = 20
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["HotelResultTVCell"])
        
        setupTV()
    }
    
    func setupTV() {
        tablerow.removeAll()
        tablerow.append(TableRow(cellType:.HotelResultTVCell))
        tablerow.append(TableRow(cellType:.HotelResultTVCell))
        tablerow.append(TableRow(cellType:.HotelResultTVCell))
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    @objc func didTapOnBackButtonAction() {
      //  dismiss(animated: true, completion: nil)
        dismiss(animated: true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            // Hide the filterSortView when scrolling begins
            filterSortView.isHidden = true
        }

        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            if !decelerate {
                // Show the filterSortView when scrolling stops
                filterSortView.isHidden = false
            }
        }

        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            // Show the filterSortView when scrolling stops after deceleration
            filterSortView.isHidden = false
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gotoRoomSeleectionVC()
    }
    
    
    func gotoRoomSeleectionVC() {
        guard let vc = RoomSelectionViewController.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
    @IBAction func editButtonAction(_ sender: Any) {
        guard let vc = ModifyHotelSearchVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: false)
    }
}


