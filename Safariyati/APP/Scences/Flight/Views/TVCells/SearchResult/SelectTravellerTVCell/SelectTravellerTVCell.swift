//
//  SelectTravellerTVCell.swift
//  Safariyati
//
//  Created by FCI on 10/04/24.
//

import UIKit
protocol SelectTravellerTVCellDelegate {
    func didTapOnCloseTravellerBtnAction(cell:SelectTravellerTVCell)
}

class SelectTravellerTVCell: TableViewCell {
    
    @IBOutlet weak var adultDecBtn: UIButton!
    @IBOutlet weak var adultCountlbl: UILabel!
    @IBOutlet weak var adultIncBtn: UIButton!
    @IBOutlet weak var childDecBtn: UIButton!
    @IBOutlet weak var childCountlbl: UILabel!
    @IBOutlet weak var childIncBtn: UIButton!
    @IBOutlet weak var infantDecBtn: UIButton!
    @IBOutlet weak var infantCountlbl: UILabel!
    @IBOutlet weak var infantIncBtn: UIButton!

    var adultsCount = 1
    var childCount = 0
    var infantsCount = 0
    var delegate:SelectTravellerTVCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setuupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func updateUI() {
        adultCountlbl.text = defaults.string(forKey: UserDefaultsKeys.adultCount) ?? "1"
        childCountlbl.text = defaults.string(forKey: UserDefaultsKeys.childCount) ?? "0"
        infantCountlbl.text = defaults.string(forKey: UserDefaultsKeys.infantsCount) ?? "0"
    }
    
    
    func setuupUI() {
        
        adultIncBtn.addTarget(self, action: #selector(didTapOnAdultIncrementBtnAction(_:)), for: .touchUpInside)
        adultDecBtn.addTarget(self, action: #selector(didTapOnAdultDecrementBtnAction(_:)), for: .touchUpInside)
        childIncBtn.addTarget(self, action: #selector(didTapOnChildIncrementBtnAction(_:)), for: .touchUpInside)
        childDecBtn.addTarget(self, action: #selector(didTapOnChildDecrementBtnAction(_:)), for: .touchUpInside)
        infantIncBtn.addTarget(self, action: #selector(didTapOnInfantIncrementBtnAction(_:)), for: .touchUpInside)
        infantDecBtn.addTarget(self, action: #selector(didTapOnInfantDecrementBtnAction(_:)), for: .touchUpInside)
        
    }
    
    
    @IBAction func didTapOnCloseTravellerBtnAction(_ sender: Any) {
        delegate?.didTapOnCloseTravellerBtnAction(cell: self)
    }
    
}



extension SelectTravellerTVCell {
    
    //MARK: - Adult
    @objc func didTapOnAdultIncrementBtnAction(_ sender:UIButton) {
        
        // Increment adults, but don't exceed 9 travelers in total
        if (adultsCount + childCount) < 9 {
            adultsCount += 1
            self.adultCountlbl.text = "\(adultsCount)"
        }
        
        updateTotalTravelerCount()
    }
    
    @objc func didTapOnAdultDecrementBtnAction(_ sender:UIButton) {
        
        // Ensure child count doesn't go below 1
        if adultsCount > 1 {
            adultsCount -= 1
            adultCountlbl.text = "\(adultsCount)"
            
            infantsCount = 0
            infantCountlbl.text = "0"
        }
        
        updateTotalTravelerCount()
    }
    
    //MARK: - Child
    @objc func didTapOnChildIncrementBtnAction(_ sender:UIButton) {
        
        // Increment adults and children, but don't exceed 9 travelers in total
        if (adultsCount + childCount) < 9 {
            childCount += 1
            self.childCountlbl.text = "\(childCount)"
        }
        
        updateTotalTravelerCount()
    }
    
    @objc func didTapOnChildDecrementBtnAction(_ sender:UIButton) {
        
        // Ensure adult count doesn't go below 1
        if childCount >= 1 {
            childCount -= 1
            childCountlbl.text = "\(childCount)"
        }
        
        updateTotalTravelerCount()
    }
    
    //MARK: - Infant
    @objc func didTapOnInfantIncrementBtnAction(_ sender:UIButton) {
        
        // Increment infants based on the selected adult count, but don't exceed the selected adult count
        if adultsCount > infantsCount {
            infantsCount += 1
            self.infantCountlbl.text = "\(infantsCount)"
        }
        
        updateTotalTravelerCount()
    }
    
    @objc func didTapOnInfantDecrementBtnAction(_ sender:UIButton) {
        
        // Ensure infant count doesn't go below 1
        if infantsCount >= 1 {
            infantsCount -= 1
            infantCountlbl.text = "\(infantsCount)"
        }
        
        updateTotalTravelerCount()
    }
    
    
    
    
    func updateTotalTravelerCount() {
        
        let totalTravelers = adultsCount + childCount + infantsCount
        print("Total Count === \(totalTravelers)")
        
        defaults.set(totalTravelers, forKey: UserDefaultsKeys.totalTravellerCount)
        defaults.set(adultsCount, forKey: UserDefaultsKeys.adultCount)
        defaults.set(childCount, forKey: UserDefaultsKeys.childCount)
        defaults.set(infantsCount, forKey: UserDefaultsKeys.infantsCount)
        
    }
}
