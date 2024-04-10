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
                
                self.departureTF.text = defaults.string(forKey: UserDefaultsKeys.calDepDate) ?? "Add Date"
                roundtripView.alpha = 0.5
                
                roundtripView.isHidden = true
                returnTF.text = "Add Date"
                defaults.set("Add Date", forKey: UserDefaultsKeys.calRetDate)
                showdepDatePicker()
                
            }else {
                
                
                self.departureTF.text = defaults.string(forKey: UserDefaultsKeys.calDepDate) ?? "Add Date"
                self.returnTF.text = defaults.string(forKey: UserDefaultsKeys.calRetDate) ?? "Add Date"
                roundtripView.alpha = 1
                roundtripView.isHidden = false
                
                //   showreturndepDatePicker()
                showretDatePicker()
                
                
            }
        }
        
        travellerlbl.text = "\(defaults.string(forKey: UserDefaultsKeys.totalTravellerCount) ?? "1") Traveller, \(defaults.string(forKey: UserDefaultsKeys.selectClass) ?? "Economy")"
        
    }
    
    func setupUI() {
        searchBtn.layer.cornerRadius = 4
        departureTF.setLeftPaddingPoints(35)
        returnTF.setLeftPaddingPoints(35)
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
        flightscount = 1
        onewayRadioImage.image = UIImage(named: "rselect")
        roundtripRadioImage.image = UIImage(named: "runselect")
        roundtripView.isHidden = true
        delegate?.didTapOnOnewayBtnAction(cell: self)
    }
    
    
    
    @IBAction func didTapOnRoundtripBtnAction(_ sender: Any) {
        flightscount = 2
        roundtripRadioImage.image = UIImage(named: "rselect")
        onewayRadioImage.image = UIImage(named: "runselect")
        roundtripView.isHidden = false
        delegate?.didTapOnRoundtripBtnAction(cell: self)
    }
    
    
    
    @IBAction func didTapOnSearchFlightsBtnAction(_ sender: Any) {
        delegate?.didTapOnSearchFlightsBtnAction(cell: self)
    }
    
}

//MARK: - showdepDatePicker
extension SearchFlightsTVCell {
    
    
    
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
                retdepDatePicker.date = calDepDate
            }
            
            
            // Check if returnDate date is smaller than calDepDate date
            if let returnDate = formter.date(from: self.returnTF.text ?? ""),
               returnDate < calDepDate {
                retdepDatePicker.date = calDepDate
                
                // Also update the label to reflect the change
                self.returnTF.text = formter.string(from: calDepDate)
            }
            
            
        }
        
        
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        self.departureTF.inputAccessoryView = toolbar
        self.departureTF.inputView = depDatePicker
        
    }
    
    
    
    //MARK: - showretDatePicker
    func showretDatePicker(){
        //Formate Date
        retDatePicker.datePickerMode = .date
        //        retDatePicker.minimumDate = Date()
        // Set minimumDate for retDatePicker based on depDatePicker or retdepDatePicker
        let selectedDate = self.departureTF.isFirstResponder ? depDatePicker.date : retdepDatePicker.date
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
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        self.returnTF.inputAccessoryView = toolbar
        self.returnTF.inputView = retDatePicker
        
        
    }
    
    
    
    @objc func donedatePicker(){
        delegate?.donedatePicker(cell:self)
    }
    
    
    @objc func cancelDatePicker(){
        delegate?.cancelDatePicker(cell:self)
    }
}
