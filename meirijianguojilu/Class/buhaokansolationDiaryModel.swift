

import UIKit

class buhaokansolationDiaryModel: NSObject,NSCoding {
    @objc public var sarapeName : String?
    @objc public var virtualObjTime : String?
    @objc public var importImage : UIImage?
    @objc public var firewallImage : UIImage?
    @objc public var immediateName : String?
    @objc public var pacesetterDetail : NSAttributedString?
    @objc public var iconArray : [UIImage]?
    @objc public var detailText : String?
    
    
    
    
    override init() {
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(sarapeName, forKey: "sarapeName")
        aCoder.encode(virtualObjTime,forKey:"virtualObjTime")
        aCoder.encode(importImage,forKey:"importImage")
        aCoder.encode(firewallImage,forKey:"firewallImage")
        aCoder.encode(immediateName,forKey:"immediateName")
        aCoder.encode(pacesetterDetail,forKey:"pacesetterDetail")
        aCoder.encode(iconArray,forKey:"iconArray")
        aCoder.encode(detailText,forKey:"detailText")

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.sarapeName = aDecoder.decodeObject(forKey: "sarapeName") as? String
        self.virtualObjTime = aDecoder.decodeObject(forKey: "virtualObjTime") as? String
        self.importImage = aDecoder.decodeObject(forKey: "importImage") as? UIImage
        self.firewallImage = aDecoder.decodeObject(forKey: "firewallImage") as? UIImage
        self.immediateName = aDecoder.decodeObject(forKey: "immediateName") as? String
        self.pacesetterDetail = aDecoder.decodeObject(forKey: "pacesetterDetail") as? NSAttributedString
        self.iconArray = aDecoder.decodeObject(forKey: "iconArray") as? [UIImage]
        self.detailText = aDecoder.decodeObject(forKey: "detailText") as? String

    }
}
