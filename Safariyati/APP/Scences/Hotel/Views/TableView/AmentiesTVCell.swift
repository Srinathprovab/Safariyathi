//
//  AmentiesTVCell.swift
//  Safariyati
//
//  Created by appal on 05/08/24.
//

import UIKit

class AmentiesTVCell: TableViewCell, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var holderHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    var amentiesArray = ["Number of floors (main building)","Hairdryer","Transfer Service","Room Service","Bathroom","wi-fi","Laundry service","Business center"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setuTV()
    }
    
    func setuTV() {
        tableView.register(UINib(nibName: "AmentiesLabelTVCell", bundle: nil), forCellReuseIdentifier: "AmentiesLabelTVCell")
        
        tableView.isScrollEnabled = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.showsHorizontalScrollIndicator = false
    }
    
    override func updateUI() {
        holderHeight.constant = CGFloat(amentiesArray.count * 44)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        amentiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AmentiesLabelTVCell") as? AmentiesLabelTVCell {
            // Check if this is the last cell
            cell.titleLabel.text = amentiesArray[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}
