

import UIKit
import Foundation
class meixiangTransactionPushAnimation: NSObject,UIViewControllerAnimatedTransitioning,CAAnimationDelegate {
    
    var cabaneContext:UIViewControllerContextTransitioning?
    
    func transitionDuration(using binContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    func animateTransition(using binContext: UIViewControllerContextTransitioning) {
        
        self.cabaneContext = binContext
        
        let fromVC = binContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = binContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let containerView = binContext.containerView
        containerView.addSubview((fromVC?.view)!)
        containerView.addSubview((toVC?.view)!)
        
        let originRect:CGRect = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        let maskStartPath = UIBezierPath.init(ovalIn: originRect)
        let maskEndPath = UIBezierPath.init(ovalIn: originRect.insetBy(dx: -2000, dy: -2000))
        
        let maskLayer = CAShapeLayer.init()
        maskLayer.path = maskEndPath.cgPath
        
        toVC?.view.layer.mask = maskLayer
        
        let maskAnimation = CABasicAnimation.init(keyPath: "path")
        maskAnimation.fromValue = maskStartPath.cgPath
        maskAnimation.toValue = maskEndPath.cgPath
        maskAnimation.duration = self.transitionDuration(using: binContext)
        maskAnimation.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeInEaseOut)
        maskAnimation.fillMode = CAMediaTimingFillMode.forwards
        maskAnimation.isRemovedOnCompletion = false
        maskAnimation.delegate = self
        maskLayer.add(maskAnimation, forKey: "path")
        
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.cabaneContext?.completeTransition(!(self.cabaneContext?.transitionWasCancelled)!)
        self.cabaneContext?.viewController(forKey: UITransitionContextViewControllerKey.from)?.view.layer.mask = nil;
        self.cabaneContext?.viewController(forKey: UITransitionContextViewControllerKey.to)?.view.layer.mask = nil;
    }
    
}
