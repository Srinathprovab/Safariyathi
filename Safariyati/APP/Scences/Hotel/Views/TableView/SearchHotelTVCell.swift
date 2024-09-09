//
//  SearchHotelTVCell.swift
//  Safariyati
//
//  Created by appal on 02/08/24.
//

import UIKit

protocol SearchHotelTVCellDelegate: AnyObject {
    func didtaponSearchBtn(cell: SearchHotelTVCell)
    func didtapAddRoomBtn(cell: SearchHotelTVCell)
}


class SearchHotelTVCell: TableViewCell {

    @IBOutlet weak var cityNameTitleLabel: UILabel!
    @IBOutlet weak var nightLabel: UILabel!
    @IBOutlet weak var nightstitlelabel: UILabel!
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var locationCitylbl: UILabel!
    @IBOutlet weak var checkinTitlelbl: UILabel!
    @IBOutlet weak var checkinlbl: UILabel!
    @IBOutlet weak var checkinBtn: UIButton!
    @IBOutlet weak var checkoutTitlelbl: UILabel!
    @IBOutlet weak var checkoutlbl: UILabel!
    @IBOutlet weak var checkoutBtn: UIButton!
    @IBOutlet weak var addRoomsTitlelbl: UILabel!
    @IBOutlet weak var addRoomsValuelbl: UILabel!
    @IBOutlet weak var addRoomsBtn: UIButton!
    @IBOutlet weak var searchHotelBtn: UIButton!
    @IBOutlet weak var searchHotelCityBtn: UIButton!
    @IBOutlet weak var nationalitylbl: UILabel!
    @IBOutlet weak var nationalityValuelbl: UILabel!
    @IBOutlet weak var nationalityBtn: UIButton!
    @IBOutlet weak var nationalityTf: UITextField!
    
   weak var delegate:  SearchHotelTVCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    
    func setUpView() {
        searchHotelBtn.layer.cornerRadius = 8
        searchHotelBtn.setTitle("Search Hotel", for: .normal)
        searchHotelBtn.titleLabel?.font = .InterMedium(size: 16)
        setupLabel(lbl: cityNameTitleLabel, textcolor: .TitleColor, font: .InterMedium(size: 14))
        setupLabel(lbl: checkinTitlelbl, textcolor: .TitleColor, font: .InterMedium(size: 14))
        setupLabel(lbl: checkoutTitlelbl, textcolor: .TitleColor, font: .InterMedium(size: 14))
        setupLabel(lbl: addRoomsTitlelbl, textcolor: .TitleColor, font: .InterMedium(size: 14))
        setupLabel(lbl: nationalitylbl, textcolor: .TitleColor, font: .InterMedium(size: 14))
        setupLabel(lbl: nightstitlelabel, textcolor: .TitleColor, font: .InterMedium(size: 14))
        setupLabels(lbl: locationCitylbl, text: "Enter City Name", textcolor: .SubTitleColor, font: .InterMedium(size: 14))
        setupLabels(lbl: checkinlbl, text: "Add Check In Date", textcolor: .SubTitleColor, font: .InterMedium(size: 14))
        setupLabels(lbl: checkoutlbl, text: "Add Check Out Date", textcolor: .SubTitleColor, font: .InterMedium(size: 14))
        setupLabel(lbl: addRoomsValuelbl, textcolor: .TitleColor, font: .InterMedium(size: 14))
        setupLabels(lbl: nationalityValuelbl, text: "Select Nationality", textcolor: .TitleColor, font: .InterMedium(size: 14))
        setupLabels(lbl: nightLabel, text: "1", textcolor: .TitleColor, font: .InterMedium(size: 14))
        
        setupInitialsInput(lbl: locationCitylbl, str: "Enter City Name")
        setupInitialsInput(lbl: checkinlbl, str: "Add Check In Date")
        setupInitialsInput(lbl: checkoutlbl, str: "Add Check Out Date")
    }
    
    
    func setupInitialsInput(lbl:UILabel,str:String){
        if lbl.text == str {
            lbl.textColor = .SubTitleColor
        }else {
            lbl.textColor = .TitleColor
        }
    }
    
    @IBAction func SearchbtnAction(_ sender: Any) {
        delegate?.didtaponSearchBtn(cell: self)
    }
    
    @IBAction func addAdultAndRoomsButtonTapped(_ sender: Any) {
        delegate?.didtapAddRoomBtn(cell: self)
    }
}
