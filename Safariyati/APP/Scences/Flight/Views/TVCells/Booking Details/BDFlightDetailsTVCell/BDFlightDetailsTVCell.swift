//
//  BDFlightDetailsTVCell.swift
//  Safariyati
//
//  Created by FCI on 11/04/24.
//

import UIKit

class BDFlightDetailsTVCell: TableViewCell {
    
    @IBOutlet weak var fareTypelbl: UILabel!
    @IBOutlet weak var flightinfoTV: UITableView!
    @IBOutlet weak var tvheight: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func updateUI() {
        tvheight.constant = CGFloat(104 * (cellInfo?.characterLimit ?? 0))
        flightinfoTV.reloadData()
    }
    
    func setupUI() {
        setupTV()
    }
    
    
    
}


extension BDFlightDetailsTVCell:UITableViewDelegate,UITableViewDataSource {
    
    
    
    func setupTV() {
        flightinfoTV.register(UINib(nibName: "AddFlightInfoTVCell", bundle: nil), forCellReuseIdentifier: "cell")
        flightinfoTV.delegate = self
        flightinfoTV.dataSource = self
        flightinfoTV.tableFooterView = UIView()
        flightinfoTV.showsHorizontalScrollIndicator = false
        flightinfoTV.separatorStyle = .singleLine
        flightinfoTV.isScrollEnabled = false
        flightinfoTV.separatorStyle = .none
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellInfo?.characterLimit ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var c = UITableViewCell()
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AddFlightInfoTVCell {
            
            if tableView.isLast(for: indexPath) {
                cell.flightimg.image = UIImage(named: "fcome")
            }
            
            c = cell
            
        }
        return c
    }
    
}
