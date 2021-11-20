
import UIKit

extension UIView{
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue > 0 ? newValue : 0
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    
    public struct UIRectSide : OptionSet {
        public let rawValue: Int
        public static let left = UIRectSide(rawValue: 1 << 0)
        public static let top = UIRectSide(rawValue: 1 << 1)
        public static let right = UIRectSide(rawValue: 1 << 2)
        public static let bottom = UIRectSide(rawValue: 1 << 3)
        public static let all: UIRectSide = [.top, .right, .left, .bottom]
        
        public init(rawValue: Int) {
            self.rawValue = rawValue;
        }
    }
    
    func drawDashLine(strokeColor: UIColor, lineWidth: CGFloat = 1, lineLength: Int = 10, lineSpacing: Int = 5, corners: UIRectSide) {
        
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.bounds = self.bounds
        
        shapeLayer.anchorPoint = CGPoint(x: 0, y: 0)
        
        shapeLayer.fillColor = UIColor.blue.cgColor
        
        shapeLayer.strokeColor = strokeColor.cgColor
        
        shapeLayer.lineWidth = lineWidth
        
        
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        
        
        
        
        shapeLayer.lineDashPattern = [NSNumber(value: lineLength), NSNumber(value: lineSpacing)]
        
        
        
        let path = CGMutablePath()
        
        if corners.contains(.left) {
            
            path.move(to: CGPoint(x: 0, y: self.layer.bounds.height))
            
            path.addLine(to: CGPoint(x: 0, y: 0))
            
        }
        
        if corners.contains(.top){
            
            path.move(to: CGPoint(x: 0, y: 0))
            
            path.addLine(to: CGPoint(x: self.layer.bounds.width, y: 0))
            
        }
        
        if corners.contains(.right){
            
            path.move(to: CGPoint(x: self.layer.bounds.width, y: 0))
            
            path.addLine(to: CGPoint(x: self.layer.bounds.width, y: self.layer.bounds.height))
            
        }
        
        if corners.contains(.bottom){
            
            path.move(to: CGPoint(x: self.layer.bounds.width, y: self.layer.bounds.height))
            
            path.addLine(to: CGPoint(x: 0, y: self.layer.bounds.height))
            
        }
        
        shapeLayer.path = path
        
        self.layer.addSublayer(shapeLayer)
        
    }
    
    
    
}
