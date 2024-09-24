//
//  HolidayDeatilsButtonsTVCell.swift
//  Safariyati
//
//  Created by Admin on 24/09/24.
//

import UIKit

protocol HolidayDeatilsButtonsTVCellDelegate {
    
    func didTapOverviewBtnAction(cell:HolidayDeatilsButtonsTVCell)
    func didTapItineraryBtnAction(cell:HolidayDeatilsButtonsTVCell)
    func didTapDatesAndPricesBtnAction(cell:HolidayDeatilsButtonsTVCell)
    func didTapInclusionsBtnAction(cell:HolidayDeatilsButtonsTVCell)
    func didTapTripNotesBtnAction(cell:HolidayDeatilsButtonsTVCell)
    func didTapPostReviewBtnAction(cell:HolidayDeatilsButtonsTVCell)
    func didTapTermsAndConditionsBtnAction(cell:HolidayDeatilsButtonsTVCell)
    
}

class HolidayDeatilsButtonsTVCell: TableViewCell {
    
    @IBOutlet weak var detailsBtnsCV: UICollectionView!
    
    
    var indexpathArray = [IndexPath]()
    var btnsArray = ["Overview","Itinerary","Dates & Prices","Inclusions","Trip Notes","Post a Review","Terms & Conditions"]
    var delegate:HolidayDeatilsButtonsTVCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCV()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


extension HolidayDeatilsButtonsTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCV() {
        let nib = UINib(nibName: "CabinClassCVCell", bundle: nil)
        detailsBtnsCV.register(nib, forCellWithReuseIdentifier: "cell")
        detailsBtnsCV.delegate = self
        detailsBtnsCV.dataSource = self
        
        if let layout = detailsBtnsCV.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = 5
            layout.minimumLineSpacing = 5
            layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            layout.estimatedItemSize = CGSize(width: 150, height: 40)
            //layout.itemSize = UICollectionViewFlowLayout.automaticSize
        }
        
        detailsBtnsCV.bounces = false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return btnsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var commonCell = UICollectionViewCell()
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CabinClassCVCell {
            cell.titlelbl.text = btnsArray[indexPath.row]
            
            
            if indexPath.row == 0 {
                cell.holderView.backgroundColor = .Buttoncolor
                cell.titlelbl.textColor = .WhiteColor
                collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .left)
            }
            
            if indexpathArray.contains(indexPath) {
                cell.holderView.backgroundColor = .Buttoncolor
                cell.titlelbl.textColor = .WhiteColor
                collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .left)
            }
            
            
            
            commonCell = cell
        }
        return commonCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CabinClassCVCell {
            
            indexpathArray.removeAll()
            indexpathArray.append(indexPath)
            
            cell.holderView.backgroundColor = .Buttoncolor
            cell.titlelbl.textColor = .WhiteColor
            
            switch cell.titlelbl.text {
            case "Overview":
                delegate?.didTapOverviewBtnAction(cell: self)
                break
            case "Itinerary":
                delegate?.didTapItineraryBtnAction(cell: self)
                break
            case "Dates & Prices":
                delegate?.didTapDatesAndPricesBtnAction(cell: self)
                break
            case "Inclusions":
                delegate?.didTapInclusionsBtnAction(cell: self)
                break
            case "Trip Notes":
                delegate?.didTapTripNotesBtnAction(cell: self)
                break
            case "Post a Review":
                delegate?.didTapPostReviewBtnAction(cell: self)
                break
            case "Terms & Conditions":
                delegate?.didTapTermsAndConditionsBtnAction(cell: self)
                break
            default:
                break
            }
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CabinClassCVCell {
            cell.holderView.backgroundColor = .TxtFldbgColor
            cell.titlelbl.textColor = .ApplabelColor
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Get the text for the current indexPath
        let cityName = btnsArray[indexPath.row]
        
        // Calculate the width required for the label text
        let size = (cityName as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.InterSemiBold(size: 10)])
        
        // Add some padding to the calculated size
        let width = size.width + 20 // Adjust padding as needed
        
        return CGSize(width: width, height: 40)
    }
    
}
