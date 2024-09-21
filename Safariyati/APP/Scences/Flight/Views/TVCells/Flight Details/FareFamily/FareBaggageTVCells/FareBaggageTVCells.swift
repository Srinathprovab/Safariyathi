//
//  FareBaggageTVCells.swift
//  Safariyati
//
//  Created by Admin on 20/09/24.
//

import UIKit

class FareBaggageTVCells: TableViewCell {
    
    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var adultstitlelbl: UILabel!
    @IBOutlet weak var childtitlelbl: UILabel!
    @IBOutlet weak var infanttitlelbl: UILabel!
    @IBOutlet weak var adultslbl: UILabel!
    @IBOutlet weak var childlbl: UILabel!
    @IBOutlet weak var infantlbl: UILabel!
    @IBOutlet weak var childView: UIView!
    @IBOutlet weak var infantView: UIView!
    
    
    var index = 0
    var baggage_key = [String]()
    var baggage:Baggage?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupui()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupui(){
        setuplabels(lbl: titlelbl, text: "", textcolor: .ApplabelColor, font: .InterBold(size: 16), align: .center)
        setuplabels(lbl: adultstitlelbl, text: "Adults", textcolor: .ApplabelColor, font: .InterBold(size: 14), align: .left)
        setuplabels(lbl: childtitlelbl, text: "Child", textcolor: .ApplabelColor, font: .InterBold(size: 14), align: .left)
        setuplabels(lbl: infanttitlelbl, text: "Infant", textcolor: .ApplabelColor, font: .InterBold(size: 14), align: .left)
        
        setuplabels(lbl: adultslbl, text: "", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .center)
        setuplabels(lbl: childlbl, text: "", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .center)
        setuplabels(lbl: infantlbl, text: "", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .center)
    }
    
    override func updateUI() {
        
        
        let adultcount = Int(defaults.string(forKey: UserDefaultsKeys.adultCount) ?? "1") ?? 1
        let childCount = Int(defaults.string(forKey: UserDefaultsKeys.childCount) ?? "0") ?? 0
        let infantsCount = Int(defaults.string(forKey: UserDefaultsKeys.infantsCount) ?? "0") ?? 0
        if adultcount > 0 && childCount == 0 && infantsCount == 0 {
            childView.isHidden = true
            infantView.isHidden = true
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
        
        
        if cellInfo?.key == "baggage" {
            
            index = cellInfo?.characterLimit ?? 0
            baggage_key = cellInfo?.data as? [String] ?? []
            baggage = cellInfo?.moreData as? Baggage
            
            titlelbl.text = baggage_key[index]
            adultslbl.text = baggage?.adults
            childlbl.text = baggage?.child
            infantlbl.text = baggage?.infant
            
           
        }else {
            titlelbl.text = "Cancellation / Data Change"
            adultslbl.text = selectedfaredata?.cancellation_charges?.adults?.value
            childlbl.text = selectedfaredata?.cancellation_charges?.child?.value
            infantlbl.text = selectedfaredata?.cancellation_charges?.infant?.value
        }
             
        
    }
    
}
