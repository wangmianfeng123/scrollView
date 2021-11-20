

import UIKit

class YachtieLinkageWeekView: UIView {

    let datasetDays: [String] = ["Sun","Mon","Tue","Wed","Thur","Fri","Sat"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = mainColor
        for (index,string) in self.datasetDays.enumerated() {
            let dayLabel: UILabel = {
                let label = UILabel()
                label.text = string
                label.textColor = UIColor.white
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 17)
                return label
            }()
            dayLabel.frame = CGRect(x: CGFloat(index)*(frame.width/7), y: 0, width: frame.width/7, height: 30)
            self.addSubview(dayLabel)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
