//
//  SearchHolidayTVCell.swift
//  Safariyati
//
//  Created by Admin on 23/09/24.
//

import UIKit


protocol SearchHolidayTVCellDelegate {
    func didTapOnSearchTravellingtoBtnAction(cell:SearchHolidayTVCell)
    func didTapOnViewAllHolidaysBtnAction(cell:SearchHolidayTVCell)
    func didTapOnSearchHoliodaysBtnAction(cell:SearchHolidayTVCell)
}

class SearchHolidayTVCell: TableViewCell {
    
    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var travillingvaluelbl: UILabel!
    @IBOutlet weak var viewalllblb: UILabel!
    @IBOutlet weak var travillingvalueBtn: UIButton!
    @IBOutlet weak var viewAllBtn: UIButton!
    @IBOutlet weak var searchHolidayBtn: UIButton!
    
    
    var delegate:SearchHolidayTVCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupUI() {
        setuplabels(lbl: titlelbl, text: "Enter", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .left)
        setuplabels(lbl: travillingvaluelbl, text: "Where are you Travelling to?", textcolor: .subtitle1, font: .InterRegular(size: 14), align: .left)
        setuplabels(lbl: viewalllblb, text: "View all Holidays/Staycation", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .left)
        
        searchHolidayBtn.layer.cornerRadius = 6
        searchHolidayBtn.clipsToBounds = true
        
        
        travillingvalueBtn.addTarget(self, action: #selector(didTapOnSearchTravellingtoBtnAction(_:)), for: .touchUpInside)
        viewAllBtn.addTarget(self, action: #selector(didTapOnViewAllHolidaysBtnAction(_:)), for: .touchUpInside)
        searchHolidayBtn.addTarget(self, action: #selector(didTapOnSearchHoliodaysBtnAction(_:)), for: .touchUpInside)
    }
    
    
    @objc func didTapOnSearchTravellingtoBtnAction(_ sender:UIButton) {
        delegate?.didTapOnSearchTravellingtoBtnAction(cell: self)
    }
    
    @objc func didTapOnViewAllHolidaysBtnAction(_ sender:UIButton) {
        delegate?.didTapOnViewAllHolidaysBtnAction(cell: self)
    }
    
    @objc func didTapOnSearchHoliodaysBtnAction(_ sender:UIButton) {
        delegate?.didTapOnSearchHoliodaysBtnAction(cell: self)
    }
    
    
    override func updateUI() {
        if let value = defaults.string(forKey: UserDefaultsKeys.holiday_package_name) {
            travillingvaluelbl.text = value
            travillingvaluelbl.textColor = .ApplabelColor
        }else {
            travillingvaluelbl.text = "Where are you Travelling to?"
            travillingvaluelbl.textColor = .subtitle1
            
        }
        
    }
    

    
    
}
