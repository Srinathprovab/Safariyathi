//
//  FareFamilyTVCell.swift
//  Safariyati
//
//  Created by Admin on 19/09/24.
//

import UIKit

class FareFamilyTVCell: TableViewCell {
    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var fareinfotv: UITableView!
    @IBOutlet weak var tvheight: NSLayoutConstraint!
    
    
    
    var farebreckdowntitleArray = ["chd_base_price".uppercased(),"chd_base_price".uppercased(),"inf_tax".uppercased(),"chd_no".uppercased(),"adt_price".uppercased(),"inf_base_price".uppercased(),"adt_base_price".uppercased(),"adt_no".uppercased(),"chd_price".uppercased(),"chd_tax".uppercased(),"inf_no".uppercased(),"inf_total".uppercased(),"adt_total".uppercased(),"inf_price".uppercased(),"chd_total".uppercased(),"adt_tax".uppercased()]
    var count = 1
    var paxArray = ["Adults"]
    var free = [String]()
    var chargeable = [String]()
    var farebreckdown = [Farebreckdown]()
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
        setuplabels(lbl: titlelbl, text: "", textcolor: .ApplabelColor, font: .InterBold(size: 16), align: .center)
        setupTV()
        
    }
    
    
    override func updateUI() {
        
        if cellInfo?.key == "free" {
            free = cellInfo?.moreData as? [String] ?? []
            count = free.count
        }else if cellInfo?.key == "farebreckdown" {
            farebreckdown = cellInfo?.moreData as? [Farebreckdown] ?? []
            count = farebreckdown.count
        }else{
            chargeable = cellInfo?.moreData as? [String] ?? []
            count = chargeable.count
        }
        
        updateHeight()
    }
    
    func updateHeight() {
        tvheight.constant = CGFloat(count * 50)
        fareinfotv.reloadData()
    }
    
}



extension FareFamilyTVCell:UITableViewDelegate, UITableViewDataSource {
    
    func setupTV() {
        fareinfotv.delegate = self
        fareinfotv.dataSource = self
        fareinfotv.register(UINib(nibName: "AddInfoFareTVCell", bundle: nil), forCellReuseIdentifier: "cell")
        fareinfotv.register(UINib(nibName: "AddInfoFareTVCell", bundle: nil), forCellReuseIdentifier: "cell1")
        fareinfotv.isScrollEnabled = false
        fareinfotv.separatorStyle = .none
        fareinfotv.allowsMultipleSelection = true
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var ccell = UITableViewCell()
        
        
        
        if cellInfo?.key == "free" {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AddInfoFareTVCell {
                cell.selectionStyle = .none
                self.titlelbl.text = "Free"
                let data = free[indexPath.row]
                cell.titlelbl.text = data
                cell.subtitleview.isHidden = true
                
                
                if tableView.isLast(for: indexPath) {
                    cell.bottomview1.isHidden = true
                    cell.bottomview2.isHidden = true
                }
                
                ccell = cell
            }
        }else if cellInfo?.key == "farebreckdown" {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AddInfoFareTVCell {
                cell.selectionStyle = .none
                self.titlelbl.text = "Fare Breckdown"
                let data = farebreckdown[indexPath.row]
                let data1 = farebreckdowntitleArray[indexPath.row]
                cell.titlelbl.text = data1
                cell.subtitlelbl.text = data.chd_tax
                
                
               

                
                
                if tableView.isLast(for: indexPath) {
                    cell.bottomview1.isHidden = true
                    cell.bottomview2.isHidden = true
                }
                
                ccell = cell
            }
        }else{
            if let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as? AddInfoFareTVCell {
                cell.selectionStyle = .none
                self.titlelbl.text = "Chargeable"
                let data = chargeable[indexPath.row]
                cell.titlelbl.text = data
                cell.subtitleview.isHidden = true
                
                if tableView.isLast(for: indexPath) {
                    cell.bottomview1.isHidden = true
                    cell.bottomview2.isHidden = true
                }
                
                ccell = cell
            }
        }
        
        return ccell
    }
    
    
    
}
