//
//  BorderView.swift
//  KuwaitWays
//
//  Created by FCI on 11/12/23.
//

import Foundation
import UIKit

@IBDesignable
class BorderedView: UIView {

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
            didSet {
                layer.cornerRadius = cornerRadius
            }
        }

    

    // Other customizations can be added as needed
}


class PaddedTextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}



class SlideInFromLeftTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5 // Adjust animation duration as needed
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to) else { return }

        let containerView = transitionContext.containerView
        containerView.addSubview(toViewController.view)

        let finalFrame = transitionContext.finalFrame(for: toViewController)
        toViewController.view.frame = finalFrame.offsetBy(dx: -containerView.bounds.width, dy: 0)

        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toViewController.view.frame = finalFrame
        }) { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}


class SlideInFromRightTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5 // Adjust animation duration as needed
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to) else { return }

        let containerView = transitionContext.containerView
        containerView.addSubview(toViewController.view)

        let finalFrame = transitionContext.finalFrame(for: toViewController)
        toViewController.view.frame = finalFrame.offsetBy(dx: containerView.bounds.width, dy: 0)

        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toViewController.view.frame = finalFrame
        }) { _ in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}


