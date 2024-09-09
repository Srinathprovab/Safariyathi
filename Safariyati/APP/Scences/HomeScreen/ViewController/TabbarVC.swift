//
//  TabbarVC.swift
//  Safariyati
//
//  Created by FCI on 05/04/24.
//

import UIKit

class TabbarVC: UITabBarController {

    static var newInstance: TabbarVC? {
        let storyboard = UIStoryboard(name: Storyboard.Main.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? TabbarVC
        return vc
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarItems()
    }
    
    
    func setTabBarItems(){
        
        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
        myTabBarItem1.image = UIImage(named: "tab1")
        myTabBarItem1.selectedImage = UIImage(named: "tab1")?.withRenderingMode(.alwaysOriginal).withTintColor(HexColor("#E0142D"))
        myTabBarItem1.title = "Home"
        myTabBarItem1.imageInsets = UIEdgeInsets(top: -3, left: 0, bottom: -6, right: 0)
        let titleAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.InterRegular(size: 14) // Set your desired font size
        ]
        myTabBarItem1.setTitleTextAttributes(titleAttributes, for: .normal)
        
        let myTabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
        myTabBarItem2.image = UIImage(named: "tab2")
        myTabBarItem2.selectedImage = UIImage(named: "tab2")?.withRenderingMode(.alwaysOriginal).withTintColor(HexColor("#E0142D"))
        myTabBarItem2.title = "My Bookings"
        myTabBarItem2.imageInsets = UIEdgeInsets(top: -3, left: 0, bottom: -6, right: 0)
        let titleAttributes2: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.InterRegular(size: 14) // Set your desired font size
        ]
        myTabBarItem2.setTitleTextAttributes(titleAttributes2, for: .normal)
        
        
        let myTabBarItem3 = (self.tabBar.items?[2])! as UITabBarItem
        myTabBarItem3.image = UIImage(named: "tab3")
        myTabBarItem3.selectedImage = UIImage(named: "tab3")?.withRenderingMode(.alwaysOriginal).withTintColor(HexColor("#E0142D"))
        myTabBarItem3.title = "Account"
        myTabBarItem3.imageInsets = UIEdgeInsets(top: -3, left: 0, bottom: -6, right: 0)
        let titleAttributes3: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.InterRegular(size: 14) // Set your desired font size
        ]
        myTabBarItem3.setTitleTextAttributes(titleAttributes3, for: .normal)
        
        
        
        let myTabBarItem4 = (self.tabBar.items?[3])! as UITabBarItem
        myTabBarItem4.image = UIImage(named: "tab4")
        myTabBarItem4.selectedImage = UIImage(named: "tab4")?.withRenderingMode(.alwaysOriginal).withTintColor(HexColor("#E0142D"))
        myTabBarItem4.title = "More"
        myTabBarItem4.imageInsets = UIEdgeInsets(top: -3, left: 0, bottom: -6, right: 0)
        let titleAttributes4: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font: UIFont.InterRegular(size: 14) // Set your desired font size
        ]
        myTabBarItem4.setTitleTextAttributes(titleAttributes4, for: .normal)
        
    }
    
    
    
}
