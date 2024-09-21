//
//  CityInfoTVCell.swift
//  Safariyati
//
//  Created by FCI on 09/04/24.
//

import UIKit

class CityInfoTVCell: TableViewCell {

    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var subtitlelbl: UILabel!
    @IBOutlet weak var codelbl: UILabel!
    
    
    var airportname = String()
    var fromcity = String()
    var id = String()
    var cityname = String()
    var code = String()
    var list :AirportCodeListModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func updateUI() {
        list = cellInfo?.moreData as? AirportCodeListModel
        fromcity = list?.label ?? ""
        titlelbl.text = "\(list?.city ?? "")"
        subtitlelbl.text = "\(list?.name ?? "")"
        code = list?.code ?? ""
        codelbl.text = list?.code ?? ""
        id = list?.id ?? ""
        cityname = list?.city ?? "''"
        airportname = "\(list?.name ?? "")"
    }
    
    
    
}
