//
//  UserSpecificationTVCell.swift
//  Safariyati
//
//  Created by appal on 06/08/24.
//

import UIKit

class UserSpecificationTVCell:TableViewCell, UITextViewDelegate {
    
    
    @IBOutlet weak var specificationTV: UITableView!
    @IBOutlet weak var tvHeight: NSLayoutConstraint!
    @IBOutlet weak var yourTextView: UITextView!
    
    
    let placeholderText = "Would you like to add a comment or request to your booking?"
    let placeholderColor = UIColor.lightGray
//    var specificationArray = userspecification
    var SelectedSpecificationArray = [String]()
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
        tvHeight.constant = CGFloat((userspecificationArray.count ?? 0) * 44)
        specificationTV.reloadData()
        
    }
    
    
    func setupUI(){
        
        yourTextView.delegate = self
        yourTextView.text = placeholderText
        yourTextView.textColor = UIColor.lightGray
        
        yourTextView.layer.cornerRadius = 4
        yourTextView.layer.borderWidth = 1
        yourTextView.layer.borderColor = UIColor.BorderColor.cgColor
        
        setupTV()
    }
    
    
    func textViewDidChange(descriptionField: UITextView) {
        if yourTextView.text.isEmpty == false {
            yourTextView.text = ""
        } else {
            yourTextView.text = placeholderText
        }
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {

        if yourTextView.textColor == UIColor.lightGray {
            yourTextView.text = ""
            yourTextView.textColor = UIColor.black
        }
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {

        if yourTextView.text == "" {

            yourTextView.text = placeholderText
            yourTextView.textColor = UIColor.lightGray
        }
    }
    
}


extension UserSpecificationTVCell:UITableViewDelegate, UITableViewDataSource {
    
    func setupTV() {
        specificationTV.delegate = self
        specificationTV.dataSource = self
        specificationTV.register(UINib(nibName: "UserSpecificationOptionsTVCell", bundle: nil), forCellReuseIdentifier: "cell")
        specificationTV.isScrollEnabled = false
        specificationTV.separatorStyle = .none
        specificationTV.allowsMultipleSelection = true
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userspecificationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var ccell = UITableViewCell()
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? UserSpecificationOptionsTVCell {
            cell.selectionStyle = .none
            cell.titlelbl.text = userspecificationArray[indexPath.row]
            ccell = cell
        }
        
        return ccell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? UserSpecificationOptionsTVCell {
            cell.chkImg.image =   UIImage(named: "filterCheck")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.Farecolor)
//            if !SelectedSpecificationArray.contains(cell.titlelbl.text ?? "") {
//                SelectedSpecificationArray.append(cell.titlelbl.text ?? "")
//            }
//            
//            
//            let data = userspecificationArray?[indexPath.row]
//            specificationArray.append(data?.id ?? "")
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? UserSpecificationOptionsTVCell {
            cell.chkImg.image = UIImage(named: "grayCheckbox")?.withRenderingMode(.alwaysOriginal)
            
//            if let deselectedItemIndex = SelectedSpecificationArray.firstIndex(of: cell.titlelbl.text ?? "") {
//                SelectedSpecificationArray.remove(at: deselectedItemIndex)
//            }
            
//            let data = userspecificationArray?[indexPath.row]
//            let unselectedItem = data?.id ?? ""
//            if let index = specificationArray.firstIndex(of: unselectedItem) {
//                print("index is: \(index)")
//                specificationArray.remove(at: index)
//            }
//            print("UnSelected items: \(specificationArray)")
            
        }
        
        
    }
    
    
    
}
