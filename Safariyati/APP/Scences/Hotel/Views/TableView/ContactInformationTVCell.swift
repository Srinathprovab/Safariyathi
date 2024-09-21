//
//  ContactInformationTVCell.swift
//  Safariyati
//
//  Created by appal on 06/08/24.
//

import UIKit
import DropDown
import IQKeyboardManager

protocol ContactInformationTVCellDelegate {
    func didTapOnCountryCodeBtn(cell:ContactInformationTVCell)
    func editingTextField(tf:UITextField)
    func didTapOnDropDownBtn(cell:ContactInformationTVCell)
}

class ContactInformationTVCell: TableViewCell, CountryListVMDelegate {
    
    
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var contactImg: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var subTitlelbl: UILabel!
    @IBOutlet weak var emailTfView: UIView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var mobileNoView: UIView!
    @IBOutlet weak var mobileTF: UITextField!
    @IBOutlet weak var codeView: UIView!
    @IBOutlet weak var countryCodeLbl: UILabel!
    @IBOutlet weak var countryCodeBtn: UIButton!
    @IBOutlet weak var countrycodeTF: UITextField!
    
    
    
    var vm : CountryListVM?
    var payload = [String:Any]()
    var maxLength = 8
    var isSearchBool = Bool()
    var searchText = String()
    var filterdcountrylist = [Country_list]()
    var countryNames = [String]()
    var countrycodesArray = [String]()
    var originArray = [String]()
    var isocountrycodeArray = [String]()
    var nationalityCode = String()
    let dropDown = DropDown()
    var countryNameArray = [String]()
    var isoCountryCode = String()
    var billingCountryName = String()
    var delegate:ContactInformationTVCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
        setupUI()
        holderView.layer.borderWidth = 1
        holderView.layer.borderColor = UIColor.BorderColor.cgColor
        
        vm = CountryListVM(self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func updateUI() {
        //        self.countrycodeTF.text = defaults.string(forKey: UserDefaultsKeys.countryCode) ?? ""
        //        filterdcountrylist = countrylist
        //        loadCountryNamesAndCode()
        
        
        if let usersignIn = defaults.object(forKey: UserDefaultsKeys.regStatus) as? Bool ,usersignIn == true
        {
            
            if let email = defaults.string(forKey: UserDefaultsKeys.useremail) {
                payemail = email
                emailTF.text = payemail
            }
            
            if let mobile = defaults.string(forKey: UserDefaultsKeys.usermobile) {
                paymobile = mobile
                mobileTF.text = paymobile
            }
            
            if let code = defaults.string(forKey: UserDefaultsKeys.countryCode) {
                paymobilecountrycode = code
                countrycodeTF.text = paymobilecountrycode
            }
            
            mobilenoMaxLengthBool = true
        }
        
        if let userLoggedIn = defaults.object(forKey: UserDefaultsKeys.loggedInStatus) as? Bool ,userLoggedIn == true{
            if let email = defaults.string(forKey: UserDefaultsKeys.useremail) {
                payemail = email
                emailTF.text = payemail
            }
            
            if let mobile = defaults.string(forKey: UserDefaultsKeys.usermobile) {
                paymobile = mobile
                mobileTF.text = paymobile
            }
            
            if let code = defaults.string(forKey: UserDefaultsKeys.countryCode) {
                paymobilecountrycode = code
                countrycodeTF.text = paymobilecountrycode
            }
            
            mobilenoMaxLengthBool = true
        }
        
    }
    
    
    
    func setupUI() {
        
        contentView.backgroundColor = UIColor.white
        setupViews(v: emailTfView, radius: 4, color: .WhiteColor)
        setupViews(v: mobileNoView, radius: 4, color: .WhiteColor)
        setupViews(v: codeView, radius: 0, color: .WhiteColor)
        setupLabels(lbl: titlelbl, text: "Contact Information", textcolor: .ApplabelColor, font: .InterMedium(size: 16))
        setupLabels(lbl: subTitlelbl, text: "E-Ticket will be sent to the registered email address", textcolor: HexColor("#2A2A2A"), font: .InterRegular(size: 12))
        setupLabels(lbl: countryCodeLbl, text: "", textcolor: HexColor("#2A2A2A"), font: .InterRegular(size: 16))
        
        emailTfView.layer.borderWidth = 1
        mobileNoView.layer.borderWidth = 1
        
        countryCodeBtn.setTitle("", for: .normal)
        
        setuptf(tf: emailTF, tag1: 111, leftpadding: 20, font: .InterRegular(size: 16), placeholder: "Email Address")
        setuptf(tf: mobileTF, tag1: 222, leftpadding: 20, font: .InterRegular(size: 16), placeholder: "Enter Mobile Number")
        setuptf(tf: countrycodeTF, tag1: 3, leftpadding: 20, font: .InterRegular(size: 16), placeholder: "+355")
        
        setupDropDown()
        countryCodeBtn.isHidden = true
        countrycodeTF.addTarget(self, action: #selector(searchTextChanged(textField:)), for: .editingChanged)
        countrycodeTF.addTarget(self, action: #selector(searchTextBegin(textField:)), for: .editingDidBegin)
    }
    
    func setuptf(tf:UITextField,tag1:Int,leftpadding:Int,font:UIFont,placeholder:String){
        tf.backgroundColor = .clear
        tf.placeholder = placeholder
        tf.setLeftPaddingPoints(CGFloat(leftpadding))
        tf.font = font
        tf.tag = tag1
        tf.delegate = self
        tf.addTarget(self, action: #selector(editingText(textField:)), for: .editingChanged)
    }
    
    
    func setupViews(v:UIView,radius:CGFloat,color:UIColor) {
        v.backgroundColor = color
        v.layer.cornerRadius = radius
        v.clipsToBounds = true
        v.layer.borderWidth = 0.4
        v.layer.borderColor = UIColor.BorderColor.cgColor
    }
    
    func setupLabels(lbl:UILabel,text:String,textcolor:UIColor,font:UIFont) {
        lbl.text = text
        lbl.textColor = textcolor
        lbl.font = font
    }
    
    @objc func editingText(textField:UITextField) {
        
        if textField == mobileTF {
            if let text = textField.text {
                let length = text.count
                if length != maxLength {
                    mobileNoView.layer.borderColor = UIColor.red.cgColor
                    mobilenoMaxLengthBool = false
                }else{
                    mobileNoView.layer.borderColor = UIColor.BorderColor.cgColor
                    mobilenoMaxLengthBool = true
                }
                
            } else {
                mobileNoView.layer.borderColor = UIColor.red.cgColor
                mobilenoMaxLengthBool = false
            }
        }
        
        delegate?.editingTextField(tf: textField)
    }
    
    @IBAction func didTapOnCountryCodeBtn(_ sender: Any) {
        dropDown.show()
        // delegate?.didTapOnCountryCodeBtn(cell: self)
    }
    
    func setupDropDown() {
        
        dropDown.direction = .bottom
        dropDown.backgroundColor = .WhiteColor
        dropDown.anchorView = self.countryCodeBtn
        dropDown.bottomOffset = CGPoint(x: 0, y: countryCodeBtn.frame.size.height + 10)
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in
            
            self?.countryCodeLbl.text = ""
            self?.countrycodeTF.text = self?.countrycodesArray[index]
            self?.isoCountryCode = self?.isocountrycodeArray[index] ?? ""
            self?.billingCountryName = self?.countryNames[index] ?? ""
            self?.nationalityCode = self?.originArray[index] ?? ""
            self?.countryCodeLbl.textColor = HexColor("#2A2A2A")
            
            self?.countrycodeTF.text = self?.countrycodesArray[index] ?? ""
            paymobilecountrycode = self?.countrycodesArray[index] ?? ""
            self?.countrycodeTF.resignFirstResponder()
            self?.mobileTF.text = ""
            self?.mobileTF.becomeFirstResponder()
            
            self?.delegate?.didTapOnCountryCodeBtn(cell: self!)
            
        }
    }
    
    @objc func searchTextBegin(textField: UITextField) {
        textField.text = ""
        callGetCountryListAPI(text: textField.text ?? "")
    }
    
    
    @objc func searchTextChanged(textField: UITextField) {
        searchText = textField.text ?? ""
        callGetCountryListAPI(text: searchText)
    }
    
    
    func callGetCountryListAPI(text:String) {
        payload.removeAll()
        payload["term"] = text
        vm?.CALL_GET_COUNTRY_LIST_API(dictParam: payload)
    }
    
    func countrylistResponse(response: CountryListModel) {
        
        filterdcountrylist.removeAll()
        countrylist = response.all_country_code_list ?? []
        filterdcountrylist = countrylist
        loadCountryNamesAndCode()
        dropDown.show()
    }
    
    
    
    //    func filterContentForSearchText(_ searchText: String) {
    //        print("Filterin with:", searchText)
    //
    //        filterdcountrylist.removeAll()
    //        filterdcountrylist = countrylist.filter { thing in
    //            return "\(thing.name?.lowercased() ?? "")".contains(searchText.lowercased())
    //        }
    //
    //        loadCountryNamesAndCode()
    //        dropDown.show()
    //
    //    }
    
    func loadCountryNamesAndCode(){
        countryNames.removeAll()
        countrycodesArray.removeAll()
        isocountrycodeArray.removeAll()
        originArray.removeAll()
        
        filterdcountrylist.forEach { i in
            countryNames.append(i.name ?? "")
            countrycodesArray.append(i.country_code ?? "")
            isocountrycodeArray.append(i.iso_country_code ?? "")
            originArray.append(i.origin ?? "")
        }
        
        DispatchQueue.main.async {[self] in
            dropDown.dataSource = countryNames
        }
    }
    
}


extension ContactInformationTVCell {
    
    //MARK - UITextField Delegates
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For mobile numer validation
        if textField == mobileTF {
            maxLength = self.billingCountryName.getMobileNumberMaxLength() ?? 8
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
            
            let allowedCharacters = CharacterSet(charactersIn:"+0123456789 ")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet) && newString.length <= maxLength
        }else {
            maxLength = 30
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }
        //  return true
    }
    
    
}
