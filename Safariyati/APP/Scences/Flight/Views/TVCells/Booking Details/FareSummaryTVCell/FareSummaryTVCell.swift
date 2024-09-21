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
    @IBOutlet weak var adultpricelbl: UILabel!
    @IBOutlet weak var adultfarelbl: UILabel!
    @IBOutlet weak var adulttaxlbl: UILabel!
    @IBOutlet weak var childpricelbl: UILabel!
    @IBOutlet weak var childfarelbl: UILabel!
    @IBOutlet weak var childtaxlbl: UILabel!
    @IBOutlet weak var infantpricelbl: UILabel!
    @IBOutlet weak var infantfarelbl: UILabel!
    @IBOutlet weak var infanttaxlbl: UILabel!
    @IBOutlet weak var subtotallbl: UILabel!
    @IBOutlet weak var totallbl: UILabel!
    
    
    var pricedetails : PriceDetails?
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
        
        pricedetails = cellInfo?.moreData as? PriceDetails
        
        adultpricelbl.text = "\(pricedetails?.api_currency ?? "") \(pricedetails?.adultsTotalPrice ?? "")"
        adultfarelbl.text = "\(pricedetails?.api_currency ?? "") \(pricedetails?.adultsBasePrice ?? "")"
        adulttaxlbl.text = "\(pricedetails?.api_currency ?? "") \(pricedetails?.adultsTaxPrice ?? "")"
        
        childpricelbl.text = "\(pricedetails?.api_currency ?? "") \(pricedetails?.childTotalPrice ?? "")"
        childfarelbl.text = "\(pricedetails?.api_currency ?? "") \(pricedetails?.childBasePrice ?? "")"
        childtaxlbl.text = "\(pricedetails?.api_currency ?? "") \(pricedetails?.childTaxPrice ?? "")"
        
        infantpricelbl.text = "\(pricedetails?.api_currency ?? "") \(pricedetails?.infantTotalPrice ?? "")"
        infantfarelbl.text = "\(pricedetails?.api_currency ?? "") \(pricedetails?.infantBasePrice ?? "")"
        infanttaxlbl.text = "\(pricedetails?.api_currency ?? "") \(pricedetails?.infantTaxPrice ?? "")"
        
        subtotallbl.text = "\(pricedetails?.api_currency ?? "") \(pricedetails?.grand_total ?? "")"
        totallbl.text = "\(pricedetails?.api_currency ?? "") \(pricedetails?.grand_total ?? "")"
        
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
