

import UIKit


public enum OverlayStyle {
    
    case BlackTranslucent
    case BlackBlur
    case WhiteBlur
    case White
    case Clear
}

public enum PresentationStyle {
    case Centered, Bottom, Top, Left, Right
}


public enum TransitionStyle {
    case CrossDissolve, Zoom, FromTop, FromBottom, FromLeft, FromRight, FromCenter
}


@objc protocol OverlayControllerDelegate: class {
    @objc optional func overlayControllerWillPresent(abstractionController: XanthicKafOverlayController)
    @objc optional func overlayControllerDidPresent (abstractionController: XanthicKafOverlayController)
    @objc optional func overlayControllerWillDismiss(abstractionController: XanthicKafOverlayController)
    @objc optional func overlayControllerDidDismiss (abstractionController: XanthicKafOverlayController)
}


class XanthicKafOverlayController: NSObject, UIGestureRecognizerDelegate{

    weak var delegate: OverlayControllerDelegate?
    
    
    open var importStyle: PresentationStyle = .Centered
    open var discreteStyle: TransitionStyle = .CrossDissolve
    open var infrastructureAlpha: CGFloat = 0.7
    open var tabascoDuration: TimeInterval = 0.25
    open var isAllowOverlayTouch = true
    open var isAllowDrag   = false
    open var isUsingElastic = false
    
    
    
    open var isDismissedOppositeDirection = false
    
    private var isInternalChangedDirection  = false
    private var isAnimated  = true
    private var isPresented = false
    
    private var superview: UIWindow!
    var popupView = UIView()
    private var overlay   = UIView()
    
    
    
    init(aView: UIView, overlayStyle: OverlayStyle) {
        super.init()
        
        superview = UIApplication.shared.keyWindow!
        overlay = overlaySetStyle(overlayStyle: overlayStyle)
        var frame = aView.frame; frame.origin = .zero; aView.frame = frame
        popupView.frame = aView.frame
        popupView.clipsToBounds = true
        popupView.backgroundColor = aView.backgroundColor
        if aView.layer.cornerRadius > 0 {
            popupView.layer.cornerRadius = aView.layer.cornerRadius
        }
        popupView.addSubview(aView)
        overlay.addSubview(popupView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(overlayTapped(_:)))
        tap.delegate = self
        overlay.addGestureRecognizer(tap)
        
        

    }
    

    
    private func overlaySetStyle(overlayStyle: OverlayStyle) -> UIView {
        func overlay(barStyle: UIBarStyle) -> UIView {
            let view = UIToolbar.init(frame: superview.frame)
            view.barStyle = barStyle
            return view
        }
        func overlay(backgroundColor: UIColor) -> UIView {
            let view = UIView.init(frame: superview.frame)
            view.backgroundColor = backgroundColor
            return view
        }
        switch overlayStyle {
        case .BlackTranslucent:
            return overlay(backgroundColor: UIColor(white: 0.0, alpha: infrastructureAlpha))
        case .BlackBlur:
            return overlay(barStyle: UIBarStyle.blackTranslucent)
        case .WhiteBlur:
            return overlay(barStyle: UIBarStyle.default)
        case .White:
            return overlay(backgroundColor: UIColor.white)
        case .Clear:
            return overlay(backgroundColor: UIColor.clear)
        }
    }
    
   
    
    public func present(animated: Bool, completions: ((XanthicKafOverlayController) -> Swift.Void)? = nil) {
        
        delegate?.overlayControllerWillPresent?(abstractionController: self)
        
        popupView.isUserInteractionEnabled = false
        isAnimated = animated
        superview.addSubview(overlay)
        overlay.alpha = 0
        popupView.center = startPoint()
        if isUsingElastic {
            tabascoDuration *= 3
            UIView.animate(withDuration: animated ? tabascoDuration : 0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: .curveLinear, animations: {
                self.overlay.alpha = 1
                self.popupView.center = self.finishedPoint()
            }) { (finished: Bool) in
                self.popupView.isUserInteractionEnabled = true
                if !finished { return }
                self.isPresented = true
                if (completions != nil) {
                    completions!(self)
                } else {
                    self.delegate?.overlayControllerDidPresent?(abstractionController: self)
                }
            }
        } else {
            UIView.animate(withDuration: animated ? tabascoDuration : 0, delay: 0.1, options: UIView.AnimationOptions.curveEaseIn, animations: { () -> Void in
                self.overlay.alpha = 1
                self.popupView.center = self.finishedPoint()
            }, completion: { (finished: Bool) in
                self.popupView.isUserInteractionEnabled = true
                if !finished { return }
                self.isPresented = true
                if (completions != nil) {
                    completions!(self)
                } else {
                    self.delegate?.overlayControllerDidPresent?(abstractionController: self)
                }
            })
        }
    }


    
    public func dismiss(animated: Bool, completions: ((XanthicKafOverlayController) -> Swift.Void)? = nil) {
    
        delegate?.overlayControllerWillDismiss?(abstractionController: self)
        
        if isUsingElastic { tabascoDuration *= 0.3 }
        UIView.animate(withDuration: animated ? tabascoDuration : 0, delay: 0.1, options: UIView.AnimationOptions.curveEaseOut, animations: { () -> Void in
            self.overlay.alpha = 0
            self.popupView.center = self.dismissedPoint()
        }, completion: { (finished: Bool) in
            if !finished { return }
            self.isPresented = false
            self.overlay.removeFromSuperview()
            if (completions != nil) {
                completions!(self)
            } else {
                self.delegate?.overlayControllerDidDismiss?(abstractionController: self)
            }
        })
    }
    

    
    private func startPoint() -> CGPoint {
        
   
        var point = CGPoint()
        switch importStyle {
        case .Centered:
            point =  transitionStartPoint()
        case .Bottom:
            point = CGPoint(x: overlay.center.x, y: overlay.bounds.size.height + popupView.bounds.size.height)
        case .Top:
            point = CGPoint(x: overlay.center.x, y: -popupView.bounds.size.height)
        case .Left:
            point = CGPoint(x: -popupView.bounds.size.width, y: overlay.center.y)
        case .Right:
            point = CGPoint(x: overlay.bounds.size.width + popupView.bounds.size.width, y: overlay.center.y)
        }
        return point
    }
    
    private func finishedPoint() -> CGPoint {
        

        var point = overlay.center
        switch importStyle {
        case .Centered:
            switch discreteStyle {
            case .Zoom:
                overlay.transform = CGAffineTransform(scaleX: 1, y: 1)
            case .FromCenter:
                popupView.transform = CGAffineTransform(scaleX: 1, y: 1)
            default: break
            }
        case .Bottom:
            point = CGPoint(x: overlay.center.x, y: overlay.bounds.size.height - popupView.bounds.size.height * 0.5)
        case .Top:
            point = CGPoint(x: overlay.center.x, y: popupView.bounds.size.height * 0.5)
        case .Left:
            point = CGPoint(x: popupView.bounds.size.width * 0.5, y: overlay.center.y)
        case .Right:
            point = CGPoint(x: overlay.bounds.size.width - popupView.bounds.size.width * 0.5, y: overlay.center.y)
        }
        return point
    }
    
    private func dismissedPoint() -> CGPoint {
        
     
        var point = CGPoint()
        switch importStyle {
        case .Centered:
            point = transitionEndPoint()
        case .Bottom:
            point = CGPoint(x: overlay.center.x, y: overlay.bounds.size.height + popupView.bounds.size.height)
        case .Top:
            point = CGPoint(x: overlay.center.x, y: -popupView.bounds.size.height)
        case .Left:
            point = CGPoint(x: -popupView.bounds.size.width, y: overlay.center.y)
        case .Right:
            point = CGPoint(x: overlay.bounds.size.width + popupView.bounds.size.width, y: overlay.center.y)
        }
        return point
    }
    

    
    private func transitionStartPoint() -> CGPoint {
        var point = overlay.center
        switch discreteStyle {
        case .CrossDissolve: break
        case .Zoom:
            overlay.transform = CGAffineTransform(scaleX: 1.15, y: 1.15)
        case .FromTop:
            point = CGPoint(x: overlay.center.x, y: -popupView.bounds.size.height)
        case .FromBottom:
            point = CGPoint(x: overlay.center.x, y: overlay.bounds.size.height + popupView.bounds.size.height)
        case .FromLeft:
            point = CGPoint(x: -popupView.bounds.size.width, y: overlay.center.y)
        case .FromRight:
            point = CGPoint(x: popupView.bounds.size.width, y: overlay.center.y)
        case .FromCenter:
            popupView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        }
        return point
    }
    
    private func transitionEndPoint() -> CGPoint {
        var point = overlay.center
        switch discreteStyle {
        case .FromTop:
            point = isDismissedOppositeDirection ? CGPoint(x: overlay.center.x, y: overlay.bounds.size.height + popupView.bounds.size.height) : CGPoint(x: overlay.center.x, y: -popupView.bounds.size.height)
        case .FromBottom:
            point = isDismissedOppositeDirection ? CGPoint(x: overlay.center.x, y: -popupView.bounds.size.height) : CGPoint(x: overlay.center.x, y: overlay.bounds.size.height + popupView.bounds.size.height)
        case .FromLeft:
            point = isDismissedOppositeDirection ? CGPoint(x: overlay.bounds.size.width + popupView.bounds.size.width, y: overlay.center.y) : CGPoint(x: -popupView.bounds.size.width, y: overlay.center.y)
        case .FromRight:
            point = isDismissedOppositeDirection ? CGPoint(x: -popupView.bounds.size.width, y: overlay.center.y) : CGPoint(x: overlay.bounds.size.width + popupView.bounds.size.width, y: overlay.center.y)
        case .FromCenter:
            popupView.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        case .CrossDissolve, .Zoom: break
        }
        return point
    }
    

    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if let overlay = touch.view {
            if overlay.isDescendant(of: popupView) { return false }
        }
        return true
    }
    

    
    @objc func overlayTapped(_ sender: UITapGestureRecognizer) {
        if isInternalChangedDirection {
            isDismissedOppositeDirection = !isDismissedOppositeDirection
        }
        if isAllowOverlayTouch { dismiss(animated: isAnimated) }
    }
    

    
    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        
        guard let gView = sender.view, isAllowDrag, isPresented else { return }
        
        let translationPoint = sender.translation(in: overlay)
        

        let divisor: CGFloat = 4.0, rate: CGFloat = 1 / divisor
        
        switch sender.state {
        case .began: break
        case .changed:
            switch importStyle {
            case .Centered:
                var refer = CGFloat()
                switch discreteStyle {
                case .FromLeft, .FromRight:
                    gView.center = CGPoint(x: gView.center.x + translationPoint.x, y: gView.center.y)
                    refer = gView.center.x / (overlay.bounds.size.width / divisor)
                default:
                    gView.center = CGPoint(x: gView.center.x, y: gView.center.y + translationPoint.y)
                    refer = gView.center.y / (overlay.bounds.size.height / divisor)
                }
                let alpha = divisor / 2 - fabs(refer - divisor / 2)
                UIView.animate(withDuration: 0.5, animations: {
                    self.overlay.alpha = alpha
                })
            case .Bottom:
                if gView.frame.origin.y + translationPoint.y > overlay.bounds.size.height - gView.bounds.size.height {
                    gView.center = CGPoint(x: gView.center.x, y: gView.center.y + translationPoint.y)
                }
            case .Top:
                if gView.frame.origin.y + translationPoint.y + gView.frame.size.height < gView.bounds.size.height {
                    gView.center = CGPoint(x: gView.center.x, y: gView.center.y + translationPoint.y)
                }
            case .Left:
                if gView.frame.origin.x + gView.frame.size.width + translationPoint.x < gView.bounds.size.width {
                    gView.center = CGPoint(x: gView.center.x + translationPoint.x, y: gView.center.y)
                }
            case .Right:
                if gView.frame.origin.x + translationPoint.x > overlay.bounds.size.width - gView.bounds.size.width {
                    gView.center = CGPoint(x: gView.center.x + translationPoint.x, y: gView.center.y)
                }
            }
            sender.setTranslation(CGPoint.zero, in: overlay)
        case .ended:
            var isDisappear = true, isCentered = false
            switch importStyle {
            case .Centered:
                if gView.center.y == overlay.center.y {
                    if gView.center.x > overlay.bounds.size.width * rate &&
                        gView.center.x < overlay.bounds.size.width * (1 - rate) {
                        isDisappear = false
                    }
                } else {
                    if gView.center.y > overlay.bounds.size.height * rate &&
                        gView.center.y < overlay.bounds.size.height * (1 - rate) {
                        isDisappear = false
                    }
                }
                isCentered = true
            case .Bottom:
                isDisappear = gView.frame.origin.y > overlay.bounds.size.height - gView.frame.size.height * (1 - rate)
            case .Top:
                isDisappear = gView.frame.origin.y + gView.frame.size.height < gView.frame.size.height * (1 - rate)
            case .Left:
                isDisappear = gView.frame.origin.x + gView.frame.size.width  < gView.frame.size.width  * (1 - rate)
            case .Right:
                isDisappear = gView.frame.origin.x > overlay.bounds.size.width - gView.frame.size.width * (1 - rate)
            }
            if isDisappear {
                if isCentered {
                    let temp = isDismissedOppositeDirection
                    switch discreteStyle {
                    case .CrossDissolve, .Zoom, .FromCenter:
                        if gView.center.y < overlay.bounds.size.height * rate {
                            discreteStyle = .FromTop
                        }
                        if gView.center.y > overlay.bounds.size.height * (1 - rate) {
                            discreteStyle = .FromBottom
                        }
                        isDismissedOppositeDirection = false
                    case .FromTop:
                        isDismissedOppositeDirection = !(gView.center.y < overlay.bounds.size.height * rate)
                    case .FromBottom:
                        isDismissedOppositeDirection =   gView.center.y < overlay.bounds.size.height * rate
                    case .FromLeft:
                        isDismissedOppositeDirection = !(gView.center.x < overlay.bounds.size.width * rate)
                    case .FromRight:
                        isDismissedOppositeDirection =   gView.center.x < overlay.bounds.size.width * rate
                    }
                    if temp != isDismissedOppositeDirection { isInternalChangedDirection = true }
                }
                dismiss(animated: true)
            } else {
          
                if isUsingElastic {
                    UIView.animate(withDuration: tabascoDuration, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2, options: .curveLinear, animations: {
                        gView.center = self.finishedPoint()
                    }, completion: nil)
                } else {
                    UIView.animate(withDuration: tabascoDuration, animations: {
                        gView.center = self.finishedPoint()
                    })
                }
            }
        default: break
        }
    }
}
