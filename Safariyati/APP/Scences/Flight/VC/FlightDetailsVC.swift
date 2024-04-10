//
//  FlightDetailsVC.swift
//  Safariyati
//
//  Created by FCI on 10/04/24.
//

import UIKit

class FlightDetailsVC: UIViewController {

    
    @IBOutlet weak var tabsHolderView: UIView!
    @IBOutlet weak var flightItineraryBtn: UIButton!
    @IBOutlet weak var baggageInoBtn: UIButton!
    @IBOutlet weak var exchangeBtn: UIButton!
    
    
    static var newInstance: FlightDetailsVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? FlightDetailsVC
        return vc
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        
        tabsHolderView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabsHolderView.layer.cornerRadius = 20
        flightItineraryBtn.layer.cornerRadius = 4
        baggageInoBtn.layer.cornerRadius = 4
        exchangeBtn.layer.cornerRadius = 4
        
        setupItienaryBtn()
        
    }
    
    
    
    

    @IBAction func didTapOnCloseBtnAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnFlightItienarayBtnAction(_ sender: Any) {
        setupItienaryBtn()
    }
    
    
    @IBAction func didTapOnBaggageInfoBtnAction(_ sender: Any) {
        setupBaggageInfo()
    }
    
    
    @IBAction func didTapOnExchangeBtnAction(_ sender: Any) {
        exchangeBtnView()
    }
    

    func setupItienaryBtn() {
        flightItineraryBtn.backgroundColor = .Buttoncolor
        flightItineraryBtn.setTitleColor(.WhiteColor, for: .normal)
        
        baggageInoBtn.backgroundColor = .TxtFldbgColor
        baggageInoBtn.setTitleColor(.TitleColor, for: .normal)
        
        exchangeBtn.backgroundColor = .TxtFldbgColor
        exchangeBtn.setTitleColor(.TitleColor, for: .normal)
    }
    
    func setupBaggageInfo() {
        flightItineraryBtn.backgroundColor = .TxtFldbgColor
        flightItineraryBtn.setTitleColor(.TitleColor, for: .normal)
        
        baggageInoBtn.backgroundColor = .Buttoncolor
        baggageInoBtn.setTitleColor(.WhiteColor, for: .normal)
        
        exchangeBtn.backgroundColor = .TxtFldbgColor
        exchangeBtn.setTitleColor(.TitleColor, for: .normal)
    }
    
    func exchangeBtnView() {
        flightItineraryBtn.backgroundColor = .TxtFldbgColor
        flightItineraryBtn.setTitleColor(.TitleColor, for: .normal)
        
        baggageInoBtn.backgroundColor = .TxtFldbgColor
        baggageInoBtn.setTitleColor(.TitleColor, for: .normal)
        
        exchangeBtn.backgroundColor = .Buttoncolor
        exchangeBtn.setTitleColor(.WhiteColor, for: .normal)
    }
    
    
    @IBAction func didTapOnBookNowBtynAction(_ sender: Any) {
        gotoBookingDetailsVC()
    }
    
    func gotoBookingDetailsVC() {
        guard let vc = BookingDetailsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
}
