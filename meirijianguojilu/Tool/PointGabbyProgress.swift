

import UIKit
let keyWindow = UIApplication.shared.keyWindow
class PointGabbyProgress: UIView {
    
    lazy var textlabel = UILabel()
    
    var fontSize:CGFloat = 14
    
    var informationLength:CGFloat = 150
    
    var spacing:CGFloat = 20
    var messageSpacing:CGFloat = 30
    var jacanaWidth:CGFloat = 37
    var min:CGFloat = 5
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.7)
        self.layer.cornerRadius = 5
        self.addSubview(self.textlabel)
        self.textlabel.font = UIFont.systemFont(ofSize: fontSize)
        self.textlabel.numberOfLines = 0
        self.textlabel.textColor = UIColor.white
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    static func showMessage(_ message:String){
        
        let hud =  PointGabbyProgress(frame:CGRect.zero)
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        
        keyWindow?.isUserInteractionEnabled = false
        hud.textlabel.text = message
        if message == ""{
            hud.frame = CGRect.init(x: (screenWidth-hud.spacing*2-hud.jacanaWidth)/2.0, y: (screenHeight - hud.spacing*2-hud.jacanaWidth)/2.0, width: hud.spacing*2+hud.jacanaWidth, height: hud.spacing*2+hud.jacanaWidth)
            activityIndicator.center = CGPoint.init(x: hud.frame.width/2.0, y: hud.frame.height/2.0)
        }else{
            let testString = message as NSString
            
            var rect = testString.boundingRect(with: CGSize.init(width: CGFloat(MAXFLOAT), height:hud.fontSize), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize:hud.fontSize)], context: nil)
            if rect.width > hud.informationLength {
                rect = testString.boundingRect(with: CGSize.init(width: hud.informationLength, height:CGFloat(MAXFLOAT) ), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize:hud.fontSize)], context: nil)
            }
            if rect.width <= hud.jacanaWidth{
                hud.frame = CGRect.init(x: (screenWidth-hud.spacing*2-hud.jacanaWidth)/2.0, y: (screenHeight - hud.spacing*2-hud.jacanaWidth-hud.min-rect.height)/2.0, width: hud.spacing*2+hud.jacanaWidth, height: hud.spacing*2+hud.jacanaWidth+hud.min+rect.height)
            }else {
                
                hud.frame = CGRect.init(x: (screenWidth-rect.width-hud.spacing*2)/2.0, y: (screenHeight - hud.spacing*2-hud.jacanaWidth-hud.min-rect.height)/2.0, width: rect.width+hud.spacing*2, height: hud.spacing*2+hud.jacanaWidth+hud.min+rect.height)
            }
            activityIndicator.frame =  CGRect.init(x:(hud.frame.width - hud.jacanaWidth)/2.0 , y: hud.spacing, width: hud.jacanaWidth, height: hud.jacanaWidth)
            hud.textlabel.frame =  CGRect.init(x: hud.spacing, y:activityIndicator.frame.maxY + hud.min, width: rect.width, height: rect.height)
            
            
        }
        
        
        print(activityIndicator.frame)
        activityIndicator.startAnimating()
        hud.addSubview(activityIndicator)
        keyWindow?.addSubview(hud)
    }
    
    
    
    
    
  @objc public static func showText(_ text:String){
        
        let hud =  PointGabbyProgress(frame:CGRect.zero)
        keyWindow?.isUserInteractionEnabled = false
        hud.textlabel.text = text
        let testString = text as NSString
        
        var rect = testString.boundingRect(with: CGSize.init(width: CGFloat(MAXFLOAT), height:hud.fontSize), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize:hud.fontSize)], context: nil)
        if rect.width > hud.informationLength {
            rect = testString.boundingRect(with: CGSize.init(width: hud.informationLength, height:CGFloat(MAXFLOAT) ), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize:hud.fontSize)], context: nil)
        }
        hud.frame = CGRect.init(x: (screenWidth-rect.width-hud.spacing*2)/2.0, y: (screenHeight - rect.height-hud.spacing*2)/2.0, width: rect.width+hud.spacing*2, height: rect.height+hud.spacing*2)
        
        hud.textlabel.frame =  CGRect.init(x: hud.spacing, y: hud.spacing, width: rect.width, height: rect.height)
        keyWindow?.addSubview(hud)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.hide()
        }
        
        
    }
    static func hide(){
        for hud in (keyWindow?.subviews)!{
            if hud.isKind(of: PointGabbyProgress.self){
                
                UIView.animate(withDuration: 0.3, animations: {
                    hud.alpha = 0
                }) { (isCom) in
                    hud.removeFromSuperview()
                    keyWindow?.isUserInteractionEnabled = true
                }
                
            }
        }
    }
    
}
