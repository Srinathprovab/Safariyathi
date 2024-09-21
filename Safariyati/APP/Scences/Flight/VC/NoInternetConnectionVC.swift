//
//  NoInternetConnectionVC.swift
//  Safariyati
//
//  Created by Admin on 12/09/24.
//

import UIKit

class NoInternetConnectionVC: UIViewController {
    
    @IBOutlet weak var wifiImg: UIImageView!
    @IBOutlet weak var closeImg: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var subTitlelbl: UILabel!
    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var btnlbl: UILabel!
    @IBOutlet weak var tryAgainBtn: UIButton!
    
    
    var key = String()
    static var newInstance: NoInternetConnectionVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? NoInternetConnectionVC
        return vc
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if key == "noresult" {
            noresultSetup()
        }
        
        if key == "noseat" {
            noSeatAvaliableSetup()
        }
    }
    
    func noresultSetup(){
        wifiImg.image = UIImage(named: "oops")
        setupLabels(lbl: titlelbl, text: "Sorry! No result Found", textcolor: .ApplabelColor, font: .InterMedium(size: 16))
        setupLabels(lbl: subTitlelbl, text: "We’re sorry you were looking for. Please try again", textcolor: .subtitle1, font: .InterLight(size: 14))
        setupLabels(lbl: btnlbl, text: "Try Again", textcolor: .ApplabelColor, font: .InterBold(size: 16))
    }
    
    func noSeatAvaliableSetup(){
        wifiImg.image = UIImage(named: "oops")
        setupLabels(lbl: titlelbl, text: "Seat is not available!", textcolor: .ApplabelColor, font: .InterMedium(size: 16))
        setupLabels(lbl: subTitlelbl, text: "Please Search Again", textcolor: .subtitle1, font: .InterLight(size: 14))
        setupLabels(lbl: btnlbl, text: "Try Again", textcolor: .ApplabelColor, font: .InterBold(size: 16))
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        wifiImg.image = UIImage(named: "wifi")
        closeImg.image = UIImage(named: "close1")
        
        setupLabels(lbl: titlelbl, text: "No internet connection!", textcolor: .ApplabelColor, font: .InterMedium(size: 16))
        setupLabels(lbl: subTitlelbl, text: "Please check your network connection.", textcolor: .subtitle1, font: .InterLight(size: 14))
        setupLabels(lbl: btnlbl, text: "Try Again", textcolor: .ApplabelColor, font: .poppinsSemiBold(size: 18))
        tryAgainBtn.setTitle("", for: .normal)
        setupViews(v: btnView, radius: 4, color: HexColor("#F2F3F6"))
    }
    
    func setupLabels(lbl:UILabel,text:String,textcolor:UIColor,font:UIFont) {
        lbl.text = text
        lbl.textColor = textcolor
        lbl.font = font
        lbl.numberOfLines = 0
    }
    
    func setupViews(v:UIView,radius:CGFloat,color:UIColor) {
        v.backgroundColor = color
        v.layer.cornerRadius = radius
        v.clipsToBounds = true
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.BorderColor.cgColor
    }
    
    @IBAction func didTapOnTryAgainBtn(_ sender: Any) {
        
        BASE_URL = BASE_URL1
        
        if key == "noresult" || key == "noseat"{
            let tabselect = defaults.string(forKey: UserDefaultsKeys.tabselect)
            if tabselect == "Flights" {
                guard let vc = SearchFlightsVC.newInstance.self else {return}
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }else {
                //                guard let vc = HolidaysVC.newInstance.self else {return}
                //                vc.modalPresentationStyle = .fullScreen
                //                self.present(vc, animated: true)
            }
            
            
        }else {
            NotificationCenter.default.post(name: NSNotification.Name("reload"), object: nil)
            NotificationCenter.default.post(name: NSNotification.Name("nointrnetreload"), object: nil)
            dismiss(animated: false)
        }
    }
    
    
}
