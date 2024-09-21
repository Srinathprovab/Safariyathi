//
//  PopupVC.swift
//  Safariyati
//
//  Created by Admin on 20/09/24.
//

import UIKit

class PopupVC: UIViewController {
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var searchBtn: UIButton!
    
    static var newInstance: PopupVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? PopupVC
        return vc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    
    func setupUI() {
        self.view.backgroundColor = .black.withAlphaComponent(0.4)
        holderView.backgroundColor = .WhiteColor
        holderView.addCornerRadiusWithShadow(color: .clear, borderColor: .clear, cornerRadius: 5)
        setuplabels(lbl: titlelbl, text: "Your session expired. Your booking won't be completed.Please search again.", textcolor: .ApplabelColor, font: .InterRegular(size: 16), align: .center)

        searchBtn.layer.cornerRadius = 4
        searchBtn.titleLabel?.font = .InterBold(size: 16)
        searchBtn.addTarget(self, action: #selector(didTapOnSearchFlightAgainBtn(_:)), for: .touchUpInside)
        
    }
    
    
    @objc func didTapOnSearchFlightAgainBtn(_ sender:UIButton) {
        if let tabselect = defaults.string(forKey: UserDefaultsKeys.tabselect){
            if tabselect == "Flights" {
                gotoSearchFlightsVC()
            }else {
                gotoSearchHotelsVC()
            }
        }
    }
    
    
    func gotoSearchFlightsVC() {
        guard let vc = SearchFlightsVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    func gotoSearchHotelsVC() {
//        guard let vc = searchot.newInstance.self else {return}
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: false)
    }
    
    
}

