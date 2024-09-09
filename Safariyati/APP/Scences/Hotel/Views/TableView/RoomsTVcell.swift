//
//  RoomsTVcell.swift
//  Safariyati
//
//  Created by appal on 05/08/24.
//

import UIKit

protocol RoomsTVcellDelegate:AnyObject {
    func didTapOnRoomsBtn(cell:RoomsTVcell)
    func didTapOnHotelsDetailsBtn(cell:RoomsTVcell)
    func didTapOnAmenitiesBtn(cell:RoomsTVcell)
}

class RoomsTVcell: TableViewCell {
    
    
    @IBOutlet weak var tvHeight: NSLayoutConstraint!
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var roomsView: UIView!
    @IBOutlet weak var roomslbl: UILabel!
    @IBOutlet weak var roomsUL: UIView!
    @IBOutlet weak var roomsBtn: UIButton!
    @IBOutlet weak var hotelsDetailsView: UIView!
    @IBOutlet weak var hotelsDetailslbl: UILabel!
    @IBOutlet weak var hotelsDetailsUL: UIView!
    @IBOutlet weak var hotelsDetailsBtn: UIButton!
    @IBOutlet weak var amenitiesView: UIView!
    @IBOutlet weak var amenitieslbl: UILabel!
    @IBOutlet weak var amenitiesUL: UIView!
    @IBOutlet weak var amenitiesBtn: UIButton!
    @IBOutlet weak var roomDetailsTV: UITableView!
    
    var delegate: RoomsTVcellDelegate?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func updateUI() {
        roomslbl.font = UIFont.InterRegular(size: 14)
        amenitieslbl.font = UIFont.InterRegular(size: 14)
        hotelsDetailslbl.font = UIFont.InterRegular(size: 14)
        
        if cellInfo?.key == "rooms" {
            roomTapped()
        } else if cellInfo?.key == "details" {
            detailsTapped()
        } else {
            AmenitiesBtnTapped()
        }
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func roomTapped() {
        roomslbl.textColor = .WhiteColor
        roomsView.backgroundColor = .Buttoncolor
        hotelsDetailslbl.textColor = .ZeroD1Color
        hotelsDetailsView.backgroundColor = .WhiteColor
        amenitieslbl.textColor = .ZeroD1Color
    }
    
    func detailsTapped() {
        roomslbl.textColor = .ZeroD1Color
        roomsView.backgroundColor = .WhiteColor
        hotelsDetailslbl.textColor = .WhiteColor
        hotelsDetailsView.backgroundColor = .Buttoncolor
        amenitieslbl.textColor = .ZeroD1Color
        amenitiesView.backgroundColor = .WhiteColor
    }
    
    func AmenitiesBtnTapped() {
        roomslbl.textColor = .ZeroD1Color
        roomsView.backgroundColor = .WhiteColor
        hotelsDetailslbl.textColor = .ZeroD1Color
        hotelsDetailsView.backgroundColor = .WhiteColor
        amenitieslbl.textColor = .WhiteColor
        amenitiesView.backgroundColor = .Buttoncolor
    }
    
    @IBAction func didTapOnRoomsBtn(_ sender: Any) {
//        roomTapped()
        delegate?.didTapOnRoomsBtn(cell:self)
    }
    

    @IBAction func didTapOnHotelsDetailsBtn(_ sender: Any) {
//        detailsTapped()
        delegate?.didTapOnHotelsDetailsBtn(cell:self)
    }
    
    @IBAction func didTapOnAmenitiesBtn(_ sender: Any) {
//        AmenitiesBtnTapped()
        delegate?.didTapOnAmenitiesBtn(cell:self)
    }
}
