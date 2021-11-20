

import UIKit

extension String{
    
    func stringToTimeStamp(_ stringTime:String)->Int {
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = stringTime
        
        dfmatter.locale = Locale.current
        
        let date = dfmatter.date(from: self)
        
        let dateStamp:TimeInterval = date!.timeIntervalSince1970
        
        let dateSt:Int = Int(dateStamp)
        
        return dateSt
    }
    
    func timeStampToString(_ formatStr:String)->String {
        //        let string = NSString(string: timeStamp)
        guard let timeSta:TimeInterval = Double(self) else {
            return " "
        }
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = formatStr
        let date = Date(timeIntervalSince1970: timeSta )
        return dfmatter.string(from: date)
    }
    
}
