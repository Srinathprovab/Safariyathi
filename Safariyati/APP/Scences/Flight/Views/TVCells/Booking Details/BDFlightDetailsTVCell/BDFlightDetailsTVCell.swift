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
    
    
    var flightdata : Flight_data?
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
        flightdata = cellInfo?.moreData as? Flight_data
        self.fareTypelbl.text = flightdata?.refundable == true ? "Refundable":"Non Refundable"
        self.fareTypelbl.textColor = flightdata?.refundable == true ? UIColor.Farecolor:UIColor.Buttoncolor
        
        tvheight.constant = CGFloat(104 * (flightdata?.flight_details?.summary?.count ?? 0))
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
        return flightdata?.flight_details?.summary?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var c = UITableViewCell()
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AddFlightInfoTVCell {
            
            
            
            let data = flightdata?.flight_details?.summary?[indexPath.row]
            
            cell.opratorImg.sd_setImage(with: URL(string: data?.operator_image ?? ""),
                                        placeholderImage: UIImage(named: "placeholder.png"), options: [.retryFailed], completed: { (image, error, cacheType, imageURL) in
                if let error = error {
                    print("Error loading banner image: \(error.localizedDescription)")
                    if (error as NSError).code == NSURLErrorBadServerResponse {
                        cell.opratorImg.image = UIImage(named: "noimage")
                    } else {
                        cell.opratorImg.image = UIImage(named: "noimage")
                    }
                }
            })
            
            
            cell.flightnolbl.text = "\(data?.operator_code ?? "") - \(data?.flight_number ?? "")"
            
            cell.fromtimelbl.text = data?.origin?.time ?? ""
            cell.totimelbl.text = data?.destination?.time ?? ""
            
            cell.fromcitycodelbl.text = data?.origin?.loc ?? ""
            cell.tocitycodelbl.text = data?.destination?.loc ?? ""
            
            cell.stopslbl.text = {
                switch data?.no_of_stops ?? 0 {
                case 0:
                    return "Non Stops"
                case 1:
                    return "1 Stop"
                default:
                    return "1+ Stops"
                }
            }()

            
//            if jflightlist?.refundable == true {
//                self.fareTypelbl.text = "Refundable"
//                self.fareTypelbl.textColor = .Refundcolor
//            }else {
//                self.fareTypelbl.text = "Non Refundable"
//                self.fareTypelbl.textColor = .Buttoncolor
//            }
            
            
            
            
            
            
            if tableView.isLast(for: indexPath) {
                cell.flightimg.image = UIImage(named: "fcome")
            }
            
            c = cell
            
        }
        return c
    }
    
}
