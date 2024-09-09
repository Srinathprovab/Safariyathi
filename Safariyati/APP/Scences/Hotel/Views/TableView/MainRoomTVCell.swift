//
//  MainRoomTVCell.swift
//  Safariyati
//
//  Created by appal on 05/08/24.
//

import UIKit

protocol MainRoomTVCellDelegate: AnyObject {
    func didTaponBookNow(cell: MainRoomTVCell)
}

class MainRoomTVCell: TableViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var bookNowBtn: UIButton!
    @IBOutlet weak var holderHeight: NSLayoutConstraint!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    var delegate: MainRoomTVCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupOnlyFont(lbl: priceLabel, font: .poppinsSemiBold(size: 16), text: "OMR 29.600")
        setupOnlyFont(lbl: totalLabel, font: .poppinsSemiBold(size: 12), text: "Total")
        
        // Initialization code
        
        setuTV()
    }
    
    
    func setuTV() {
        tableView.register(UINib(nibName: "NewRoomDetailsTVCell", bundle: nil), forCellReuseIdentifier: "NewRoomDetailsTVCell")
        
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
        bookNowBtn.layer.cornerRadius = 4
    }
    
    override func updateUI() {
        holderHeight.constant = 2 * 135
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewRoomDetailsTVCell") as? NewRoomDetailsTVCell {
            // Check if this is the last cell
            cell.selectionStyle = .none
            if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
                cell.bottomLabel.isHidden = true
            } else {
                cell.bottomLabel.isHidden = false
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    @IBAction func bookNowBtnAction(_ sender: Any) {
        delegate?.didTaponBookNow(cell: self)
    }
}
