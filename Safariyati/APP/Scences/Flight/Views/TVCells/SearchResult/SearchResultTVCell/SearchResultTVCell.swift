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
        tvheight.constant = CGFloat(104 * (cellInfo?.characterLimit ?? 0))
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
