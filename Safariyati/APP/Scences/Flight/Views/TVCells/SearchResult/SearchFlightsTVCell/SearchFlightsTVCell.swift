//
//  SearchFlightsTVCell.swift
//  Safariyati
//
//  Created by FCI on 08/04/24.
//

import UIKit

protocol SearchFlightsTVCellDelagate {
    func didTapOnOnewayBtnAction(cell:SearchFlightsTVCell)
    func didTapOnRoundtripBtnAction(cell:SearchFlightsTVCell)
    func didTapOnSelectFromCityBtnAction(cell:SearchFlightsTVCell)
    func didTapOnSelectToCityBtnAction(cell:SearchFlightsTVCell)
    func didTapOnAddTravellerBtnAction(cell:SearchFlightsTVCell)
    func didTapOnSearchFlightsBtnAction(cell:SearchFlightsTVCell)
    
    func donedatePicker(cell:SearchFlightsTVCell)
    func cancelDatePicker(cell:SearchFlightsTVCell)
    
    func didTapOnDepartureBtnAction(cell:SearchFlightsTVCell)
    func didTapOnReturnBtnAction(cell:SearchFlightsTVCell)
    
}

class SearchFlightsTVCell: TableViewCell {
    
    @IBOutlet weak var fromlbl: UILabel!
    @IBOutlet weak var tolbl: UILabel!
    @IBOutlet weak var departureTF: UITextField!
    @IBOutlet weak var returnTF: UITextField!
    @IBOutlet weak var travellerlbl: UILabel!
    @IBOutlet weak var onewayRadioImage: UIImageView!
    @IBOutlet weak var roundtripRadioImage: UIImageView!
    @IBOutlet weak var roundtripView: UIView!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var depbtn: UIButton!
    @IBOutlet weak var retbtn: UIButton!
    
    
    
    let newdateFormatter = DateFormatter()
    let dateFormat = "dd-MM-yyyy"
    let depDatePicker = UIDatePicker()
    let retdepDatePicker = UIDatePicker()
    let retDatePicker = UIDatePicker()
    
    var delegate:SearchFlightsTVCellDelagate?
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
        if let jtype = defaults.string(forKey: UserDefaultsKeys.journeyType) {
            if jtype == "oneway" {
                
                fromlbl.text = defaults.string(forKey: UserDefaultsKeys.fromcitynamewithcode) ?? "Origin"
                tolbl.text = defaults.string(forKey: UserDefaultsKeys.tocitynamewithcode) ?? "Destination"
                self.departureTF.text = updateIfDateIsPast(dateKey: UserDefaultsKeys.calDepDate, defaultLabel: "Add Date")
                defaults.setValue("Add Date", forKey: UserDefaultsKeys.calRetDate)
                roundtripView.alpha = 0.5
                roundtripView.isHidden = true
                self.returnTF.text = "Add Date"
                showdepDatePicker()
                
            
            }else {
                
                fromlbl.text = defaults.string(forKey: UserDefaultsKeys.fromcitynamewithcode) ?? "Origin"
                tolbl.text = defaults.string(forKey: UserDefaultsKeys.tocitynamewithcode) ?? "Destination"
                self.departureTF.text = updateIfDateIsPast(dateKey: UserDefaultsKeys.calDepDate, defaultLabel: "Add Date")
                self.returnTF.text = updateIfDateIsPast(dateKey: UserDefaultsKeys.calRetDate, defaultLabel: "Add Date")
                roundtripView.alpha = 1
                roundtripView.isHidden = false
                
                showdepDatePicker()
                showretDatePicker()
                
            
                
            }
        }
        
        travellerlbl.text = "\(defaults.string(forKey: UserDefaultsKeys.totalTravellerCount) ?? "1") Traveller, \(defaults.string(forKey: UserDefaultsKeys.selectClass) ?? "Economy")"
        
        
        
        updateLabelColor(label: fromlbl, defaultText: "Origin", defaultColor: .Subtitle1Color, selectedColor: .TitleColor)
        updateLabelColor(label: tolbl, defaultText: "Destination", defaultColor: .Subtitle1Color, selectedColor: .TitleColor)
        updateLabelColor(label: travellerlbl, defaultText: "", defaultColor: .Subtitle1Color, selectedColor: .TitleColor)
        
        
        func updateLabelColor(label: UILabel, defaultText: String, defaultColor: UIColor, selectedColor: UIColor) {
            label.textColor = label.text == defaultText ? defaultColor : selectedColor
        }
        
        
    }
    
    func setupUI() {
        
        //        depbtn.isHidden = false
        //        retbtn.isHidden = false
        
        searchBtn.layer.cornerRadius = 4
        departureTF.setLeftPaddingPoints(35)
        returnTF.setLeftPaddingPoints(35)
        
        newdateFormatter.dateFormat = dateFormat
        newdateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        
        if let jtype = defaults.string(forKey: UserDefaultsKeys.journeyType) {
            if jtype == "oneway" {
                onewaytap()
            }else {
                roundtripTap()
            }
        }
    }
    
    
    @IBAction func didTapOnSelectFromCityBtnAction(_ sender: Any) {
        delegate?.didTapOnSelectFromCityBtnAction(cell: self)
    }
    
    
    @IBAction func didTapOnSelectToCityBtnAction(_ sender: Any) {
        delegate?.didTapOnSelectToCityBtnAction(cell: self)
    }
    
    
    @IBAction func didTapOnAddTravellerBtnAction(_ sender: Any) {
        delegate?.didTapOnAddTravellerBtnAction(cell: self)
    }
    
    
    @IBAction func didTapOnOnewayBtnAction(_ sender: Any) {
        onewaytap()
    }
    
    
    func onewaytap() {
        flightscount = 1
        onewayRadioImage.image = UIImage(named: "rselect")
        roundtripRadioImage.image = UIImage(named: "runselect")
        roundtripView.isHidden = true
        delegate?.didTapOnOnewayBtnAction(cell: self)
    }
    
    
    
    @IBAction func didTapOnRoundtripBtnAction(_ sender: Any) {
        roundtripTap()
    }
    
    
    func roundtripTap() {
        flightscount = 2
        roundtripRadioImage.image = UIImage(named: "rselect")
        onewayRadioImage.image = UIImage(named: "runselect")
        roundtripView.isHidden = false
        delegate?.didTapOnRoundtripBtnAction(cell: self)
    }
    
    
    
    @IBAction func didTapOnSearchFlightsBtnAction(_ sender: Any) {
        delegate?.didTapOnSearchFlightsBtnAction(cell: self)
    }
    
    
    
    @IBAction func didTapOnDepartureBtnAction(_ sender: Any) {
        delegate?.didTapOnDepartureBtnAction(cell: self)
    }
    
    
    @IBAction func didTapOnReturnBtnAction(_ sender: Any) {
        delegate?.didTapOnReturnBtnAction(cell: self)
    }
    
}




extension SearchFlightsTVCell {
    
    
    //MARK: - showdepDatePicker
    func showdepDatePicker(){
        //Formate Date
        depDatePicker.datePickerMode = .date
        depDatePicker.minimumDate = Date()
        depDatePicker.preferredDatePickerStyle = .wheels
        
        let formter = DateFormatter()
        formter.dateFormat = "dd-MM-yyyy"
        
        
        if let calDepDate = formter.date(from: defaults.string(forKey: UserDefaultsKeys.calDepDate) ?? "") {
            depDatePicker.date = calDepDate
            
            if self.returnTF.text == "Add Date" {
                retDatePicker.date = calDepDate
            }
            
            
            // Check if returnDate date is smaller than calDepDate date
            if let returnDate = formter.date(from: self.returnTF.text ?? ""),
               returnDate < calDepDate {
                retDatePicker.date = calDepDate
                
                // Also update the label to reflect the change
                self.returnTF.text = formter.string(from: calDepDate)
            }
            
            
        }
        
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        
        let label = UILabel()
        label.text = "Departure Date" // Initial text, can be changed dynamically
        label.sizeToFit()
        label.font = .poppinsMedium(size: 16)
        let labelButton = UIBarButtonItem(customView: label)
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbar.setItems([doneButton,flexibleSpace,flexibleSpace,labelButton,flexibleSpace,flexibleSpace, cancelButton], animated: false)
        
        
        
        self.departureTF.inputAccessoryView = toolbar
        self.departureTF.inputView = depDatePicker
        
    }
    
    
    //MARK: - showretDatePicker
    func showretDatePicker(){
        //Formate Date
        retDatePicker.datePickerMode = .date
        //        retDatePicker.minimumDate = Date()
        // Set minimumDate for retDatePicker based on depDatePicker or retDatePicker
        let selectedDate = self.departureTF.isFirstResponder ? depDatePicker.date : depDatePicker.date
        retDatePicker.minimumDate = selectedDate
        
        retDatePicker.preferredDatePickerStyle = .wheels
        
        
        let formter = DateFormatter()
        formter.dateFormat = "dd-MM-yyyy"
        
        
        
        
        
        if let calDepDate = formter.date(from: defaults.string(forKey: UserDefaultsKeys.calDepDate) ?? "") {
            
            if self.returnTF.text == "Add Date" {
                retDatePicker.date = calDepDate
                
            }else {
                if let rcalRetDate = formter.date(from: defaults.string(forKey: UserDefaultsKeys.calRetDate) ?? "") {
                    retDatePicker.date = rcalRetDate
                }
            }
        }
        
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        
        let label = UILabel()
        label.text = "Return Date" // Initial text, can be changed dynamically
        label.sizeToFit()
        label.font = .poppinsMedium(size: 16)
        let labelButton = UIBarButtonItem(customView: label)
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbar.setItems([doneButton,flexibleSpace,flexibleSpace,labelButton,flexibleSpace,flexibleSpace, cancelButton], animated: false)
        
        
        self.returnTF.inputAccessoryView = toolbar
        self.returnTF.inputView = retDatePicker
        
        
        //self.returnTF.becomeFirstResponder()
        
    }
    
    
    @objc func donedatePicker(){
        delegate?.donedatePicker(cell:self)
    }
    
    
    @objc func cancelDatePicker(){
        delegate?.cancelDatePicker(cell:self)
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
