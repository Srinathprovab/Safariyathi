//
//  BaggageTVCell.swift
//  Safariyati
//
//  Created by FCI on 11/04/24.
//

import UIKit

class BaggageTVCell: TableViewCell {
    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var cabinBaggagelbl: UILabel!
    @IBOutlet weak var adultCheckdinlbl: UILabel!
    @IBOutlet weak var childCheckdinlbl: UILabel!
    @IBOutlet weak var infantCheckdinlbl: UILabel!
    
    
    var adultcount = String()
    var childcount = String()
    var infantcount = String()
    
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
        
        titlelbl.text = cellInfo?.title ?? ""
        
        adultcount = defaults.string(forKey: UserDefaultsKeys.adultCount) ?? "1"
        childcount = defaults.string(forKey: UserDefaultsKeys.childCount) ?? "0"
        infantcount = defaults.string(forKey: UserDefaultsKeys.infantsCount) ?? "0"
        childCheckdinlbl.isHidden = true
        infantCheckdinlbl.isHidden = true
        
        
        if adultcount == "1" && childcount == "0" && infantcount == "0" {
            childCheckdinlbl.isHidden = true
            infantCheckdinlbl.isHidden = true
        }else if adultcount == "1" && childcount == "1" && infantcount == "0" {
            childCheckdinlbl.isHidden = false
            infantCheckdinlbl.isHidden = true
        }else if adultcount == "1" && childcount == "0" && infantcount == "1" {
            childCheckdinlbl.isHidden = true
            infantCheckdinlbl.isHidden = false
        }else {
            childCheckdinlbl.isHidden = false
            infantCheckdinlbl.isHidden = false
        }
        
    }
    
    
    func setupUI() {
        
    }
    
}
