//
//  ViewController.swift
//  Safariyati
//
//  Created by FCI on 05/04/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        // Do any additional setup after loading the view.
        if !UserDefaults.standard.bool(forKey: "ExecuteOnce") {
            
            defaults.set("Origin", forKey: UserDefaultsKeys.fromcityname)
            defaults.set("Destination", forKey: UserDefaultsKeys.tocityname)
            
            defaults.set("KWD", forKey: UserDefaultsKeys.selectedCurrency)
            defaults.set("ALL", forKey: UserDefaultsKeys.fcariername)
            defaults.set("ALL", forKey: UserDefaultsKeys.fcariercode)
            
            defaults.set("1", forKey: UserDefaultsKeys.adultCount)
            defaults.set("0", forKey: UserDefaultsKeys.childCount)
            defaults.set("0", forKey: UserDefaultsKeys.infantsCount)
            defaults.set("1", forKey: UserDefaultsKeys.totalTravellerCount)
            defaults.set("Economy", forKey: UserDefaultsKeys.selectClass)
            
         
            
//            defaults.set("1 Passenger", forKey: UserDefaultsKeys.visatotalpassengercount)
//            defaults.set("1", forKey: UserDefaultsKeys.activitesadultCount)
//            defaults.set("2", forKey: UserDefaultsKeys.guestcount)
//            
//            
//            
//            defaults.set("Select Nationality", forKey: UserDefaultsKeys.hnationality)
//            defaults.set("", forKey: UserDefaultsKeys.hnationalitycode)
            
            
            
            UserDefaults.standard.set(true, forKey: "ExecuteOnce")
            
        }
        
        
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            self.gotodashBoardScreen()
        })
        
        
    }
    
    func gotodashBoardScreen() {
        guard let vc = TabbarVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.selectedIndex = 0
        present(vc, animated: false)
    }
    
}


class present_or_dismiss_vc {
    
    static let shared = present_or_dismiss_vc()
    
    
    func fromRight(view:UIView) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeIn)
        view.window!.layer.add(transition, forKey: kCATransition)
    
    }
    
    func dissmissview(view:UIView) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeOut)
        view.window!.layer.add(transition, forKey: kCATransition)
    
    }
    
    
}
