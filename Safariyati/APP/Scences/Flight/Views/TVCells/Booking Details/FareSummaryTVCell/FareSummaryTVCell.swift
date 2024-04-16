//
//  FareSummaryTVCell.swift
//  Safariyati
//
//  Created by FCI on 16/04/24.
//

import UIKit

class FareSummaryTVCell: TableViewCell {
    
    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var adultView: UIView!
    @IBOutlet weak var childView: UIView!
    @IBOutlet weak var infantView: UIView!
    @IBOutlet weak var adultBottomView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    override func updateUI() {
        let adultcount = Int(defaults.string(forKey: UserDefaultsKeys.adultCount) ?? "1") ?? 1
        let childCount = Int(defaults.string(forKey: UserDefaultsKeys.childCount) ?? "0") ?? 0
        let infantsCount = Int(defaults.string(forKey: UserDefaultsKeys.infantsCount) ?? "0") ?? 0
        
        
        if adultcount > 0 && childCount == 0 && infantsCount == 0 {
            childView.isHidden = true
            infantView.isHidden = true
            adultBottomView.isHidden = false
        }else if adultcount > 0 && childCount > 0 && infantsCount == 0 {
            childView.isHidden = false
            infantView.isHidden = true
        }else if adultcount > 0 && childCount == 0 && infantsCount > 0 {
            childView.isHidden = true
            infantView.isHidden = false
        }else {
            childView.isHidden = false
            infantView.isHidden = false
        }
    }
    
    func setupUI() {
        topview.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        topview.layer.cornerRadius = 6
    }
    
}
