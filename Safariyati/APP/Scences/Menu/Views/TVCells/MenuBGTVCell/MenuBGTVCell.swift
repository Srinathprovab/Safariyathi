//
//  MenuBGTVCell.swift
//  Safariyati
//
//  Created by FCI on 06/04/24.
//

import UIKit

class MenuBGTVCell: TableViewCell {

    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var titlelblView: UIView!
    @IBOutlet weak var noProfileView: UIView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var noProfileImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var emaillbl: UILabel!
    @IBOutlet weak var phonelbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupUI() {
        holderView.applyGradient(colors: [HexColor("#0095DA"), HexColor("#04587E")])
        holderView.layer.cornerRadius = 10
        noProfileView.layer.cornerRadius = 40
        profileView.layer.cornerRadius = 40
        
        titlelblView.isHidden = true
        profileView.isHidden = true
        noProfileView.isHidden = false
        profileImage.image = UIImage(named: "noprofile")
        noProfileImage.image = UIImage(named: "noprofile")
    }
    
}


extension UIView {
    func applyGradient(colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
