//
//  FareBreakdownTVCell.swift
//  Safariyati
//
//  Created by Admin on 20/09/24.
//

import UIKit

class FareBreakdownTVCell: TableViewCell {
    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var adultsppaxlbl: UILabel!
    @IBOutlet weak var childpaxlbl: UILabel!
    @IBOutlet weak var infantpaxlbl: UILabel!
    @IBOutlet weak var adultsfarelbl: UILabel!
    @IBOutlet weak var childfarelbl: UILabel!
    @IBOutlet weak var infantfarelbl: UILabel!
    @IBOutlet weak var adultstaxlbl: UILabel!
    @IBOutlet weak var childtaxlbl: UILabel!
    @IBOutlet weak var infanttaxlbl: UILabel!
    @IBOutlet weak var adultspassengerlbl: UILabel!
    @IBOutlet weak var childpassengerbl: UILabel!
    @IBOutlet weak var infantpassengerlbl: UILabel!
    @IBOutlet weak var adultstotallbl: UILabel!
    @IBOutlet weak var childtotallbl: UILabel!
    @IBOutlet weak var infanttotallbl: UILabel!
    @IBOutlet weak var paxlbl: UILabel!
    @IBOutlet weak var farelbl: UILabel!
    @IBOutlet weak var taxlbl: UILabel!
    @IBOutlet weak var passengerlbl: UILabel!
    @IBOutlet weak var totallbl: UILabel!
    @IBOutlet weak var childView: UIView!
    @IBOutlet weak var infantView: UIView!
    
    
    
    var farebreakdown :Farebreckdown?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUPUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setUPUI() {
        
        setuplabels(lbl: titlelbl, text: "Fare Breakdown", textcolor: .ApplabelColor, font: .InterBold(size: 16), align: .center)
        
        setuplabels(lbl: paxlbl, text: "Pax Type", textcolor: .ApplabelColor, font: .InterBold(size: 14), align: .center)
        setuplabels(lbl: farelbl, text: "Fare (\(defaults.string(forKey: UserDefaultsKeys.selectedCurrency) ?? "OMR"))", textcolor: .ApplabelColor, font: .InterBold(size: 14), align: .center)
        setuplabels(lbl: taxlbl, text: "Tax (\(defaults.string(forKey: UserDefaultsKeys.selectedCurrency) ?? "OMR"))", textcolor: .ApplabelColor, font: .InterBold(size: 14), align: .center)
        setuplabels(lbl: passengerlbl, text: "XPassengers", textcolor: .ApplabelColor, font: .InterBold(size: 14), align: .center)
        setuplabels(lbl: totallbl, text: "Total (\(defaults.string(forKey: UserDefaultsKeys.selectedCurrency) ?? "OMR"))", textcolor: .Buttoncolor, font: .InterBold(size: 14), align: .center)
        
        setuplabels(lbl: adultsppaxlbl, text: "", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .center)
        setuplabels(lbl: adultsfarelbl, text: "", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .center)
        setuplabels(lbl: adultstaxlbl, text: "", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .center)
        setuplabels(lbl: adultspassengerlbl, text: "", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .center)
        setuplabels(lbl: adultstotallbl, text: "", textcolor: .Buttoncolor, font: .InterRegular(size: 14), align: .center)
        
        setuplabels(lbl: childpaxlbl, text: "", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .center)
        setuplabels(lbl: childfarelbl, text: "", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .center)
        setuplabels(lbl: childtaxlbl, text: "", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .center)
        setuplabels(lbl: childpassengerbl, text: "", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .center)
        setuplabels(lbl: childtotallbl, text: "", textcolor: .Buttoncolor, font: .InterRegular(size: 14), align: .center)
        
        setuplabels(lbl: infantpaxlbl, text: "", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .center)
        setuplabels(lbl: infantfarelbl, text: "", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .center)
        setuplabels(lbl: infanttaxlbl, text: "", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .center)
        setuplabels(lbl: infantpassengerlbl, text: "", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .center)
        setuplabels(lbl: infanttotallbl, text: "", textcolor: .Buttoncolor, font: .InterRegular(size: 14), align: .center)
        
        
    }
    
    
    override func updateUI() {
        
        farebreakdown = cellInfo?.moreData as? Farebreckdown
        
        adultsppaxlbl.text = "Adult"
        adultsfarelbl.text = farebreakdown?.adt_price
        adultstaxlbl.text = farebreakdown?.adt_tax
        adultspassengerlbl.text = "X\(farebreakdown?.adt_no ?? 0)"
        adultstotallbl.text = farebreakdown?.adt_total
        
        childpaxlbl.text = "Child"
        childfarelbl.text = farebreakdown?.chd_price
        childtaxlbl.text = farebreakdown?.chd_tax
        childpassengerbl.text = "X\(farebreakdown?.chd_no ?? 0)"
        childtotallbl.text = farebreakdown?.chd_total
        
        infantpaxlbl.text = "Infant"
        infantfarelbl.text = farebreakdown?.inf_price
        infanttaxlbl.text = farebreakdown?.inf_tax
        infantpassengerlbl.text = "X\(farebreakdown?.inf_no ?? 0)"
        infanttotallbl.text = farebreakdown?.inf_total
        
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
        
        
    }
    
}
