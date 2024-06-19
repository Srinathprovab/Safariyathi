//
//  ProcessingToPaymentVC.swift
//  Safariyati
//
//  Created by Admin on 18/06/24.
//

import UIKit

class ProcessingToPaymentVC: UIViewController {
    
    @IBOutlet weak var dotview: DotLoaderView!
    
    
    static var newInstance: ProcessingToPaymentVC? {
        let storyboard = UIStoryboard(name: Storyboard.Flights.name,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self.className()) as? ProcessingToPaymentVC
        return vc
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        dotview.setupDots()
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.gotoBookingConfirmationVC()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
    }
    
    func gotoBookingConfirmationVC() {
        guard let vc = BookingConfirmationVC.newInstance.self else {return}
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
    
    
    
}

class DotLoaderView: UIView {

    var dots: [UIView] = []
    let dotCount = 5
    let dotSize: CGFloat = 17.0
    let dotSpacing: CGFloat = 10.0
    let animationDuration: TimeInterval = 0.5

    let dotColors: [UIColor] = [.red, .blue, .green, .brown, .purple]

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupDots()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupDots()
    }

    func setupDots() {
        for i in 0..<dotCount {
            let dot = UIView()
            dot.backgroundColor = dotColors[i % dotColors.count]
            dot.layer.cornerRadius = dotSize / 2
            dot.frame = CGRect(
                x: CGFloat(i) * (dotSize + dotSpacing),
                y: 0,
                width: dotSize,
                height: dotSize
            )
            dots.append(dot)
            addSubview(dot)
        }
        startAnimation()
    }

    func startAnimation() {
        for (index, dot) in dots.enumerated() {
            UIView.animate(
                withDuration: animationDuration,
                delay: Double(index) * (animationDuration / 2),
                options: [.repeat, .autoreverse],
                animations: {
                    dot.alpha = 0.0
                },
                completion: nil
            )
        }
    }

    // Calculate the intrinsic content size
    override var intrinsicContentSize: CGSize {
        let totalWidth = CGFloat(dotCount) * dotSize + CGFloat(dotCount - 1) * dotSpacing
        return CGSize(width: totalWidth, height: dotSize)
    }
}

