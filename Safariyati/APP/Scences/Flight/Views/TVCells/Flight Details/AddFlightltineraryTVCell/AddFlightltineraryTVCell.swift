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
    
    
    
    var fdetails = [FlightDetails]()
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
        fdetails = cellInfo?.moreData as? [FlightDetails] ?? []
        tvHeight.constant = CGFloat(244 * (fdetails.count))
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
        return fdetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var c = UITableViewCell()
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AddFlightltineraryInfoTVCell {
            
            let data = fdetails[indexPath.row]
            
           
            cell.opimage.sd_setImage(with: URL(string: data.operator_image ?? ""),
                                     placeholderImage: UIImage(named: "placeholder.png"), options: [.retryFailed], completed: { (image, error, cacheType, imageURL) in
                if let error = error {
                    print("Error loading banner image: \(error.localizedDescription)")
                    if (error as NSError).code == NSURLErrorBadServerResponse {
                        cell.opimage.image = UIImage(named: "noimage")
                    } else {
                        cell.opimage.image = UIImage(named: "noimage")
                    }
                }
            })
            
            cell.airlinenamelbl.text = "\(data.operator_name ?? "") \(data.operator_code ?? "") - \(data.flight_number ?? "")"
            cell.fromcity.text = "\(data.origin?.city ?? "") (\(data.origin?.loc ?? ""))"
            cell.fromairport.text = data.origin?.airport_name ?? ""
            cell.fromterminal.text = data.origin?.terminal ?? ""
            cell.tocity.text = "\(data.destination?.city ?? "") (\(data.origin?.loc ?? ""))"
            cell.toairport.text = data.destination?.airport_name ?? ""
            cell.toterminal.text = data.destination?.terminal ?? ""
            cell.hourslbl.text = data.duration
            
            
            
            if cell.fromterminal.text?.isEmpty == true {
                cell.fromterminal.text = "Terminal: TBC"
            }
            
            if cell.toterminal.text?.isEmpty == true {
                cell.toterminal.text = "Terminal: TBC"
            }
            
            
            if tableView.isLast(for: indexPath) {
                cell.layoverView.isHidden = true
            }
            
            
            
            c = cell
            
        }
        return c
    }
    
}
