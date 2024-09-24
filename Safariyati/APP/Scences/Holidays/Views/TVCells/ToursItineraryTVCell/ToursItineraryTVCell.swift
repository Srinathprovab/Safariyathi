//
//  ToursItineraryTVCell.swift
//  Safariyati
//
//  Created by Admin on 24/09/24.
//

import UIKit

protocol ToursItineraryTVCellDelegate {
    func didTapOnExpandViewBtnAction(cell:ToursItineraryTVCell)
}

class ToursItineraryTVCell: TableViewCell {
    
    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var daylbl: UILabel!
    @IBOutlet weak var contentlbl: UILabel!
    @IBOutlet weak var contentlblView: UIView!
    @IBOutlet weak var expandBtn: UIButton!
    @IBOutlet weak var dropdownImg: UIImageView!
    
    
    var list:Tours_itinerary_dw?
    var delegate:ToursItineraryTVCellDelegate?
    var index = 0
    var expandbool = false
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
        setuplabels(lbl: titlelbl, text: "", textcolor: .ApplabelColor, font: .poppinsMedium(size: 12), align: .left)
        setuplabels(lbl: daylbl, text: "", textcolor: .ApplabelColor, font: .poppinsMedium(size: 14), align: .left)
        setuplabels(lbl: contentlbl, text: "", textcolor: .ApplabelColor, font: .poppinsMedium(size: 14), align: .left)
        contentlblView.isHidden = true
        contentlbl.text = ""
        dropdownImg.image = UIImage(named: "dropDownArrow")
        expandBtn.addTarget(self, action: #selector(didTapOnExpandViewBtnAction(_:)), for: .touchUpInside)
    }
    
    @objc func didTapOnExpandViewBtnAction(_ sender:UIButton) {
        expandbool.toggle()
        if expandbool {
            contentlblView.isHidden = false
            contentlbl.text = list?.program_des?.htmlToString
            dropdownImg.image = UIImage(named: "dropup")
        }else {
            contentlblView.isHidden = true
            contentlbl.text = ""
            dropdownImg.image = UIImage(named: "dropDownArrow")
        }
        
        delegate?.didTapOnExpandViewBtnAction(cell: self)
    }
    
    
    override func updateUI() {
        list = cellInfo?.moreData as? Tours_itinerary_dw
        index = ((cellInfo?.characterLimit ?? 0) + 1)
        daylbl.text = "Day \(index)"
        titlelbl.text = list?.program_title
       // contentlbl.text = list?.program_des?.htmlToString
    }
    
}
