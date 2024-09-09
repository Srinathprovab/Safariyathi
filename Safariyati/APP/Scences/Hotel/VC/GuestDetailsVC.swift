//
//  GuestDetailsVC.swift
//  Safariyati
//
//  Created by appal on 06/08/24.
//

import UIKit

class GuestDetailsVC: BaseTableVC {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var positionsCount = 0
    
    static var newInstance: GuestDetailsVC? {
        let storyboard = UIStoryboard(name: Storyboard.Hotel.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? GuestDetailsVC
        return vc
    }
    
    var tablerow = [TableRow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        titleLabel.text = "Guest Details"
        titleLabel.font = .InterMedium(size: 20)
        commonTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        commonTableView.layer.cornerRadius = 12
        backBtn.addTarget(self, action: #selector(didTapOnBackButtonAction), for: .touchUpInside)
        commonTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        commonTableView.layer.cornerRadius = 20
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["BookingHotelDetailsTVCell","GuestLoginButtonsTVCell", "GuestRegistrationTVCell","AddDeatilsOfGuestTVCell","UserSpecificationTVCell", "ContactInformationTVCell","NewHotelPriceSummeryTVCell", "FareSummaryTVCell","EmptyTVCell", "TotalNoofTravellerTVCell","TermsAndPrivacyCheckBoxTVCell"])
        setupTV()
    }

    @objc func didTapOnBackButtonAction() {
      //  dismiss(animated: true, completion: nil)
        dismiss(animated: true)
    }
    
    
    func setupTV() {
        tablerow.removeAll()
        tablerow.append(TableRow(height: 20, cellType:.EmptyTVCell))
        tablerow.append(TableRow(key: "Booking", cellType:.BookingHotelDetailsTVCell))
        tablerow.append(TableRow(cellType:.GuestLoginButtonsTVCell))
        tablerow.append(TableRow(cellType:.GuestRegistrationTVCell))
        tablerow.append(TableRow(title:"Enter Guest information",cellType:.TotalNoofTravellerTVCell))
        tablerow.append(TableRow(title:"Child",key:"child",characterLimit: positionsCount,cellType:.AddDeatilsOfGuestTVCell))
        tablerow.append(TableRow(title:"Adult",key:"adult",characterLimit: positionsCount,cellType:.AddDeatilsOfGuestTVCell))
        tablerow.append(TableRow(cellType:.UserSpecificationTVCell))
        tablerow.append(TableRow(cellType:.ContactInformationTVCell))
        tablerow.append(TableRow(cellType:.NewHotelPriceSummeryTVCell))
        tablerow.append(TableRow(height: 20, cellType:.EmptyTVCell))
        tablerow.append(TableRow(title:"By booking this item, you agree to pay the total amount shown, which includes Service Fees, on the right and to the , User Terms, Privacy policy .",cellType:.TermsAndPrivacyCheckBoxTVCell))
        tablerow.append(TableRow(height: 50, cellType:.EmptyTVCell))
        
    
        commonTVData = tablerow
        commonTableView.reloadData()
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
    
    
    override func didTapOnExpandAdultViewbtnAction(cell:AddDeatilsOfGuestTVCell) {
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
    override func tfeditingChanged(tf:UITextField) {
        
    }
    override func didTapOnTitleBtnAction(cell:AddDeatilsOfGuestTVCell) {
        
    }
    override func didTapOnMrBtnAction(cell:AddDeatilsOfGuestTVCell) {
        
    }
    override func didTapOnMrsBtnAction(cell:AddDeatilsOfGuestTVCell) {
        
    }
    
}
