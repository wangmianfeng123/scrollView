
import UIKit

class fuwutongzhieLaagerJournalModel: NSObject,NSCoding {
    @objc public var sarapeName : String?
    @objc public var baathistColor : UIColor?
    
    
    
    override init() {
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(sarapeName, forKey: "sarapeName")
        aCoder.encode(baathistColor, forKey: "baathistColor")
        
        
        
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        self.sarapeName = aDecoder.decodeObject(forKey: "sarapeName") as? String
        self.baathistColor = aDecoder.decodeObject(forKey: "baathistColor") as? UIColor
    }
}
