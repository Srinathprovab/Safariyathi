//
//  HolidayImagesTVCell.swift
//  Safariyati
//
//  Created by Admin on 23/09/24.
//

import UIKit

protocol HolidayImagesTVCellDelegate:AnyObject {
    func didTapOnMoreBtnAction(cell:HolidayImagesTVCell)
}

class HolidayImagesTVCell: TableViewCell {
    
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var bannerImg: UIImageView!
    @IBOutlet weak var imagesCV: UICollectionView!
    
    
    var itemCount = Int()
    var autoScrollTimer: Timer?
    var imagesArray = [String]()
    weak var delegate:HolidayImagesTVCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
       
    }
    
    
    override func updateUI() {
        
        self.bannerImg.sd_setImage(with: URL(string: cellInfo?.image ?? ""), placeholderImage: UIImage(named: "placeholder"), options: [.retryFailed], completed: { (image, error, cacheType, imageURL) in
            if let error = error {
                // Handle error loading image
              //  print("Error loading image: \(error.localizedDescription)")
                // Check if the error is due to a 404 Not Found response
                if (error as NSError).code == NSURLErrorBadServerResponse {
                    // Set placeholder image for 404 error
                    self.bannerImg.image = UIImage(named: "noimage")
                } else {
                    // Set placeholder image for other errors
                    self.bannerImg.image = UIImage(named: "noimage")
                }
            }
        })
        imagesArray = cellInfo?.moreData as? [String] ?? []
        imagesCV.reloadData()
    }
    
    func setupUI() {
        //        contentView.backgroundColor = HexColor("#E6E8E7")
        holderView.addCornerRadiusWithShadow(color: .clear, borderColor: UIColor.lightGray.withAlphaComponent(0.4), cornerRadius: 10)
        
        
        bannerImg.layer.cornerRadius = 8
        bannerImg.clipsToBounds = true
        bannerImg.contentMode = .scaleToFill
        
        setupCV()
        
    }
    
    
    
    
    func setupCV() {
        let nib = UINib(nibName: "HotelImagesCVCell", bundle: nil)
        imagesCV.register(nib, forCellWithReuseIdentifier: "cell")
        
        let nib1 = UINib(nibName: "ButtonCollectionViewCell", bundle: nil)
        imagesCV.register(nib1, forCellWithReuseIdentifier: "buttonCell")
        
        
        imagesCV.delegate = self
        imagesCV.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 6
        layout.minimumLineSpacing = 6
        
        // Calculate the cell width dynamically based on the collection view width
        let collectionViewWidth = imagesCV.frame.width
        let cellWidth = (collectionViewWidth - 6 * 3) / 4 // Assuming 4 cells with 6 spacing in between
        layout.itemSize = CGSize(width: cellWidth, height: 80)
        
        imagesCV.collectionViewLayout = layout
        imagesCV.backgroundColor = .clear
        imagesCV.layer.cornerRadius = 4
        imagesCV.clipsToBounds = true
        imagesCV.showsHorizontalScrollIndicator = false
        imagesCV.bounces = false
    }
    
    
}




extension HolidayImagesTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // If there are more than 4 images, return 5 (4 images + 1 button)
        return min(imagesArray.count, 3) + (imagesArray.count > 3 ? 1 : 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row < 3 { // For the first 4 images
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HotelImagesCVCell
            
            cell.hotelImg.sd_setImage(with: URL(string: imagesArray[indexPath.row]), placeholderImage: UIImage(named: "placeholder"), options: [.retryFailed], completed: { (image, error, cacheType, imageURL) in
                if let error = error {
                    // Handle error loading image
                  //  print("Error loading image: \(error.localizedDescription)")
                    // Check if the error is due to a 404 Not Found response
                    if (error as NSError).code == NSURLErrorBadServerResponse {
                        // Set placeholder image for 404 error
                        cell.hotelImg.image = UIImage(named: "noimage")
                    } else {
                        // Set placeholder image for other errors
                        cell.hotelImg.image = UIImage(named: "noimage")
                    }
                }
            })
            return cell
        } else { // For the button cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttonCell", for: indexPath) as! ButtonCollectionViewCell
            // Set the thumbnail image for the button
           // cell.moreBtn.setImage(UIImage(named: "thumbImage"), for: .normal)
            cell.img.sd_setImage(with: URL(string: imagesArray[3]), placeholderImage: UIImage(named: "placeholder"), options: [.retryFailed], completed: { (image, error, cacheType, imageURL) in
                if let error = error {
                    // Handle error loading image
                  //  print("Error loading image: \(error.localizedDescription)")
                    // Check if the error is due to a 404 Not Found response
                    if (error as NSError).code == NSURLErrorBadServerResponse {
                        // Set placeholder image for 404 error
                        cell.img.image = UIImage(named: "noimage")
                    } else {
                        // Set placeholder image for other errors
                        cell.img.image = UIImage(named: "noimage")
                    }
                }
            })
            cell.moreBtn.backgroundColor = .black.withAlphaComponent(0.5)
            cell.moreBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row < 3 {
            self.bannerImg.sd_setImage(with: URL(string: imagesArray[indexPath.row]), placeholderImage: UIImage(named: "placeholder"))
        } else {
            // Handle button tap action if needed
            buttonTapped()
        }
    }
    
    @objc func buttonTapped() {
        delegate?.didTapOnMoreBtnAction(cell: self)
    }
}

