//
//  CabinClassTVCell.swift
//  Safariyati
//
//  Created by FCI on 10/04/24.
//

import UIKit

class CabinClassTVCell: TableViewCell {
    
    
    @IBOutlet weak var cabinclassCV: UICollectionView!
    
    
    var classesArray = ["Economy","Premium Economy","Business","Frist"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    override func updateUI() {
        cabinclassCV.reloadData()
    }
    
    func setupUI() {
        setupCV()
    }
    
}


extension CabinClassTVCell:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func setupCV() {
        
        
        let nib = UINib(nibName: "CabinClassCVCell", bundle: nil)
        cabinclassCV.register(nib, forCellWithReuseIdentifier: "cell")
        cabinclassCV.delegate = self
        cabinclassCV.dataSource = self
        // Configure the flow layout
            if let layout = cabinclassCV.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = .vertical
                layout.minimumInteritemSpacing = 5
                layout.minimumLineSpacing = 5
                layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
                layout.estimatedItemSize = CGSize(width: 140, height: 35)
                layout.itemSize = UICollectionViewFlowLayout.automaticSize
            }
        cabinclassCV.bounces = false
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return classesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var commonCell = UICollectionViewCell()
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CabinClassCVCell {
            
            
            cell.titlelbl.text = classesArray[indexPath.row]

            
            
            if cell.titlelbl.text == defaults.string(forKey: UserDefaultsKeys.selectClass) {
                
                if let index = classesArray.firstIndex(of: cell.titlelbl.text ?? "") {
                    
                    cell.titlelbl.textColor = .WhiteColor
                    cell.holderView.backgroundColor = .Buttoncolor
                    
                    let firstIndexPath = IndexPath(item: index, section: 0)
                    cabinclassCV.selectItem(at: firstIndexPath, animated: false, scrollPosition: .left)
                }
                
            }
            
//            else {
//                if indexPath.row == 0 {
//                    cell.titlelbl.textColor = .WhiteColor
//                    cell.holderView.backgroundColor = .Buttoncolor
//                    
//                    let firstIndexPath = IndexPath(item: 0, section: 0)
//                    cabinclassCV.selectItem(at: firstIndexPath, animated: false, scrollPosition: .left)
//                }
//            }
            
            
           
            
           
            
            commonCell = cell
        }
        return commonCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CabinClassCVCell {
            cell.titlelbl.textColor = .WhiteColor
            cell.holderView.backgroundColor = .Buttoncolor
            defaults.set(cell.titlelbl.text ?? "", forKey: UserDefaultsKeys.selectClass)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CabinClassCVCell {
            cell.titlelbl.textColor = .TitleColor
            cell.holderView.backgroundColor = HexColor("#E6E8E9")
        }
    }
    
    
    
    
    
}
