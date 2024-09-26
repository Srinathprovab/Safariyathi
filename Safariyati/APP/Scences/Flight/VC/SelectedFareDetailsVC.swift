//
//  SelectedFareDetailsVC.swift
//  Safariyati
//
//  Created by Admin on 17/09/24.
//

import UIKit

class SelectedFareDetailsVC: BaseTableVC, TimerManagerDelegate {
    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var tabescv: UICollectionView!
    @IBOutlet weak var tabescvheight: NSLayoutConstraint!
    
    static var newInstance: SelectedFareDetailsVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? SelectedFareDetailsVC
        return vc
    }
    
    
   // var tabsArray = ["Fare Breakdown","Cancellation / Data Change","Brand Feature","Baggages"]
    var tabsArray = ["Fare Breakdown","Brand Feature","Baggages","Cancellation / Data Change"]
    var count = 0
    var payload = [String:Any]()
    var tablerow = [TableRow]()
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        if selectedfaredata?.brand_feature == nil {
            tabsArray = ["Fare Breakdown","Baggages","Cancellation / Data Change",]
        }
        
        if selectedfaredata?.cancellation_charges == nil {
            tabsArray = ["Fare Breakdown","Brand Feature","Baggages"]
        }
        
        if selectedfaredata?.baggage == nil  {
            tabsArray = ["Fare Breakdown","Brand Feature","Cancellation / Data Change"]
        }
        
        if selectedfaredata?.baggage == nil && selectedfaredata?.brand_feature == nil {
            tabsArray = ["Fare Breakdown","Cancellation / Data Change"]
        }
        
        
        if tabsArray.count == 4 {
            tabescvheight.constant = 130
        }else if tabsArray.count == 3 {
            tabescvheight.constant = 130
        }else {
            tabescvheight.constant = 70
        }
        
        addObserver()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        MySingleton.shared.delegate = self
        
    }
    
    @IBAction func didTapOnCloseBtnAction(_ sender: Any) {
        callapibool = false
        dismiss(animated: true)
    }
    
    
}


extension SelectedFareDetailsVC {
    
    
    
    func setupUI() {
        
        setuplabels(lbl: titlelbl, text: selectedfaredata?.fare_heading ?? "", textcolor: .WhiteColor, font: .InterBold(size: 16), align: .center)
        
        commonTableView.backgroundColor = .WhiteColor
        commonTableView.registerTVCells(["FareFamilyTVCell",
                                         "FareBaggageTVCells",
                                         "FareBreakdownTVCell",
                                         "EmptyTVCell"])
        
        setupCV()
        setupFarebreckdownTVCells()
    }
    
    
    func setupFarebreckdownTVCells() {
        tablerow.removeAll()
        
        selectedfaredata?.farebreckdown?.forEach({ i in
            tablerow.append(TableRow(moreData: i,cellType: .FareBreakdownTVCell))
        })
        
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    
    func setupCancellationChargesTV() {
        tablerow.removeAll()
        
        tablerow.append(TableRow(key:"cancellation",cellType: .FareBaggageTVCells))
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    func setupbaggageTVcells() {
        tablerow.removeAll()
        
        guard let baggagekeyArray = selectedfaredata?.baggage_key else {
            return
        }
        
        
        guard let baggageArray = selectedfaredata?.baggage else {
            return
        }
        
        for (index, value) in baggageArray.enumerated() {
            tablerow.append(TableRow(key:"baggage",
                                     data: baggagekeyArray,
                                     moreData: value,
                                     characterLimit: index,
                                     cellType: .FareBaggageTVCells))
        }
        
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
    
    
    func setupBrandFeaturesTVCells() {
        tablerow.removeAll()
        
        guard let brandfeatureArray = selectedfaredata?.brand_feature else {
            return
        }
        
        brandfeatureArray.forEach { i in
            
            if i.free != nil {
                tablerow.append(TableRow(key:"free",moreData: i.free,cellType: .FareFamilyTVCell))
            }
            
            tablerow.append(TableRow(height: 10,cellType: .EmptyTVCell))
            
            if i.chargeable != nil {
                tablerow.append(TableRow(key:"chargeable",moreData: i.chargeable,cellType: .FareFamilyTVCell))
            }
            
            tablerow.append(TableRow(height: 40,cellType: .EmptyTVCell))
            
        }
        
        
        tablerow.append(TableRow(height: 50,cellType: .EmptyTVCell))
        
        commonTVData = tablerow
        commonTableView.reloadData()
    }
}



extension SelectedFareDetailsVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func setupCV() {
        
        
        let nib = UINib(nibName: "CabinClassCVCell", bundle: nil)
        tabescv.register(nib, forCellWithReuseIdentifier: "cell")
        tabescv.delegate = self
        tabescv.dataSource = self
        // Configure the flow layout
        if let layout = tabescv.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
//            layout.minimumInteritemSpacing = 5
//            layout.minimumLineSpacing = 5
            layout.sectionInset = UIEdgeInsets(top: 0, left: 25, bottom: 20, right: 25)
            layout.estimatedItemSize = CGSize(width: 140, height: 35)
            // layout.itemSize = UICollectionViewFlowLayout.automaticSize
        }
        tabescv.bounces = false
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var commonCell = UICollectionViewCell()
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CabinClassCVCell {
            
            
            cell.titlelbl.text = tabsArray[indexPath.row]
            
            
            
            if cell.titlelbl.text == "Fare Breakdown" {
                
                if let index = tabsArray.firstIndex(of: cell.titlelbl.text ?? "") {
                    
                    cell.titlelbl.textColor = .WhiteColor
                    cell.holderView.backgroundColor = .Buttoncolor
                    
                    let firstIndexPath = IndexPath(item: index, section: 0)
                    tabescv.selectItem(at: firstIndexPath, animated: false, scrollPosition: .left)
                }
                
            }
            
            commonCell = cell
        }
        return commonCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CabinClassCVCell {
            cell.titlelbl.textColor = .WhiteColor
            cell.holderView.backgroundColor = .Buttoncolor
            
            
            switch cell.titlelbl.text {
            case "Cancellation / Data Change":
                setupCancellationChargesTV()
                break
                
                
            case "Baggages":
                setupbaggageTVcells()
                break
                
                
            case "Brand Feature":
                setupBrandFeaturesTVCells()
                break
                
                
            case "Fare Breakdown":
                setupFarebreckdownTVCells()
                break
                
                
                
            default:
                break
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CabinClassCVCell {
            cell.titlelbl.textColor = .TitleColor
            cell.holderView.backgroundColor = HexColor("#E6E8E9")
        }
    }
    
    
    // UICollectionViewDelegateFlowLayout Methods

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Get the text for the current indexPath
        let cityName = tabsArray[indexPath.row]
        
        // Calculate the width required for the label text
        let size = (cityName as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.InterSemiBold(size: 14)])
        
        // Define padding to add to both sides of the text
        let padding: CGFloat = 20
        
        // Define min and max widths to ensure cells are not too small or too wide
        let minWidth: CGFloat = 80   // Minimum width to ensure small text doesn't cause issues
        let maxWidth: CGFloat = collectionView.bounds.width - 40 // Max width so the cell doesn't exceed the view width

        // Calculate the final width with padding
        var width = size.width + padding

        // Ensure the width stays within the min and max range
        width = max(minWidth, min(width, maxWidth))
        
        // Return the calculated size for the cell
        return CGSize(width: width, height: 34)
    }

   


    // Set minimum spacing between items (10 points)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Set space between cells
    }

    // Optional: Set minimum spacing between rows (if you have multiple rows)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10 // Set space between rows
    }

    
    
}



extension SelectedFareDetailsVC  {
    
    
    func addObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(nointernet), name: Notification.Name("offline"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(resultnil), name: NSNotification.Name("resultnil"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(nointrnetreload), name: Notification.Name("nointrnetreload"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: Notification.Name("reload"), object: nil)
        
        if callapibool == true {
            DispatchQueue.main.async {
                // self.call()
            }
        }
        
    }
    
    
    @objc func reload() {
        DispatchQueue.main.async {[self] in
            // commonTableView.reloadData()
        }
    }
    
    @objc func nointrnetreload() {
        
        DispatchQueue.main.async {
            // self.callSelecedFareDetailsAPI()
        }
    }
    
    //MARK: - resultnil
    @objc func resultnil() {
        guard let vc = NoInternetConnectionVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        vc.key = "noresult"
        self.present(vc, animated: true)
    }
    
    
    //MARK: - nointernet
    @objc func nointernet() {
        
        guard let vc = NoInternetConnectionVC.newInstance.self else {return}
        vc.modalPresentationStyle = .overCurrentContext
        vc.key = "nointernet"
        self.present(vc, animated: true)
    }
    
    
    //MARK: - updateTimer
    func updateTimer() {
        
    }
    
    
    func timerDidFinish() {
        gotoPopupScreen()
    }
    
    func gotoPopupScreen() {
        guard let vc = PopupVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
}
