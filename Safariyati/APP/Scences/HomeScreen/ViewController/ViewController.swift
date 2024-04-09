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
