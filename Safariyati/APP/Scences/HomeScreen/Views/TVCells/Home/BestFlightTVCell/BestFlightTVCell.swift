//
//  BestFlightTVCell.swift
//  Safariyati
//
//  Created by FCI on 05/04/24.
//

import UIKit

class BestFlightTVCell: TableViewCell {
    
    
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var bestFlightsCV: UICollectionView!
    
    
    var currentPage: Int = 0
    var timer: Timer?
    let pageControl = CustomPageControl()
    var customPageControl: CustomPageControl?// Define UIPageControl as a property
    
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
        bestFlightsCV.restore()
        
    }
    
    
    func setupUI(){
        setuplabels(lbl: titlelbl, text: "Recommended Best Flight", textcolor: .ApplabelColor, font: .InterBold(size: 16), align: .center)
        setupCV()
    }
    
}


extension BestFlightTVCell:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func setupCV() {
        let nib = UINib(nibName: "BestFlightCVCell", bundle: nil)
        bestFlightsCV.register(nib, forCellWithReuseIdentifier: "cell")
        bestFlightsCV.delegate = self
        bestFlightsCV.dataSource = self
        let layout = UICollectionViewFlowLayout()
        
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 334, height: 180)
        
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        bestFlightsCV.collectionViewLayout = layout
        bestFlightsCV.backgroundColor = .clear
        bestFlightsCV.showsHorizontalScrollIndicator = false
        bestFlightsCV.bounces = false
        
        addPageControl()
    }
    
    
    func addPageControl() {
        let customPageControl = CustomPageControl()
        customPageControl.activeImage = UIImage(named: "dot1") // Provide your active dot image
        customPageControl.inactiveImage = UIImage(named: "dot2") // Provide your inactive dot image
        
        customPageControl.numberOfPages = flighttopdestinations.count // Update with your actual number of items
        customPageControl.currentPage = 0
        customPageControl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(customPageControl)
        
        NSLayoutConstraint.activate([
            customPageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            customPageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        ])
        
        // Assign customPageControl to the property
        self.customPageControl = customPageControl
        
        // Start auto-scrolling timer
        startTimer()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flighttopdestinations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var commonCell = UICollectionViewCell()
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? BestFlightCVCell {
            
            let data = flighttopdestinations[indexPath.row]
            
            cell.img.sd_setImage(with: URL(string: data.image ?? ""), placeholderImage:UIImage(contentsOfFile:"placeholder.png"), options: [.retryFailed], completed: { (image, error, cacheType, imageURL) in
                if let error = error {
                    // Handle error loading image
                   // print("Error loading image: \(error.localizedDescription)")
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
            
            cell.titlelbl.text = "\(data.from_city_name ?? "")(\(data.from_city_loc ?? "")) - \(data.to_city_name ?? "")(\(data.to_city_loc ?? ""))"
            
            
            commonCell = cell
        }
        return commonCell
    }
    
    
}



//MARK: - startTimer
extension BestFlightTVCell {
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(scrollToNextPage), userInfo: nil, repeats: true)
    }
    
    @objc func scrollToNextPage() {
         let totalItems = flighttopdestinations.count 

        
        currentPage += 1
        if currentPage >= totalItems {
            currentPage = 0
        }
        
        let indexPath = IndexPath(item: currentPage, section: 0)
        bestFlightsCV.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        // Use customPageControl to update the current page
        customPageControl?.currentPage = currentPage
    }

    
    
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // Invalidate timer when user starts dragging manually
        timer?.invalidate()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Restart auto-scrolling timer when user stops dragging
        startTimer()
    }
}



class CustomPageControl: UIPageControl {
    var activeImage: UIImage?
    var inactiveImage: UIImage?
    
    override var currentPage: Int {
        didSet {
            updateDots()
        }
    }
    
    override var numberOfPages: Int {
        didSet {
            updateDots()
        }
    }
    
    private var dotViews: [UIImageView] = []
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Remove existing dot views
        dotViews.forEach { $0.removeFromSuperview() }
        dotViews.removeAll()
        
        // Add new dot views
        for i in 0..<numberOfPages {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = i == currentPage ? activeImage : inactiveImage
            dotViews.append(imageView)
            addSubview(imageView)
        }
        updateDotPositions()
    }
    
    private func updateDots() {
        for (index, dotView) in dotViews.enumerated() {
            dotView.image = index == currentPage ? activeImage : inactiveImage
        }
    }
    
    private func updateDotPositions() {
        guard let activeImage = activeImage, let inactiveImage = inactiveImage else { return }
        
        let dotSize = activeImage.size.width // Use the width of the active dot image as the dot size
        let spacing: CGFloat = 10 // Adjust the spacing between dots as needed
        let totalWidth = CGFloat(numberOfPages) * dotSize + CGFloat(max(0, numberOfPages - 1)) * spacing
        var x = (bounds.width - totalWidth) / 2
        
        for dotView in dotViews {
            dotView.frame = CGRect(x: x, y: (bounds.height - dotSize) / 2, width: dotSize, height: dotSize)
            x += dotSize + spacing
        }
    }
}



