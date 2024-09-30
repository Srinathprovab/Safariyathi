//
//  SearchHotelTVCell.swift
//  Safariyati
//
//  Created by appal on 02/08/24.
//

import UIKit

protocol SearchHotelTVCellDelegate: AnyObject {
    func didtaponSearchBtn(cell: SearchHotelTVCell)
    func didtapAddRoomBtn(cell: SearchHotelTVCell)
    func didTapOnSearchLocationCityBtnAction(cell: SearchHotelTVCell)
}


class SearchHotelTVCell: TableViewCell {
    
    @IBOutlet weak var cityNameTitleLabel: UILabel!
    @IBOutlet weak var nightLabel: UILabel!
    @IBOutlet weak var nightstitlelabel: UILabel!
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var locationCitylbl: UILabel!
    @IBOutlet weak var checkinTitlelbl: UILabel!
    @IBOutlet weak var checkinlbl: UILabel!
    @IBOutlet weak var checkoutTitlelbl: UILabel!
    @IBOutlet weak var checkoutlbl: UILabel!
    @IBOutlet weak var addRoomsTitlelbl: UILabel!
    @IBOutlet weak var addRoomsValuelbl: UILabel!
    @IBOutlet weak var addRoomsBtn: UIButton!
    @IBOutlet weak var searchHotelBtn: UIButton!
    @IBOutlet weak var searchHotelCityBtn: UIButton!
    @IBOutlet weak var nationalitylbl: UILabel!
    @IBOutlet weak var nationalityValuelbl: UILabel!
    @IBOutlet weak var nationalityBtn: UIButton!
    @IBOutlet weak var nationalityTf: UITextField!
    
    @IBOutlet weak var checkinTF: UITextField!
    @IBOutlet weak var checkoutTF: UITextField!
    
    
    let newdateFormatter = DateFormatter()
    let dateFormat = "dd-MM-yyyy"
    let depDatePicker = UIDatePicker()
    let retdepDatePicker = UIDatePicker()
    let retDatePicker = UIDatePicker()
    weak var delegate:  SearchHotelTVCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    
    
    override func updateUI() {
        
        
        if defaults.string(forKey: UserDefaultsKeys.locationcity) != nil  {
            locationCitylbl.text = defaults.string(forKey: UserDefaultsKeys.locationcity)
            locationCitylbl.textColor = .ApplabelColor
        }else {
            locationCitylbl.text = "Enter City Name"
            locationCitylbl.textColor = .subtitle1
        }
        
        if defaults.string(forKey: UserDefaultsKeys.checkin) != nil  {
            checkinlbl.text = defaults.string(forKey: UserDefaultsKeys.checkin)
            checkinlbl.textColor = .ApplabelColor
        }else {
            checkinlbl.text = "Add Check In Date"
            checkinlbl.textColor = .subtitle1
        }
        
        if defaults.string(forKey: UserDefaultsKeys.checkout) != nil  {
            checkoutlbl.text = defaults.string(forKey: UserDefaultsKeys.checkout)
            checkoutlbl.textColor = .ApplabelColor
        }else {
            checkoutlbl.text = "Add Check Out Date"
            checkoutlbl.textColor = .subtitle1
        }
        
    }
    
    
    
    func setUpView() {
        searchHotelBtn.layer.cornerRadius = 8
        searchHotelBtn.setTitle("Search Hotel", for: .normal)
        searchHotelBtn.titleLabel?.font = .InterMedium(size: 16)
        setupLabel(lbl: cityNameTitleLabel, textcolor: .TitleColor, font: .InterMedium(size: 14))
        setupLabel(lbl: checkinTitlelbl, textcolor: .TitleColor, font: .InterMedium(size: 14))
        setupLabel(lbl: checkoutTitlelbl, textcolor: .TitleColor, font: .InterMedium(size: 14))
        setupLabel(lbl: addRoomsTitlelbl, textcolor: .TitleColor, font: .InterMedium(size: 14))
        setupLabel(lbl: nationalitylbl, textcolor: .TitleColor, font: .InterMedium(size: 14))
        setupLabel(lbl: nightstitlelabel, textcolor: .TitleColor, font: .InterMedium(size: 14))
        setupLabels(lbl: locationCitylbl, text: "Enter City Name", textcolor: .SubTitleColor, font: .InterMedium(size: 14))
        setupLabels(lbl: checkinlbl, text: "Add Check In Date", textcolor: .SubTitleColor, font: .InterMedium(size: 14))
        setupLabels(lbl: checkoutlbl, text: "Add Check Out Date", textcolor: .SubTitleColor, font: .InterMedium(size: 14))
        setupLabel(lbl: addRoomsValuelbl, textcolor: .TitleColor, font: .InterMedium(size: 14))
        setupLabels(lbl: nationalityValuelbl, text: "Select Nationality", textcolor: .TitleColor, font: .InterMedium(size: 14))
        setupLabels(lbl: nightLabel, text: "1", textcolor: .TitleColor, font: .InterMedium(size: 14))
        
        setupInitialsInput(lbl: locationCitylbl, str: "Enter City Name")
        searchHotelCityBtn.addTarget(self, action: #selector(didTapOnSearchLocationCityBtnAction(_:)), for: .touchUpInside)
        
        
        showCheckInDatePicjer()
        showCheckOutDatePicjer()
        
    }
    
    
    func setupInitialsInput(lbl:UILabel,str:String){
        if lbl.text == str {
            lbl.textColor = .SubTitleColor
        }else {
            lbl.textColor = .TitleColor
        }
    }
    
    
    @objc func didTapOnSearchLocationCityBtnAction(_ sender:UIButton) {
        delegate?.didTapOnSearchLocationCityBtnAction(cell: self)
    }
    
    
    @IBAction func SearchbtnAction(_ sender: Any) {
        delegate?.didtaponSearchBtn(cell: self)
    }
    
    @IBAction func addAdultAndRoomsButtonTapped(_ sender: Any) {
        delegate?.didtapAddRoomBtn(cell: self)
    }
}



extension SearchHotelTVCell {
    
    
    //MARK: - showCheckInDatePicjer
    func showCheckInDatePicjer(){
        //Formate Date
        depDatePicker.datePickerMode = .date
        depDatePicker.minimumDate = Date()
        depDatePicker.preferredDatePickerStyle = .wheels
        
        let formter = DateFormatter()
        formter.dateFormat = "dd-MM-yyyy"
        
        
        if let calDepDate = formter.date(from: defaults.string(forKey: UserDefaultsKeys.checkin) ?? "") {
            depDatePicker.date = calDepDate
            
            if self.checkoutTF.text == "Add Check Out Date" {
                retDatePicker.date = calDepDate
            }
            
            
            // Check if returnDate date is smaller than calDepDate date
            if let returnDate = formter.date(from: self.checkoutTF.text ?? ""),
               returnDate < calDepDate {
                retDatePicker.date = calDepDate
                
                // Also update the label to reflect the change
                self.checkoutTF.text = formter.string(from: calDepDate)
            }
            
            
        }
        
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        
        let label = UILabel()
        label.text = "CheckIn Date" // Initial text, can be changed dynamically
        label.sizeToFit()
        label.font = .poppinsMedium(size: 16)
        let labelButton = UIBarButtonItem(customView: label)
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbar.setItems([doneButton,flexibleSpace,flexibleSpace,labelButton,flexibleSpace,flexibleSpace, cancelButton], animated: false)
        
        
        
        self.checkinTF.inputAccessoryView = toolbar
        self.checkinTF.inputView = depDatePicker
        
    }
    
    
    //MARK: - showretDatePicker
    func showCheckOutDatePicjer(){
        //Formate Date
        retDatePicker.datePickerMode = .date
        //        retDatePicker.minimumDate = Date()
        // Set minimumDate for retDatePicker based on depDatePicker or retDatePicker
        let selectedDate = self.checkinTF.isFirstResponder ? depDatePicker.date : depDatePicker.date
        retDatePicker.minimumDate = selectedDate
        
        retDatePicker.preferredDatePickerStyle = .wheels
        
        
        let formter = DateFormatter()
        formter.dateFormat = "dd-MM-yyyy"
        
        
        
        
        
        if let calDepDate = formter.date(from: defaults.string(forKey: UserDefaultsKeys.checkin) ?? "") {
            
            if self.checkoutTF.text == "Add Check Out Date" {
                retDatePicker.date = calDepDate
                
            }else {
                if let rcalRetDate = formter.date(from: defaults.string(forKey: UserDefaultsKeys.checkout) ?? "") {
                    retDatePicker.date = rcalRetDate
                }
            }
        }
        
     
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        let label = UILabel()
        label.text = "Check Out Date" // Initial text, can be changed dynamically
        label.sizeToFit()
        label.font = .poppinsMedium(size: 16)
        let labelButton = UIBarButtonItem(customView: label)
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbar.setItems([doneButton,flexibleSpace,flexibleSpace,labelButton,flexibleSpace,flexibleSpace, cancelButton], animated: false)
        
        
        self.checkoutTF.inputAccessoryView = toolbar
        self.checkoutTF.inputView = retDatePicker
        
        
        //self.returnTF.becomeFirstResponder()
        
    }
    
    
    @objc func donedatePicker(){
        checkinTF.resignFirstResponder()
        checkoutTF.resignFirstResponder()
    }
    
    
    @objc func cancelDatePicker(){
        checkinTF.resignFirstResponder()
        checkoutTF.resignFirstResponder()
    }
    
    
    //MARK: - updateIfDateIsPast
    func updateIfDateIsPast(dateKey: String, defaultLabel: String) -> String {
        if let dateString = defaults.string(forKey: dateKey),
           let storedDate = newdateFormatter.date(from: dateString) {
            if storedDate < Date() {
                // Update to today's date if the stored date is in the past
                let todayDateString = newdateFormatter.string(from: Date())
                defaults.set(todayDateString, forKey: dateKey)
                return todayDateString
            } else {
                // Return the stored date if it's not in the past
                return dateString
            }
        } else {
            // If the date is not set, update to today's date
            let todayDateString = newdateFormatter.string(from: Date())
            defaults.set(todayDateString, forKey: dateKey)
            return todayDateString
        }
    }
}
