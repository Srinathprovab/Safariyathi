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
    @IBOutlet weak var locationimg: UIImageView!
    
    
    var airportname = String()
    var fromcity = String()
    var id = String()
    var cityname = String()
    var code = String()
    var list :AirportCodeListModel?
    var tourlist :TourListData?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    override func updateUI() {
       
        
       
        if cellInfo?.key == "holidays" {
            
            tourlist = cellInfo?.moreData as? TourListData
            fromcity = tourlist?.value ?? ""
            titlelbl.text = tourlist?.name
            subtitlelbl.text = tourlist?.value
            codelbl.isHidden = true
            code = tourlist?.id ?? ""
            locationimg.image = UIImage(named: "hotelloc")
        }else {
            list = cellInfo?.moreData as? AirportCodeListModel
            fromcity = list?.label ?? ""
            titlelbl.text = "\(list?.city ?? "")"
            subtitlelbl.text = "\(list?.name ?? "")"
            code = list?.code ?? ""
            codelbl.text = list?.code ?? ""
            id = list?.id ?? ""
            cityname = list?.city ?? "''"
            airportname = "\(list?.name ?? "")"
            locationimg.image = UIImage(named: "location")
        }
        
    }
    
    
    
}
