//
//  SelectFareTVCell.swift
//  Safariyati
//
//  Created by FCI on 11/04/24.
//

import UIKit

class SelectFareTVCell: TableViewCell {
    
    
    @IBOutlet weak var selectFareTV: UITableView!
    @IBOutlet weak var tvHeight: NSLayoutConstraint!
    
    var fareTitleArray = ["Economy light","ECONOMY sMART","Economy Flex"]
    
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
        tvHeight.constant = CGFloat(350 * (fareTitleArray.count ))
        selectFareTV.reloadData()
    }
    
    func setupUI() {
        setupTV()
    }
}


extension SelectFareTVCell:UITableViewDelegate,UITableViewDataSource {
    
    
    
    func setupTV() {
        selectFareTV.register(UINib(nibName: "AddFareInfoTVCell", bundle: nil), forCellReuseIdentifier: "cell")
        selectFareTV.delegate = self
        selectFareTV.dataSource = self
        selectFareTV.tableFooterView = UIView()
        selectFareTV.showsHorizontalScrollIndicator = false
        selectFareTV.separatorStyle = .singleLine
        selectFareTV.isScrollEnabled = false
        selectFareTV.separatorStyle = .none
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fareTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var c = UITableViewCell()
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AddFareInfoTVCell {
            
            cell.titlelbl.text = fareTitleArray[indexPath.row]
            
            if indexPath.row == 0 {
                
                // Select the first row initially
                let indexPath = IndexPath(row: 0, section: 0)
                selectFareTV.selectRow(at: indexPath, animated: false, scrollPosition: .none)
                
                
                cell.img.image = UIImage(named: "rselect")?.withRenderingMode(.alwaysOriginal).withTintColor(.Buttoncolor)
            }
            
            c = cell
            
        }
        return c
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? AddFareInfoTVCell {
            cell.img.image = UIImage(named: "rselect")?.withRenderingMode(.alwaysOriginal).withTintColor(.Buttoncolor)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? AddFareInfoTVCell {
            cell.img.image = UIImage(named: "runselect")?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    
    
    
}
