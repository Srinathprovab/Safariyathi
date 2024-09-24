//
//  HolidaysSearchResultTVCell.swift
//  Safariyati
//
//  Created by Admin on 23/09/24.
//

import UIKit

class HolidaysSearchResultTVCell: TableViewCell {
    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var inclusionslbl: UILabel!
    @IBOutlet weak var dayslbl: UILabel!
    @IBOutlet weak var nightslbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var kwdlbl: UILabel!
    @IBOutlet weak var refundablelbl: UILabel!
    @IBOutlet weak var refundableView: UIView!
    @IBOutlet weak var InclusionsCV: UICollectionView!
    
    var tourid = String()
    var tourpackageName = String()
    var inclsionArray = [String]()
    var list :TourSearchListData?
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
        setuplabels(lbl: titlelbl, text: "", textcolor: .ApplabelColor, font: .InterBold(size: 16), align: .left)
        setuplabels(lbl: inclusionslbl, text: "Inclusions", textcolor: .ApplabelColor, font: .InterRegular(size: 14), align: .left)
        setuplabels(lbl: dayslbl, text: "Days", textcolor: .ApplabelColor, font: .InterBold(size: 14), align: .left)
        setuplabels(lbl: nightslbl, text: "Nights", textcolor: .ApplabelColor, font: .InterBold(size: 14), align: .left)
        setuplabels(lbl: refundablelbl, text: "Refundable", textcolor: .Refundcolor, font: .InterBold(size: 14), align: .left)
        
        img.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        img.layer.cornerRadius = 8
        img.clipsToBounds = true
        
        
        refundableView.layer.cornerRadius = 10
        refundableView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        refundableView.clipsToBounds = true
        
        
        setupCV()
    }
    
    
    override func updateUI() {
        list = cellInfo?.moreData as? TourSearchListData
        
        tourid = list?.id ?? ""
        tourpackageName = list?.package_name ?? ""
        inclsionArray = list?.inclusions_checks ?? []
        titlelbl.text = list?.package_name ?? ""
        let value = Int(list?.duration ?? "")
        dayslbl.text = "\((value ?? 0) + 1) Days"
        nightslbl.text = "\(list?.duration ?? "") Nights"
        
        
        self.img.sd_setImage(with: URL(string: list?.banner_image ?? ""),
                             placeholderImage: UIImage(named: "placeholder.png"), options: [.retryFailed], completed: { (image, error, cacheType, imageURL) in
            if let error = error {
                print("Error loading banner image: \(error.localizedDescription)")
                if (error as NSError).code == NSURLErrorBadServerResponse {
                    self.img.image = UIImage(named: "noimage")
                } else {
                    self.img.image = UIImage(named: "noimage")
                }
            }
        })
        
        
        MySingleton.shared.setAttributedTextnew(str1: list?.currency ?? "",
                                                str2: " \(list?.price ?? 0)",
                                                lbl: kwdlbl,
                                                str1font: .InterBold(size: 14),
                                                str2font: .InterBold(size: 20),
                                                str1Color: .Buttoncolor,
                                                str2Color: .Buttoncolor)
        
    }
    
    
    
}




extension HolidaysSearchResultTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCV() {
        let nib = UINib(nibName: "InclusionsCVCell", bundle: nil)
        InclusionsCV.register(nib, forCellWithReuseIdentifier: "cell")
        InclusionsCV.delegate = self
        InclusionsCV.dataSource = self

        if let layout = InclusionsCV.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = 5
            layout.minimumLineSpacing = 5
            layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
            layout.estimatedItemSize = CGSize(width: 50, height: 75)
          //  layout.itemSize = UICollectionViewFlowLayout.automaticSize
        }

        InclusionsCV.bounces = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inclsionArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var commonCell = UICollectionViewCell()
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? InclusionsCVCell {
            cell.titlelbl.text = inclsionArray[indexPath.row]
            
            switch cell.titlelbl.text {
            case "Hotel":
                cell.img.image = UIImage(named: "Hotel")
            case "Car":
                cell.img.image = UIImage(named: "Car")
            case "Meals":
                cell.img.image = UIImage(named: "Meals")
            case "Sightseeing":
                cell.img.image = UIImage(named: "Sightseeing")
            case "Transfers":
                cell.img.image = UIImage(named: "Transfers")
            default:
                break
            }
            
            
            
            commonCell = cell
        }
        return commonCell
    }

   
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Get the text for the current indexPath
        let cityName = inclsionArray[indexPath.row]
        
        // Calculate the width required for the label text
        let size = (cityName as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.InterSemiBold(size: 10)])
        
        // Add some padding to the calculated size
        let width = size.width + 20 // Adjust padding as needed
        
        return CGSize(width: width, height: 75)
    }
    
}
