//
//  SearchResultTVCell.swift
//  Safariyati
//
//  Created by FCI on 10/04/24.
//

import UIKit
protocol SearchResultTVCellDelegate {
    func didTapOnSelectFareBtnAction(cell:SearchResultTVCell)
    func didTapOnFlightDetailsBtnAction(cell:SearchResultTVCell)
    func didTapOnMoreSimilarResults(cell:SearchResultTVCell)
}

class SearchResultTVCell: TableViewCell {
    
    @IBOutlet weak var kwdlbl: UILabel!
    @IBOutlet weak var flightinfoTV: UITableView!
    @IBOutlet weak var tvheight: NSLayoutConstraint!
    @IBOutlet weak var moreSamePricelbl: UILabel!
    @IBOutlet weak var refundablelbl: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var refundablebottomView: UIView!
    
    
    var selectedresult = String()
    var bookingsource = String()
    var newsimilarList = [[J_flight_list]]()
    var jflightlist :J_flight_list?
    var flightlist = [Summary]()
    var delegate:SearchResultTVCellDelegate?
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
        
        jflightlist = cellInfo?.moreData as? J_flight_list
        flightlist = jflightlist?.flight_details?.summary ?? []
        selectedresult = jflightlist?.selectedResult ?? ""
        bookingsource = jflightlist?.booking_source_key ?? ""

        
        
       //
        
        if cellInfo?.key == "similar" {
            bottomView.isHidden = true
            updatHeight(height: 98)
        }else {
           
            updatHeight(height: 104)
            
            let similarlist = cellInfo?.data as? [[J_flight_list]]
            newsimilarList = similarlist ?? [[]]
            moreSamePricelbl.text = "More similar options(\((similarlist?.count ?? 0) - 1))"
            let count = ((similarlist?.count ?? 0) - 1)
            bottomView.isHidden = true
            if count != 0 {
                bottomView.isHidden = false
            }
            
           // checkSimelarFlights()
        }
        bottomView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        bottomView.layer.cornerRadius = 6
        
        
    }
    
    
    func updatHeight(height:Int) {
        tvheight.constant = CGFloat(height * flightlist.count)
        flightinfoTV.reloadData()
    }
    
    func setupUI() {
      
        setupTV()
    }
    
    
    @IBAction func didTapOnSelectFareBtnAction(_ sender: Any) {
        delegate?.didTapOnSelectFareBtnAction(cell: self)
    }
    
    @IBAction func didTapOnFlightDetailsBtnAction(_ sender: Any) {
        delegate?.didTapOnFlightDetailsBtnAction(cell: self)
    }
    
    @IBAction func didTapOnMoreSimilarResults(_ sender: Any) {
        delegate?.didTapOnMoreSimilarResults(cell: self)
    }
    
    
}


extension SearchResultTVCell:UITableViewDelegate,UITableViewDataSource {
    
    
    
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
        return flightlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var c = UITableViewCell()
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? AddFlightInfoTVCell {
            
            
            
            let data = flightlist[indexPath.row]
            
            cell.opratorImg.sd_setImage(with: URL(string: data.operator_image ?? ""),
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
            
            
            cell.flightnolbl.text = "\(data.operator_code ?? "") - \(data.flight_number ?? "")"
            self.kwdlbl.text = "\(jflightlist?.price?.api_currency ?? "") \(String(format: "%.2f", jflightlist?.price?.api_total_display_fare ?? 0.0))"
            
            cell.fromtimelbl.text = data.origin?.time ?? ""
            cell.totimelbl.text = data.destination?.time ?? ""
            
            cell.fromcitycodelbl.text = data.origin?.loc ?? ""
            cell.tocitycodelbl.text = data.destination?.loc ?? ""
            
            cell.stopslbl.text = {
                switch data.no_of_stops ?? 0 {
                case 0:
                    return "Non Stops"
                case 1:
                    return "1 Stop"
                default:
                    return "1+ Stops"
                }
            }()

            
            if jflightlist?.refundable == true {
                self.refundablelbl.text = "Refundable"
                self.refundablelbl.textColor = .Refundcolor
            }else {
                self.refundablelbl.text = "Non Refundable"
                self.refundablelbl.textColor = .Buttoncolor
            }
            
            
            
            
            
            
            if tableView.isLast(for: indexPath) {
                cell.flightimg.image = UIImage(named: "fcome")
            }
            
            c = cell
            
        }
        return c
    }
    
}




//MARK: - hideSimilarlbl showSimilarlbl
extension SearchResultTVCell {
    
    
    
    func checkSimelarFlights() {
        
        if let similarList1 = cellInfo?.data as? [[J_flight_list]] {
            newsimilarList = similarList1
            let similarListCount = similarList1.count
            
            // Debugging: Print the count of similarList1
            
            if similarListCount > 1 {
                
                if similarListCount == 1 {
                    hideSimilarlbl()
                }else {
                   
                    showSimilarlbl()
                }
                
                //showSimilarlbl()
            } else {
                hideSimilarlbl()
            }
        }else {
            hideSimilarlbl() // Handle the case when cellInfo?.data is not a valid [[J_flight_list]]
        }
        
        
    }
    
    
    
    func hideSimilarlbl(){
        bottomView.isHidden = false
        //        moreSimilarBtn.isHidden = true
        //        moreSimilarImage.isHidden = true
    }
    
    func showSimilarlbl(){
        bottomView.isHidden = false
        //        moreSimilarBtn.isHidden = false
        //        moreSimilarImage.isHidden = false
    }
    
    
    
    //    func setAttributedString1(str1:String) {
    //
    //        let atter1 = [NSAttributedString.Key.foregroundColor:UIColor.BackBtnColor,NSAttributedString.Key.font:UIFont.InterMedium(size: 11),NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue] as [NSAttributedString.Key : Any]
    //
    //
    //        let atterStr1 = NSMutableAttributedString(string: str1, attributes: atter1)
    //
    //
    //        let combination = NSMutableAttributedString()
    //        combination.append(atterStr1)
    //
    //        strikekwdlbl.attributedText = combination
    //
    //    }
    
}
