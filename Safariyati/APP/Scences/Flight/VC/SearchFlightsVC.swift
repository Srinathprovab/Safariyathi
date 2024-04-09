//
//  SearchFlightsVC.swift
//  Safariyati
//
//  Created by FCI on 08/04/24.
//

import UIKit




class SearchFlightsVC: BaseTableVC {
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var backBtn: UIButton!
    
    static var newInstance: SearchFlightsVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? SearchFlightsVC
        return vc
    }
    
    var tablerow = [TableRow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    
    func setupUI() {
        
        backBtn.addTarget(self, action: #selector(didTapOnBackButtonAction), for: .touchUpInside)
        commonTableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        commonTableView.layer.cornerRadius = 20
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["SearchFlightsTVCell"])
        
        setupTV()
    }
    
    @objc func didTapOnBackButtonAction() {
        present_or_dismiss_vc.shared.dissmissview(view: view)
        dismiss(animated: true, completion: nil)
    }
    
    
    override func didTapOnOnewayBtnAction(cell: SearchFlightsTVCell) {
        defaults.setValue("oneway", forKey: UserDefaultsKeys.journeyType)
        commonTableView.reloadData()
    }
    
    override func didTapOnRoundtripBtnAction(cell: SearchFlightsTVCell) {
        defaults.setValue("circle", forKey: UserDefaultsKeys.journeyType)
        commonTableView.reloadData()
    }
    
}


extension SearchFlightsVC {
    
    func setupTV() {
        tablerow.removeAll()
        tablerow.append(TableRow(cellType:.SearchFlightsTVCell))
        commonTVData = tablerow
        commonTableView.reloadData()
    }
}


extension SearchFlightsVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInFromLeftTransitionAnimator() // Use SlideInFromLeftTransitionAnimator for presenting from left to right
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInFromRightTransitionAnimator() // Use SlideInFromRightTransitionAnimator for dismissing from right to left
    }
}
