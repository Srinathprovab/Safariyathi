//
//  MoreDetailsVC.swift
//  Safariyati
//
//  Created by FCI on 09/04/24.
//

import UIKit

class MoreDetailsVC: UIViewController {
    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var topheadderView: UIView!
    
    static var newInstance: MoreDetailsVC? {
        let storyboard = UIStoryboard(name: Storyboard.Main.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? MoreDetailsVC
        return vc
    }
    var titleString = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    

    func setupUI() {
        topheadderView.applyGradient(colors: [HexColor("#0095DA"), HexColor("#04587E")])
        titlelbl.text = titleString
    }

    
    
    @IBAction func didTapOnBackBtnAction(_ sender: Any) {
        present_or_dismiss_vc.shared.dissmissview(view: view)
        dismiss(animated: true, completion: nil)
    }
    
}
