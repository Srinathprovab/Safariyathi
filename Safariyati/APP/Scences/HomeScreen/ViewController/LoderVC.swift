//
//  LoderVC.swift
//  Safariyati
//
//  Created by Admin on 12/09/24.
//

import UIKit

class LoderVC: UIViewController {
    
    
    
    @IBOutlet weak var cityslbl: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var flightEconomylbl: UILabel!
    
    @IBOutlet weak var dotsview: DotLoaderView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        
    }
    
    
    func setupUI() {
        
        
        setuplabels(lbl: cityslbl, text: "", textcolor: .Farecolor, font: .InterBold(size: 18), align: .center)
        setuplabels(lbl: datelbl, text: "", textcolor: .TitleColor, font: .InterMedium(size: 14), align: .center)
        setuplabels(lbl: flightEconomylbl, text: "", textcolor: .TitleColor, font: .InterMedium(size: 14), align: .center)
        
        let tabselect = defaults.string(forKey: UserDefaultsKeys.tabselect)
        if tabselect == "Flights" {
            
            
            let journyType = defaults.string(forKey: UserDefaultsKeys.journeyType)
            if journyType == "oneway" {
                
                cityslbl.text = "\(defaults.string(forKey: UserDefaultsKeys.fromcityname) ?? "") - \(defaults.string(forKey: UserDefaultsKeys.tocityname) ?? "")"
                datelbl.text = "\(MySingleton.shared.convertDateFormat(inputDate: defaults.string(forKey: UserDefaultsKeys.calDepDate) ?? "", f1: "dd-MM-yyyy", f2: "dd MMM yyyy"))"
                flightEconomylbl.text = defaults.string(forKey: UserDefaultsKeys.selectClass)
                
                
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
                
                cityslbl.text = "\(defaults.string(forKey: UserDefaultsKeys.fromcityname) ?? "") - \(defaults.string(forKey: UserDefaultsKeys.tocityname) ?? "") - \(defaults.string(forKey: UserDefaultsKeys.fromcityname) ?? "")"
                datelbl.text = "\(MySingleton.shared.convertDateFormat(inputDate: defaults.string(forKey: UserDefaultsKeys.calDepDate) ?? "", f1: "dd-MM-yyyy", f2: "dd MMM yyyy")) - \(MySingleton.shared.convertDateFormat(inputDate: defaults.string(forKey: UserDefaultsKeys.calRetDate) ?? "", f1: "dd-MM-yyyy", f2: "dd MMM yyyy"))"
                flightEconomylbl.text = defaults.string(forKey: UserDefaultsKeys.selectClass)
                
                
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








