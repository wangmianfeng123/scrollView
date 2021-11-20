

import UIKit
import Foundation
class ListBoxingPopAnimation:  NSObject,UIViewControllerAnimatedTransitioning {
    
    var binContext:UIViewControllerContextTransitioning?
    
    func transitionDuration(using binContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    func animateTransition(using binContext: UIViewControllerContextTransitioning) {
        
        self.binContext = binContext
        
        let fromVC = binContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = binContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let containerView = binContext.containerView
        containerView.addSubview((fromVC?.view)!)
        containerView.addSubview((toVC?.view)!)
        
        let durationN = self.transitionDuration(using: binContext)
        let screenBounds:CGRect = UIScreen.main.bounds
        let finalFrame:CGRect = binContext.finalFrame(for: toVC!)
        toVC?.view.frame = finalFrame.offsetBy(dx: 0, dy: -screenBounds.size.height)
        
        UIView.animate(withDuration: durationN, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {() -> Void in
            toVC?.view.frame = finalFrame
        }, completion: ({(Bool) -> Void in
            binContext.completeTransition(!binContext.transitionWasCancelled)
        }))
    }
}
