//
//  PresentTransition.swift
//  SharedUtils
//
//  Created by 강민성 on 12/20/23.
//

import UIKit

public class PresentTransition: NSObject, UIViewControllerAnimatedTransitioning {
    var animator: UIViewImplicitlyAnimating?

    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let animator = self.interruptibleAnimator(using: transitionContext)
        animator.startAnimation()
    }
    
    public func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        if self.animator != nil {
            return self.animator!
        }
        
        let container = transitionContext.containerView
        let fromVC = transitionContext.viewController(forKey: .from)!
        let fromViewInitFrame = transitionContext.initialFrame(for: fromVC)
        var fromViewFinalFrame = fromViewInitFrame
        fromViewFinalFrame.origin.x = -fromViewFinalFrame.width
        
        let fromView = fromVC.view!
        let toView = transitionContext.view(forKey: .to)!
        
        var toViewInitialFrame = fromViewInitFrame
        toViewInitialFrame.origin.x = toView.frame.size.width
        
        toView.frame = toViewInitialFrame
        container.addSubview(toView)
        
        let animator = UIViewPropertyAnimator(duration: self.transitionDuration(using: transitionContext), curve: .easeInOut) {
            toView.frame = fromViewInitFrame
            fromView.frame = fromViewFinalFrame
        }
        
        animator.addCompletion { _ in
            transitionContext.completeTransition(true)
        }
        
        self.animator = animator
        return animator
    }
    
    public func animationEnded(_ transitionCompleted: Bool) {
        self.animator = nil
    }
}
