//
//  AddFlightltineraryTVCell.swift
//  Safariyati
//
//  Created by FCI on 11/04/24.
//

import UIKit

class AddFlightltineraryTVCell: TableViewCell {

    
    @IBOutlet weak var AddFlightltineraryTV: UITableView!
    @IBOutlet weak var tvHeight: NSLayoutConstraint!
    
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
        tvHeight.constant = CGFloat(240 * (cellInfo?.characterLimit ?? 0))
        AddFlightltineraryTV.reloadData()
    }
    
    func setupUI() {
        setupTV()
    }
}


extension AddFlightltineraryTVCell:UITableViewDelegate,UITableViewDataSource {
    
    
    
    func setupTV() {
        AddFlightltineraryTV.register(UINib(nibName: "AddFlightltineraryInfoTVCell", bundle: nil), forCellReuseIdentifier: "cell")
        AddFlightltineraryTV.delegate = self
        AddFlightltineraryTV.dataSource = self
        AddFlightltineraryTV.tableFooterView = UIView()
        AddFlightltineraryTV.showsHorizontalScrollIndicator = false
        AddFlightltineraryTV.separatorStyle = .singleLine
        AddFlightltineraryTV.isScrollEnabled = false
        AddFlightltineraryTV.separatorStyle = .none
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellInfo?.characterLimit ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var c = UITableViewCell()
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AddFlightltineraryInfoTVCell {
            
            if tableView.isLast(for: indexPath) {
                cell.titlelbl.text = "Kuwait- Dubai"
            }
            
            c = cell
            
        }
        return c
    }
    
}
