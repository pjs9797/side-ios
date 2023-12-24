//
//  DismissTransition.swift
//  SharedUtils
//
//  Created by 강민성 on 12/20/23.
//

import UIKit

public class DismissTransition: NSObject, UIViewControllerAnimatedTransitioning {
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
        
        let fromVC = transitionContext.viewController(forKey: .from)!
        var fromViewInitFrame = transitionContext.initialFrame(for: fromVC)
        fromViewInitFrame.origin.x = 0
        
        var fromViewFinalFrame = fromViewInitFrame
        fromViewFinalFrame.origin.x = fromViewFinalFrame.width
        
        let fromView = fromVC.view!
        let toView = transitionContext.viewController(forKey: .to)!.view!
        
        var toViewInitialFrame = fromViewInitFrame
        toViewInitialFrame.origin.x = -toView.frame.size.width
        toView.frame = toViewInitialFrame
        
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
