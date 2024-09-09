//
//  SearchResultVC.swift
//  Safariyati
//
//  Created by FCI on 10/04/24.
//

import UIKit

class SearchResultVC: BaseTableVC {
    
    
    @IBOutlet weak var filterSortView: BorderedView!
    @IBOutlet weak var cityslbl: UILabel!
    @IBOutlet weak var dateslbl: UILabel!
    
    static var newInstance: SearchResultVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? SearchResultVC
        return vc
    }
    
    
    var tablerow = [TableRow]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    
    //MARK: - didTapOnCloseBtnAction
    @IBAction func didTapOnCloseBtnAction(_ sender: Any) {
        // dismiss(animated: true)
        gotoSearchFlightsVC()
    }
    
    
    //MARK: - didTapOnFilterBtnAction didTapOnSortBtnAction
    @IBAction func didTapOnFilterBtnAction(_ sender: Any) {
        print("didTapOnFilterBtnAction")
    }
    
    
    @IBAction func didTapOnSortBtnAction(_ sender: Any) {
        print("didTapOnSortBtnAction")
    }
    
    
    
    //MARK: - SearchResultTVCell Delegate Methods
    override func didTapOnSelectFareBtnAction(cell: SearchResultTVCell) {
        gotoSelectFareVC()
    }
    
    override func didTapOnFlightDetailsBtnAction(cell: SearchResultTVCell) {
        gotoFlightDetailsVC()
    }
    
    override func didTapOnMoreSimilarResults(cell: SearchResultTVCell) {
        print("didTapOnMoreSimilarResults")
    }
    
    
    func gotoFlightDetailsVC() {
        guard let vc = FlightDetailsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
    
    func gotoSelectFareVC() {
        guard let vc = SelectFareVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
    
    func gotoSearchFlightsVC() {
        guard let vc = SearchFlightsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: false)
    }
    
    
    
    //MARK: - gotoModifySearchVC
    @IBAction func didTapOnModifySearchBtnAction(_ sender: Any) {
        gotoModifySearchVC()
    }
    
    func gotoModifySearchVC() {
        guard let vc = ModifySearchVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
}

extension SearchResultVC {
    func setupUI() {
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["SearchResultTVCell", "EmptyTVCell"])
      
        
        setupTVcells()
    }
    
    func setupTVcells() {
        tablerow.removeAll()
        
        for _ in 0...100 {
            tablerow.append(TableRow(title:"",
                                     characterLimit: flightscount,
                                     cellType:.SearchResultTVCell))
            
        }
        tablerow.append((TableRow(height: 60, cellType:.EmptyTVCell)))
        commonTVData = tablerow
        commonTableView.reloadData()
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
}
