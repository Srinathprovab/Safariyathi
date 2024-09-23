//
//  BookingDetailsVC.swift
//  Safariyati
//
//  Created by FCI on 10/04/24.
//

import UIKit

class BookingDetailsVC: BaseTableVC, BookingDetailsVMDelegate, TimerManagerDelegate {
    
    
    @IBOutlet weak var holderview: UIView!
    @IBOutlet weak var kwdlbl: UILabel!
    
    static var newInstance: BookingDetailsVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? BookingDetailsVC
        return vc
    }
    
    
    var billingCountryName = String()
    var flighttotelCount = 0
    var positionsCount = 0
    var adultsCount = Int()
    var childCount = Int()
    var infantsCount = Int()
    var tmpFlightPreBookingId = String()
    var tokenkey1 = String()
    var payload = [String:Any]()
    var payload1 = [String:Any]()
    var tablerow = [TableRow]()
    var bdvm:BookingDetailsVM?
    var flightsummery = [Summary]()
    
    override func viewWillAppear(_ animated: Bool) {
        addObserver()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        MySingleton.shared.delegate = self
        bdvm = BookingDetailsVM(self)
    }
    
    
    
    
    override func didTapOnRegisterNowOrLoginBtnACtion(cell: GuestLoginButtonsTVCell) {
        commonTableView.reloadData()
    }
    override func didTapOnRegisterNowBtnAction(cell: GuestRegistrationTVCell) {
        print("didTapOnRegisterNowBtnAction")
    }
    override func didTapOnGuestLoginBtnAction(cell: GuestRegistrationTVCell) {
        print("didTapOnGuestLoginBtnAction")
    }
    override func didTapOnLoginBtnAction(cell: GuestRegistrationTVCell) {
        print("didTapOnLoginBtnAction")
    }
    
    
    @IBAction func didTapOnCloseBtnAction(_ sender: Any) {
        callapibool = false
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnContinuePaymentBtynAction(_ sender: Any) {
        //gotoProcessingToPaymentVC()
        tapOnPayNow()
    }
    
    
    func gotoProcessingToPaymentVC() {
        guard let vc = ProcessingToPaymentVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
    
    
    //MARK: - AddDeatilsOfTravellerTVCell Delegate Functions
    override func didTapOnExpandAdultViewbtnAction(cell: AddDeatilsOfTravellerTVCell) {
        if cell.expandViewBool == true {
            
            cell.expandView()
            cell.expandViewBool = false
        }else {
            
            cell.collapsView()
            cell.expandViewBool = true
        }
        
        commonTableView.beginUpdates()
        commonTableView.endUpdates()
    }
    
    override func didTapOnTitleBtnAction(cell: AddDeatilsOfTravellerTVCell) {
        
    }
    
    override func donedatePicker(cell:AddDeatilsOfTravellerTVCell){
        self.view.endEditing(true)
    }
    
    override func cancelDatePicker(cell:AddDeatilsOfTravellerTVCell){
        self.view.endEditing(true)
    }
    
    
    
    //MARK: - AcceptTermsAndConditionTVCell Delegate Functions
    override func didTapOnTAndCAction(cell: AcceptTermsAndConditionTVCell) {
        // gotoAboutUsVC(keystr: "terms")
        print("didTapOnTAndCAction")
    }
    
    override func didTapOnPrivacyPolicyAction(cell: AcceptTermsAndConditionTVCell) {
        // gotoAboutUsVC(keystr: "pp")
    }
    
    
    //MARK: - editingTextField
    override func editingTextField(tf:UITextField){
        
        switch tf.tag {
        case 111:
            payemail = tf.text ?? ""
            break
            
        case 222:
            paymobile = tf.text ?? ""
            break
            
            
        default:
            break
        }
    }
    
    
    override func didTapOnCountryCodeBtn(cell: ContactInformationTVCell) {
        billingCountryName = cell.isoCountryCode
        paymobilecountrycode = cell.countrycodeTF.text ?? ""
    }
    
    
    //MARK: - didTapOnDropDownBtn
    override func didTapOnDropDownBtn(cell: ContactInformationTVCell) {
        billingCountryName = cell.isoCountryCode
        paymobilecountrycode = cell.countrycodeTF.text ?? ""
    }
    
    
}


extension BookingDetailsVC {
    
    
    func callMobilePreBookingAPI() {
        payload.removeAll()
        payload["search_id"] = selectedsearch_id
        payload["selectedResult"] = selectedselectedResultindex
        payload["booking_source"] = selectedbooking_source
        payload["fare_access_key"] = selected_access_key
        payload["user_id"] = defaults.string(forKey: UserDefaultsKeys.userid) ?? "0"
        
        bdvm?.CALL_MOBILE_PRE_PROCESS_BOOKING_API(dictParam: payload)
    }
    
    func preprocessBookingDetails(response: BookingDetailsModel) {
        
        holderview.isHidden = false
        kwdlbl.text = "\(response.pre_booking_params?.priceDetails?.api_currency ?? "") \(response.pre_booking_params?.priceDetails?.grand_total ?? "")"
        
        tmpFlightPreBookingId = response.pre_booking_params?.transaction_id ?? ""
        tokenkey1 = response.pre_booking_params?.token_key ?? ""
        
        DispatchQueue.main.async { [self] in
            setupTVcells(res: response)
        }
    }
    
    
    
    func setupUI() {
        holderview.isHidden = true
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["BDFlightDetailsTVCell",
                                         "EmptyTVCell",
                                         "GuestRegistrationTVCell",
                                         "GuestLoginButtonsTVCell",
                                         "FareSummaryTVCell",
                                         "TotalNoofTravellerTVCell",
                                         "AddDeatilsOfTravellerTVCell",
                                         "AcceptTermsAndConditionTVCell",
                                         "ContactInformationTVCell"])
        
        
    }
    
    
    func setupTVcells(res:BookingDetailsModel) {
        tablerow.removeAll()
        
        
        tablerow.append(TableRow(moreData: res.flight_data?[0],cellType:.BDFlightDetailsTVCell))
        
        if defaults.bool(forKey: UserDefaultsKeys.loggedInStatus) == false {
            tablerow.append(TableRow(cellType:.GuestLoginButtonsTVCell))
            tablerow.append(TableRow(cellType:.GuestRegistrationTVCell))
        }
        
        passengertypeArray.removeAll()
        tablerow.append(TableRow(height:20, bgColor:.WhiteColor,cellType:.EmptyTVCell))
        tablerow.append(TableRow(title:"Passenger Details",cellType:.TotalNoofTravellerTVCell))
        for i in 1...adultsCount {
            positionsCount += 1
            passengertypeArray.append("Adult")
            let travellerCell = TableRow(title: "Adult \(i)", key: "adult", characterLimit: positionsCount, cellType: .AddDeatilsOfTravellerTVCell)
            tablerow.append(travellerCell)
            
        }
        
        
        if childCount != 0 {
            for i in 1...childCount {
                positionsCount += 1
                passengertypeArray.append("Child")
                tablerow.append(TableRow(title:"Child \(i)",key:"child",characterLimit: positionsCount,cellType:.AddDeatilsOfTravellerTVCell))
            }
        }
        
        if infantsCount != 0 {
            for i in 1...infantsCount {
                positionsCount += 1
                passengertypeArray.append("Infant")
                tablerow.append(TableRow(title:"Infant \(i)",key:"infant",characterLimit: positionsCount,cellType:.AddDeatilsOfTravellerTVCell))
            }
        }
        
        
        
        
        tablerow.append(TableRow(cellType:.ContactInformationTVCell))
        tablerow.append(TableRow(moreData: res.pre_booking_params?.priceDetails,cellType:.FareSummaryTVCell))
        
        
        tablerow.append(TableRow(title:"I Accept T&C and Privacy Policy",cellType:.AcceptTermsAndConditionTVCell))
        tablerow.append(TableRow(height:30, bgColor:.WhiteColor,cellType:.EmptyTVCell))
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    
}



extension BookingDetailsVC  {
    
    
    func addObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(nointernet), name: Notification.Name("offline"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(resultnil), name: NSNotification.Name("resultnil"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(nointrnetreload), name: Notification.Name("nointrnetreload"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: Notification.Name("reload"), object: nil)
        
        
        if let journeyType = defaults.string(forKey: UserDefaultsKeys.journeyType) {
            if journeyType == "oneway" {
                
                adultsCount = Int(defaults.string(forKey: UserDefaultsKeys.adultCount) ?? "1") ?? 0
                childCount = Int(defaults.string(forKey: UserDefaultsKeys.childCount) ?? "0") ?? 0
                infantsCount = Int(defaults.string(forKey: UserDefaultsKeys.infantsCount) ?? "0") ?? 0
                flighttotelCount = (adultsCount + childCount + infantsCount)
            }else if journeyType == "circle"{
                
                adultsCount = Int(defaults.string(forKey: UserDefaultsKeys.adultCount) ?? "1") ?? 0
                childCount = Int(defaults.string(forKey: UserDefaultsKeys.childCount) ?? "0") ?? 0
                infantsCount = Int(defaults.string(forKey: UserDefaultsKeys.infantsCount) ?? "0") ?? 0
                flighttotelCount = (adultsCount + childCount + infantsCount)
            }
        }
        
        
        
        if callapibool == true {
            DispatchQueue.main.async {
                self.callMobilePreBookingAPI()
            }
        }
        
    }
    
    
    @objc func reload() {
        DispatchQueue.main.async {[self] in
            commonTableView.reloadData()
        }
    }
    
    @objc func nointrnetreload() {
        
        DispatchQueue.main.async {
            self.callMobilePreBookingAPI()
        }
    }
    
    //MARK: - resultnil
    @objc func resultnil() {
        guard let vc = NoInternetConnectionVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        vc.key = "noresult"
        self.present(vc, animated: true)
    }
    
    
    //MARK: - nointernet
    @objc func nointernet() {
        
        guard let vc = NoInternetConnectionVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        vc.key = "nointernet"
        self.present(vc, animated: true)
    }
    
    //MARK: - updateTimer
    func updateTimer() {
        //        let totalTime = MySingleton.shared.totalTime
        //        let minutes =  totalTime / 60
        //        let seconds = totalTime % 60
        //        let formattedTime = String(format: "%02d:%02d", minutes, seconds)
        //
        //
        //        MySingleton.shared.setAttributedTextnew(str1: "Your Session Expires In : ",
        //                                                str2: "\(formattedTime)",
        //                                                lbl: sessionlbl,
        //                                                str1font: .InterMedium(size: 14),
        //                                                str2font: .InterMedium(size: 14),
        //                                                str1Color: .TitleColor,
        //                                                str2Color: .Buttoncolor)
        //
        
    }
    
    
    func timerDidFinish() {
        gotoPopupScreen()
    }
    
    func gotoPopupScreen() {
        guard let vc = PopupVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    
}



extension BookingDetailsVC {
    
    
    
    func tapOnPayNow() {
        
        payload.removeAll()
        payload1.removeAll()
        
        
        
        var callpaymentbool = true
        var fnameCharBool = true
        var lnameCharBool = true
        
        
        
        
        for traveler in travelerArray {
            
            if traveler.firstName == nil  || traveler.firstName?.isEmpty == true{
                callpaymentbool = false
                
            }
            
            if (traveler.firstName?.count ?? 0) <= 3 {
                fnameCharBool = false
            }
            
            if traveler.lastName == nil || traveler.firstName?.isEmpty == true{
                callpaymentbool = false
            }
            
            if (traveler.lastName?.count ?? 0) <= 3 {
                lnameCharBool = false
            }
            
            if traveler.dob == nil || traveler.dob?.isEmpty == true{
                callpaymentbool = false
            }
            
            if traveler.passportno == nil || traveler.passportno?.isEmpty == true{
                callpaymentbool = false
            }
            
            if traveler.passportIssuingCountry == nil || traveler.passportIssuingCountry?.isEmpty == true{
                callpaymentbool = false
            }
            
            if traveler.passportExpireDate == nil || traveler.passportExpireDate?.isEmpty == true{
                callpaymentbool = false
            }
            
            
            // Continue checking other fields
        }
        
        
        
        
        let positionsCount1 = commonTableView.numberOfRows(inSection: 0)
        for position in 0..<positionsCount1 {
            // Fetch the cell for the given position
            if let cell = commonTableView.cellForRow(at: IndexPath(row: position, section: 0)) as? AddDeatilsOfTravellerTVCell {
                
                if cell.titleTF.text?.isEmpty == true {
                    // Textfield is empty
                    cell.titleView.layer.borderColor = UIColor.red.cgColor
                    callpaymentbool = false
                    
                } else {
                    // Textfield is not empty
                }
                
                if cell.fnameTF.text?.isEmpty == true {
                    // Textfield is empty
                    cell.fnameView.layer.borderColor = UIColor.red.cgColor
                    callpaymentbool = false
                }else if (cell.fnameTF.text?.count ?? 0) <= 3{
                    cell.fnameView.layer.borderColor = UIColor.red.cgColor
                    fnameCharBool = false
                }else {
                    fnameCharBool = true
                }
                
                if cell.lnameTF.text?.isEmpty == true {
                    // Textfield is empty
                    cell.lnameView.layer.borderColor = UIColor.red.cgColor
                    callpaymentbool = false
                }else if (cell.lnameTF.text?.count ?? 0) <= 3{
                    cell.lnameView.layer.borderColor = UIColor.red.cgColor
                    lnameCharBool = false
                } else {
                    // Textfield is not empty
                    lnameCharBool = true
                }
                
                
                if cell.dobTF.text?.isEmpty == true {
                    // Textfield is empty
                    cell.dobView.layer.borderColor = UIColor.red.cgColor
                    callpaymentbool = false
                } else {
                    // Textfield is not empty
                }
                
                
                if cell.passportnoTF.text?.isEmpty == true {
                    // Textfield is empty
                    cell.passportnoView.layer.borderColor = UIColor.red.cgColor
                    callpaymentbool = false
                } else {
                    // Textfield is not empty
                }
                
                
                if cell.passportIssuingCountryTF.text?.isEmpty == true {
                    // Textfield is empty
                    cell.issuecountryView.layer.borderColor = UIColor.red.cgColor
                    callpaymentbool = false
                } else {
                    // Textfield is not empty
                }
                
                
                if cell.passportExpireDateTF.text?.isEmpty == true {
                    // Textfield is empty
                    cell.passportexpireView.layer.borderColor = UIColor.red.cgColor
                    callpaymentbool = false
                } else {
                    // Textfield is not empty
                }
                
            }
        }
        
        let laedpassengerArray = travelerArray.compactMap({$0.laedpassenger})
        let mrtitleArray = travelerArray.compactMap({$0.mrtitle})
        let genderArray = travelerArray.compactMap({$0.gender})
        let firstnameArray = travelerArray.compactMap({$0.firstName})
        let lastNameArray = travelerArray.compactMap({$0.lastName})
        let middlenameArray = travelerArray.compactMap({$0.middlename})
        let dobArray = travelerArray.compactMap({$0.dob})
        let passportnoArray = travelerArray.compactMap({$0.passportno})
        let nationalityArray = travelerArray.compactMap({$0.nationality})
        let passportIssuingCountryArray = travelerArray.compactMap({$0.passportIssuingCountry})
        let passportExpireDateArray = travelerArray.compactMap({$0.passportExpireDate})
        let passengertypeArray = travelerArray.compactMap({$0.passengertype})
        
        
        // Convert arrays to string representations
        let laedpassengerString = "[\"" + laedpassengerArray.joined(separator: "\",\"") + "\"]"
        let genderString = "[\"" + genderArray.joined(separator: "\",\"") + "\"]"
        let mrtitleString = "[\"" + mrtitleArray.joined(separator: "\",\"") + "\"]"
        let firstnameString = "[\"" + firstnameArray.joined(separator: "\",\"") + "\"]"
        let middlenameString = "[\"" + middlenameArray.joined(separator: "\",\"") + "\"]"
        let lastNameString = "[\"" + lastNameArray.joined(separator: "\",\"") + "\"]"
        let dobString = "[\"" + dobArray.joined(separator: "\",\"") + "\"]"
        let passportnoString = "[\"" + passportnoArray.joined(separator: "\",\"") + "\"]"
        let passportIssuingCountryString = "[\"" + passportIssuingCountryArray.joined(separator: "\",\"") + "\"]"
        let passportExpireDateString = "[\"" + passportExpireDateArray.joined(separator: "\",\"") + "\"]"
        let passengertypeArrayString = "[\"" + passengertypeArray.joined(separator: "\",\"") + "\"]"
        let nationalityArrayString = "[\"" + nationalityArray.joined(separator: "\",\"") + "\"]"
        
        
       
        payload["search_id"] = selectedsearch_id
        payload["tmp_flight_pre_booking_id"] = tmpFlightPreBookingId
        payload["token_key"] = tokenkey1
        payload["access_key"] =  selected_access_key
        payload["access_key_tp"] =  selected_access_key
        payload["insurance_policy_type"] = "0"
        payload["insurance_policy_option"] = "0"
        payload["insurance_policy_cover_type"] = "0"
        payload["insurance_policy_duration"] = "0"
        payload["isInsurance"] = "0"
        payload["selectedResult"] = selectedselectedResultindex
        payload["redeem_points_post"] = "1"
        payload["booking_source"] = selectedbooking_source
        payload["promocode_val"] = ""
        payload["promocode_code"] = ""
        payload["mealsAmount"] = "0"
        payload["baggageAmount"] = "0"
        
        payload["passenger_nationality"] = passportIssuingCountryString
        payload["passenger_type"] = passengertypeArrayString
        payload["lead_passenger"] = laedpassengerString
        payload["gender"] = genderString
        payload["name_title"] =  mrtitleString
        payload["first_name"] =  firstnameString
        payload["middle_name"] =  middlenameString
        payload["last_name"] =  lastNameString
        payload["date_of_birth"] =  dobString
        payload["passenger_passport_number"] =  passportnoString
        payload["passenger_passport_issuing_country"] =  passportIssuingCountryString
        payload["passenger_passport_expiry"] =  passportExpireDateString
        payload["Frequent"] = "\([["Select"]])"
        payload["ff_no"] = "\([[""]])"
        payload["payment_method"] =  "PNHB1"
        
        payload["billing_email"] = payemail
        payload["passenger_contact"] = paymobile
        payload["country_mobile_code"] = paymobilecountrycode
        payload["insurance"] = "1"
        payload["tc"] = "on"
        payload["booking_step"] = "book"
        payload["selectedCurrency"] = defaults.string(forKey: UserDefaultsKeys.selectedCurrency) ?? "OMR"
        payload["user_id"] = defaults.string(forKey: UserDefaultsKeys.userid) ?? "0"
        
        
        payload["insurance_name"] = ""
        payload["insurance_code"] = ""
        payload["insurance_totalprice"] = ""
        payload["insurance_baseprice"] = ""
        payload["hidseatprice"] = ""
        payload["device_source"] = "MOBILE(A)"
        
        payload["address2"] = "ecity"
        payload["billing_address_1"] = "DA"
        payload["billing_state"] = "ASDAS"
        payload["billing_city"] = "sdfsd"
        payload["billing_zipcode"] = "sdf"
        payload["billing_country"] = "IN"
        
        
        
        // Check additional conditions
        if callpaymentbool == false {
//            
//            do {
//                // Convert payload dictionary to JSON data
//                let jsonData = try JSONSerialization.data(withJSONObject: payload, options: .prettyPrinted)
//                
//                // Convert JSON data to a string
//                if let jsonString = String(data: jsonData, encoding: .utf8) {
//                    print(jsonString)  // Print the JSON-formatted string
//                }
//            } catch {
//                print("Error serializing JSON: \(error.localizedDescription)")
//            }
//            
            showToast(message: "Add Details")
        }else if passportExpireDateBool == false {
            showToast(message: "Invalid expiry. Passport expires within the next 3 months.")
        }else if !fnameCharBool {
            showToast(message: "First name should have more than 3 characters")
        }else if !lnameCharBool {
            showToast(message: "Last name should have more than 3 characters")
        }else if payemail == "" {
            showToast(message: "Enter Email Address")
        }else if payemail.isValidEmail() == false {
            showToast(message: "Enter Valid Email Addreess")
        }else if paymobile == "" {
            showToast(message: "Enter Mobile No")
        }else if paymobilecountrycode == "" {
            showToast(message: "Enter Country Code")
        }else if mobilenoMaxLengthBool == false {
            showToast(message: "Enter Valid Mobile No")
        }else if checkTermsAndCondationStatus == false {
            showToast(message: "Please Accept T&C and Privacy Policy")
        }else {
            
            
            do {
                // Convert payload dictionary to JSON data
                let jsonData = try JSONSerialization.data(withJSONObject: payload, options: .prettyPrinted)
                
                // Convert JSON data to a string
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)  // Print the JSON-formatted string
                }
            } catch {
                print("Error serializing JSON: \(error.localizedDescription)")
            }
            
            bdvm?.CALL_MOBILE_PROCESS_PASSENGER_DETAILS_API(dictParam: payload)
        }
    }
    
    func mobileProcessPassengerDetailsResponse(response: ProcessPassengerDetailsModel) {
        
        print(response)
    }
    
    
}
