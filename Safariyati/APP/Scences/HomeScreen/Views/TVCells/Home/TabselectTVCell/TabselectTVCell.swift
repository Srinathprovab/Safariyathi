//
//  TabselectTVCell.swift
//  Safariyati
//
//  Created by FCI on 05/04/24.
//

import UIKit

protocol TabselectTVCellDelegate {
    
    func didTaponMenuBtnAction(cell:TabselectTVCell)
    func didTapOnSelectCurrencyBtnAction(cell:TabselectTVCell)
    func didTapOnFlightBtnAction(cell:TabselectTVCell)
    func didTapOnHotelBtnAction(cell:TabselectTVCell)
    func didTapOnHolidaysBtnAction(cell:TabselectTVCell)
    func didTapOnInsurenceBtnAction(cell:TabselectTVCell)
    
}

class TabselectTVCell: TableViewCell {
    
    var delegate:TabselectTVCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didTaponMenuBtnAction(_ sender: Any) {
        delegate?.didTaponMenuBtnAction(cell: self)
    }
    
    
    @IBAction func didTapOnSelectCurrencyBtnAction(_ sender: Any) {
        delegate?.didTapOnSelectCurrencyBtnAction(cell: self)
    }
    
    
    @IBAction func didTapOnFlightBtnAction(_ sender: Any) {
        delegate?.didTapOnFlightBtnAction(cell: self)
    }
    
    
    @IBAction func didTapOnHotelBtnAction(_ sender: Any) {
        delegate?.didTapOnHotelBtnAction(cell: self)
    }
    
    
    @IBAction func didTapOnHolidaysBtnAction(_ sender: Any) {
        delegate?.didTapOnHolidaysBtnAction(cell: self)
    }
    
    @IBAction func didTapOnInsurenceBtnAction(_ sender: Any) {
        delegate?.didTapOnInsurenceBtnAction(cell: self)
    }
    
    
}
