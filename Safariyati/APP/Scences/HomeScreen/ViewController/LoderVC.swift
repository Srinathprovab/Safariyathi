//
//  LoderVC.swift
//  Safariyati
//
//  Created by Admin on 12/09/24.
//

import UIKit

class LoderVC: UIViewController {
    
    
    
    @IBOutlet weak var fromcitylbl: UILabel!
    @IBOutlet weak var tocitylbl: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var flightEconomylbl: UILabel!
    @IBOutlet weak var gifimg: UIImageView!
    
    
    // Don't forget to invalidate the timer when the view controller is deallocated
    deinit {
        stopGifAnimation()
    }
    
    var gifImages: [UIImage] = []
    var currentFrame: Int = 0
    var timer: Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        
        loadGifFrames()
        startGifAnimation()
    }
    
    
    func setupUI() {
        
        
        setuplabels(lbl: fromcitylbl, text: "", textcolor: .Farecolor, font: .InterBold(size: 18), align: .center)
        setuplabels(lbl: datelbl, text: "", textcolor: .TitleColor, font: .InterMedium(size: 14), align: .center)
        setuplabels(lbl: flightEconomylbl, text: "", textcolor: .TitleColor, font: .InterMedium(size: 14), align: .center)
        
        
        fromcitylbl.text = "\(defaults.string(forKey: UserDefaultsKeys.fromairportname) ?? "")"
        tocitylbl.text = "\(defaults.string(forKey: UserDefaultsKeys.toairportname) ?? "")"
       
        
        
        let tabselect = defaults.string(forKey: UserDefaultsKeys.tabselect)
        if tabselect == "Flights" {
            
            
            let journyType = defaults.string(forKey: UserDefaultsKeys.journeyType)
            if journyType == "oneway" {
                
               
                datelbl.text = "\(MySingleton.shared.convertDateFormat(inputDate: defaults.string(forKey: UserDefaultsKeys.calDepDate) ?? "", f1: "dd-MM-yyyy", f2: "dd MMM yyyy"))"
             
                
                
                let adultcount = defaults.integer(forKey: UserDefaultsKeys.adultCount)
                let childcount = defaults.integer(forKey: UserDefaultsKeys.childCount)
                let infantcount = defaults.integer(forKey: UserDefaultsKeys.infantsCount)
                let classname = defaults.string(forKey: UserDefaultsKeys.selectClass)
                var labelText = adultcount > 1 ? "\(adultcount) Adults" : "\(adultcount) Adult"
                if childcount > 0 {
                    labelText += ",\(childcount) Child"
                }
                if infantcount > 0 {
                    labelText += ",\(infantcount) Infant"
                }
                flightEconomylbl.text = "Oneway | \(classname ?? "")"
                
                
            }else {
                
               
                datelbl.text = "\(MySingleton.shared.convertDateFormat(inputDate: defaults.string(forKey: UserDefaultsKeys.calDepDate) ?? "", f1: "dd-MM-yyyy", f2: "dd MMM yyyy")) - \(MySingleton.shared.convertDateFormat(inputDate: defaults.string(forKey: UserDefaultsKeys.calRetDate) ?? "", f1: "dd-MM-yyyy", f2: "dd MMM yyyy"))"
                
                
                
                let adultcount = defaults.integer(forKey: UserDefaultsKeys.adultCount)
                let childcount = defaults.integer(forKey: UserDefaultsKeys.childCount)
                let infantcount = defaults.integer(forKey: UserDefaultsKeys.infantsCount)
                let classname = defaults.string(forKey: UserDefaultsKeys.selectClass)
                var labelText = adultcount > 1 ? "\(adultcount) Adults" : "\(adultcount) Adult"
                if childcount > 0 {
                    labelText += ",\(childcount) Child"
                }
                if infantcount > 0 {
                    labelText += ",\(infantcount) Infant"
                }
                flightEconomylbl.text = "Roundtrip | \(classname ?? "")"
                
                
            }
            
            
        }
        
    }
    
}




class DotsLoaderViewnew: UIView {
    
    private let dotSize: CGFloat = 15.0
    private let dotSpacing: CGFloat = 8.0
    private let dotColor: UIColor = .systemBlue
    private let animationDuration: CFTimeInterval = 0.6
    
    private var dots = [UIView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDots()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDots()
    }
    
    private func setupDots() {
        for i in 0..<3 {
            let dot = createDot()
            dot.frame.origin.x = CGFloat(i) * (dotSize + dotSpacing)
            addSubview(dot)
            dots.append(dot)
        }
        
        // Center the dots
        self.frame.size = CGSize(width: (dotSize * 3) + (dotSpacing * 2), height: dotSize)
    }
    
    private func createDot() -> UIView {
        let dot = UIView()
        dot.frame.size = CGSize(width: dotSize, height: dotSize)
        dot.backgroundColor = dotColor
        dot.layer.cornerRadius = dotSize / 2
        return dot
    }
    
    func startAnimating() {
        for (index, dot) in dots.enumerated() {
            animateDot(dot, delay: Double(index) * animationDuration / 3)
        }
    }
    
    func stopAnimating() {
        for dot in dots {
            dot.layer.removeAllAnimations()
        }
    }
    
    private func animateDot(_ dot: UIView, delay: Double) {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 0.5, 1.0]
        bounceAnimation.keyTimes = [0, 0.5, 1]
        bounceAnimation.duration = animationDuration
        bounceAnimation.beginTime = CACurrentMediaTime() + delay
        bounceAnimation.repeatCount = .infinity
        bounceAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        dot.layer.add(bounceAnimation, forKey: "bounce")
    }
}








extension LoderVC {
    
    func loadGifFrames() {
        gifImages = []
        if let gifURL = Bundle.main.url(forResource: "loder", withExtension: "gif"),
           let gifSource = CGImageSourceCreateWithURL(gifURL as CFURL, nil) {
            let frameCount = CGImageSourceGetCount(gifSource)
            
            for index in 0..<frameCount {
                autoreleasepool {
                    if let cgImage = CGImageSourceCreateImageAtIndex(gifSource, index, nil) {
                        let uiImage = UIImage(cgImage: cgImage)
                        if let resizedImage = uiImage.resized(toWidth: 100) { // Resize to a smaller width
                            gifImages.append(resizedImage)
                        }
                    }
                }
            }
        }
    }
    
    
    func startGifAnimation() {
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(updateGifFrame), userInfo: nil, repeats: true)
    }
    
    @objc func updateGifFrame() {
        gifimg.image = gifImages[currentFrame]
        currentFrame += 1
        
        if currentFrame >= gifImages.count {
            currentFrame = 0
        }
    }
    
   
    
    func stopGifAnimation() {
        gifImages.removeAll()
        timer?.invalidate()
        timer = nil
    }
}


extension UIImage {
    func resized(toWidth width: CGFloat) -> UIImage? {
        let scale = width / self.size.width
        let newHeight = self.size.height * scale
        let newSize = CGSize(width: width, height: newHeight)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(origin: .zero, size: newSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
}
