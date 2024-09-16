//
//  ExchangeOrRefundTVCell.swift
//  Safariyati
//
//  Created by FCI on 11/04/24.
//

import UIKit

class ExchangeOrRefundTVCell: TableViewCell {

    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var adultlbl: UILabel!
    @IBOutlet weak var childlbl: UILabel!
    @IBOutlet weak var infantlbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func updateUI() {
        titlelbl.text = cellInfo?.title ?? ""
        
        if cellInfo?.key == "change" {
            adultlbl.text = changecharges?.aDT
            childlbl.text = changecharges?.cNN
            infantlbl.text = changecharges?.iNF
        }else {
            adultlbl.text = cancelationcharges?.aDT
            childlbl.text = cancelationcharges?.cNN
            infantlbl.text = cancelationcharges?.iNF
        }
    }
    
}
