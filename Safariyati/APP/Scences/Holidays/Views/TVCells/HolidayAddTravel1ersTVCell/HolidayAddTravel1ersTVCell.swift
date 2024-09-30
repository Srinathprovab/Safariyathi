//
//  HolidayAddTravel1ersTVCell.swift
//  Safariyati
//
//  Created by Admin on 24/09/24.
//

import UIKit

protocol HolidayAddTravel1ersTVCellDelegate:AnyObject {
    func didTapOnSendInquiryBtnAction(cell:HolidayAddTravel1ersTVCell)
    func didTapOnTravellerBtnAction(cell:HolidayAddTravel1ersTVCell)
}

class HolidayAddTravel1ersTVCell: TableViewCell {
    
    @IBOutlet weak var topview: UIView!
    @IBOutlet weak var titlelbl: UILabel!
    
    @IBOutlet weak var packageNamelbl: UILabel!
    @IBOutlet weak var dayslbl: UILabel!
    @IBOutlet weak var nightslbl: UILabel!
    @IBOutlet weak var Inclusionslbl: UILabel!
    @IBOutlet weak var InclusionsCV: UICollectionView!
    @IBOutlet weak var InclusionsWidth: NSLayoutConstraint!
    
    @IBOutlet weak var adultDecBtn: UIButton!
    @IBOutlet weak var adultCountlbl: UILabel!
    @IBOutlet weak var adultIncBtn: UIButton!
    @IBOutlet weak var childDecBtn: UIButton!
    @IBOutlet weak var childCountlbl: UILabel!
    @IBOutlet weak var childIncBtn: UIButton!
    @IBOutlet weak var totalamountlbl: UILabel!
    @IBOutlet weak var expiryDatelbl: UILabel!
    @IBOutlet weak var sendInquiryBtn: UIButton!
    @IBOutlet weak var departureTF: UITextField!
    
    
    let dateFormat = "dd-MM-yyyy"
    let depDatePicker = UIDatePicker()
    var inclsionArray = [String]()
    var adultsCount = 2
    var childCount = 0
    weak var delegate:HolidayAddTravel1ersTVCellDelegate?
    
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
        inclsionArray = res?.tour_data?.inclusions_checks ?? []
        // InclusionsWidth.constant = inclsionArray.count <= 1 ? 200 : 10
        setuplabels(lbl: packageNamelbl, text: cellInfo?.title ?? "", textcolor: .ApplabelColor, font: .poppinsSemiBold(size: 16), align: .left)
        setuplabels(lbl: expiryDatelbl, text: MySingleton.shared.convertDateFormat(inputDate: res?.tour_data?.expire_date ?? "", f1: "yyyy-MM-dd", f2: "dd MMM, yyyy"), textcolor: .ApplabelColor, font: .poppinsRegular(size: 14), align: .left)
        
        let value = Int(res?.tour_data?.duration ?? "")
        dayslbl.text = "\((value ?? 0) + 1) Days"
        nightslbl.text = "\(res?.tour_data?.duration ?? "") Nights"
        
        tour_amount = res?.min_price ?? 0
        let totalTourAmount = Double(tour_amount) * Double(adultsCount + childCount)
        setuplabels(lbl: totalamountlbl, text: "\(res?.currency ?? "") \(totalTourAmount)", textcolor: .ApplabelColor, font: .poppinsSemiBold(size: 16), align: .left)

        
    }
    
    
    func setupUI() {
        
        setuplabels(lbl: titlelbl, text: "Add travel1ers", textcolor: .WhiteColor, font: .poppinsSemiBold(size: 16), align: .left)
        setuplabels(lbl: Inclusionslbl, text: "Inclusions", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .left)
        setuplabels(lbl: dayslbl, text: "Days", textcolor: .ApplabelColor, font: .InterBold(size: 14), align: .left)
        setuplabels(lbl: nightslbl, text: "Nights", textcolor: .ApplabelColor, font: .InterBold(size: 14), align: .left)
        
        
        topview.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        topview.layer.cornerRadius = 8
        topview.clipsToBounds = true
        
        adultCountlbl.text = "2"
        childCountlbl.text = "0"
        
        adultsCount = 2
        childCount = 0
        
        adultIncBtn.addTarget(self, action: #selector(didTapOnAdultIncrementBtnAction(_:)), for: .touchUpInside)
        adultDecBtn.addTarget(self, action: #selector(didTapOnAdultDecrementBtnAction(_:)), for: .touchUpInside)
        childIncBtn.addTarget(self, action: #selector(didTapOnChildIncrementBtnAction(_:)), for: .touchUpInside)
        childDecBtn.addTarget(self, action: #selector(didTapOnChildDecrementBtnAction(_:)), for: .touchUpInside)
        
        sendInquiryBtn.layer.cornerRadius = 6
        sendInquiryBtn.clipsToBounds = true
        sendInquiryBtn.titleLabel?.font = .poppinsSemiBold(size: 16)
        sendInquiryBtn.addTarget(self, action: #selector(didTapOnSendInquiryBtnAction(_:)), for: .touchUpInside)
        
        setupCV()
        showdepDatePicker()
        
    }
    
    
    @objc func didTapOnSendInquiryBtnAction(_ sender:UIButton) {
        delegate?.didTapOnSendInquiryBtnAction(cell: self)
    }
    
    
    
}



extension HolidayAddTravel1ersTVCell {

    // Base price for a single adult traveler
    var baseTourAmount: Double {
        // Assuming `tour_amount` is initially set to the price for one adult
        return Double(res?.min_price ?? 0) // Set this to the initial tour amount
    }

    //MARK: - Adult Increment
    @objc func didTapOnAdultIncrementBtnAction(_ sender: UIButton) {
        
        // Increment adults, but don't exceed 9 travelers in total
        if (adultsCount + childCount) < 5 {
            adultsCount += 1
            self.adultCountlbl.text = "\(adultsCount)"
        }

        updateTotalTravelerCount()
    }
    
    //MARK: - Adult Decrement
    @objc func didTapOnAdultDecrementBtnAction(_ sender: UIButton) {
        
        // Ensure adult count doesn't go below 1
        if adultsCount > 1 {
            adultsCount -= 1
            adultCountlbl.text = "\(adultsCount)"
        }

        updateTotalTravelerCount()
    }

    //MARK: - Child Increment
    @objc func didTapOnChildIncrementBtnAction(_ sender: UIButton) {
        
        // Increment children, but don't exceed 9 travelers in total
        if (adultsCount + childCount) < 5 {
            childCount += 1
            self.childCountlbl.text = "\(childCount)"
        }

        updateTotalTravelerCount()
    }

    //MARK: - Child Decrement
    @objc func didTapOnChildDecrementBtnAction(_ sender: UIButton) {
        
        // Ensure child count doesn't go below 0
        if childCount > 0 {
            childCount -= 1
            childCountlbl.text = "\(childCount)"
        }

        updateTotalTravelerCount()
    }
    
    //MARK: - Update Total Traveler Count and Tour Amount
    func updateTotalTravelerCount() {
        let totalTravelers = adultsCount + childCount
        print("Total Count === \(totalTravelers)")

        // Save the updated counts to UserDefaults
        defaults.set(adultsCount, forKey: UserDefaultsKeys.holidays_adultCount)
        defaults.set(childCount, forKey: UserDefaultsKeys.holidays_childCount)

        // Calculate the total amount based on the number of adults and children
        let totalTourAmount = baseTourAmount * Double(adultsCount + childCount)
        
        // Update the total amount label
        setuplabels(lbl: totalamountlbl,
                    text: "\(res?.currency ?? "") \(totalTourAmount)",
                    textcolor: .ApplabelColor,
                    font: .poppinsSemiBold(size: 16),
                    align: .left)

        // Notify delegate (if needed)
        // delegate?.didTapOnTravellerBtnAction(cell: self)
    }
}




extension HolidayAddTravel1ersTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCV() {
        let nib = UINib(nibName: "InclusionsCVCell", bundle: nil)
        InclusionsCV.register(nib, forCellWithReuseIdentifier: "cell")
        InclusionsCV.delegate = self
        InclusionsCV.dataSource = self
        
        if let layout = InclusionsCV.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = 5
            layout.minimumLineSpacing = 5
            layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
            layout.estimatedItemSize = CGSize(width: 50, height: 75)
            //  layout.itemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        InclusionsCV.bounces = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inclsionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var commonCell = UICollectionViewCell()
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? InclusionsCVCell {
            cell.titlelbl.text = inclsionArray[indexPath.row]
            
            switch cell.titlelbl.text {
            case "Hotel":
                cell.img.image = UIImage(named: "Hotel")
            case "Car":
                cell.img.image = UIImage(named: "Car")
            case "Meals":
                cell.img.image = UIImage(named: "Meals")
            case "Sightseeing":
                cell.img.image = UIImage(named: "Sightseeing")
            case "Transfers":
                cell.img.image = UIImage(named: "Transfers")
            default:
                break
            }
            
            
            commonCell = cell
        }
        return commonCell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Get the text for the current indexPath
        let cityName = inclsionArray[indexPath.row]
        
        // Calculate the width required for the label text
        let size = (cityName as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.InterSemiBold(size: 10)])
        
        // Add some padding to the calculated size
        let width = size.width + 20 // Adjust padding as needed
        
        return CGSize(width: width, height: 75)
    }
    
}

extension HolidayAddTravel1ersTVCell {
    
    
    //MARK: - showdepDatePicker
    func showdepDatePicker(){
        //Formate Date
        depDatePicker.datePickerMode = .date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM,yyyy"
        
        
        if let expire_date = dateFormatter.date(from: expiryDatelbl.text ?? "") {
            depDatePicker.date = expire_date
        }
        
        depDatePicker.minimumDate = Date()
        depDatePicker.preferredDatePickerStyle = .wheels
        
       
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        

        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbar.setItems([doneButton,flexibleSpace,flexibleSpace,flexibleSpace,flexibleSpace,cancelButton], animated: false)
        
        
        
        self.departureTF.inputAccessoryView = toolbar
        self.departureTF.inputView = depDatePicker
        
    }
    
    
    @objc func donedatePicker(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM,yyyy" // Set the desired date format
        let formattedDate = dateFormatter.string(from: depDatePicker.date)
        expiryDatelbl.text = formattedDate

        departureTF.resignFirstResponder()
    }
    
    
    @objc func cancelDatePicker(){
        departureTF.resignFirstResponder()
    }
}
