//
//  AddFareInfoTVCell.swift
//  Safariyati
//
//  Created by FCI on 11/04/24.
//

import UIKit

class AddFareInfoTVCell: TableViewCell {

    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var faretypelbl: UILabel!
    @IBOutlet weak var handbaglbl: UILabel!
    @IBOutlet weak var cancellationlbl: UILabel!
    @IBOutlet weak var datachangelbl: UILabel!
    @IBOutlet weak var baggagelbl: UILabel!
    @IBOutlet weak var amountlbl: UILabel!
    
    
    
    var faredata :SelectFareData?
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
    }
    
}
