//
//  SearchFlightsTVCell.swift
//  Safariyati
//
//  Created by FCI on 08/04/24.
//

import UIKit

protocol SearchFlightsTVCellDelagate {
    func didTapOnOnewayBtnAction(cell:SearchFlightsTVCell)
    func didTapOnRoundtripBtnAction(cell:SearchFlightsTVCell)
}

class SearchFlightsTVCell: TableViewCell {
    
    @IBOutlet weak var onewayRadioImage: UIImageView!
    @IBOutlet weak var roundtripRadioImage: UIImageView!
    @IBOutlet weak var roundtripView: UIView!
    @IBOutlet weak var searchBtn: UIButton!
    
    
    var delegate:SearchFlightsTVCellDelagate?
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
        searchBtn.layer.cornerRadius = 4
    }
    
    
    @IBAction func didTapOnOnewayBtnAction(_ sender: Any) {
        onewayRadioImage.image = UIImage(named: "rselect")
        roundtripRadioImage.image = UIImage(named: "runselect")
        roundtripView.isHidden = true
        delegate?.didTapOnOnewayBtnAction(cell: self)
    }
    
    
    
    @IBAction func didTapOnRoundtripBtnAction(_ sender: Any) {
        roundtripRadioImage.image = UIImage(named: "rselect")
        onewayRadioImage.image = UIImage(named: "runselect")
        roundtripView.isHidden = false
        delegate?.didTapOnRoundtripBtnAction(cell: self)
    }
    
    
}
