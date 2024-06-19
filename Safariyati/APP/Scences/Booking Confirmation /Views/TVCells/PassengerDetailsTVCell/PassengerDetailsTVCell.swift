//
//  PassengerDetailsTVCell.swift
//  Safariyati
//
//  Created by Admin on 18/06/24.
//

import UIKit

class PassengerDetailsTVCell: TableViewCell {

    @IBOutlet weak var PassengerDetailsTV: UITableView!
    @IBOutlet weak var tvheight: NSLayoutConstraint!
    @IBOutlet weak var topview: UIView!
    
    var passengerArray = ["Srinath","Shashi","Nithesh Sharma","Sudheer Kumar(TL)"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupTV()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func updateUI() {
        tvheight.constant = 4 * 35
        PassengerDetailsTV.reloadData()
    }
    
}


extension PassengerDetailsTVCell:UITableViewDelegate,UITableViewDataSource {
    
    
    func setupTV() {
        
        topview.layer.cornerRadius = 6
        topview.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        PassengerDetailsTV.register(UINib(nibName: "AddPassengerInfoTVCell", bundle: nil), forCellReuseIdentifier: "cell")
        PassengerDetailsTV.delegate = self
        PassengerDetailsTV.dataSource = self
        PassengerDetailsTV.tableFooterView = UIView()
        PassengerDetailsTV.showsHorizontalScrollIndicator = false
        PassengerDetailsTV.separatorStyle = .singleLine
        PassengerDetailsTV.isScrollEnabled = false
        PassengerDetailsTV.separatorStyle = .none
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passengerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var c = UITableViewCell()
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AddPassengerInfoTVCell {
            
            cell.namelbl.text = passengerArray[indexPath.row]
            cell.typelbl.text = "Adult"
            
            if tableView.isLast(for: indexPath) {
                cell.ul.isHidden = true
            }
            
            c = cell
            
        }
        return c
    }
    
}
