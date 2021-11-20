
import UIKit

class LabellumDeferPickerView: UIView {
    var addressBtn: UIButton?
    var mabelBtn: UIButton?
    var titleLabel: UILabel?
    var line: UILabel?
    var zagView : UIImageView?
    var NwDatePicker = UIDatePicker()
    
    var selectDate = ""
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        createSubView()
    }
    func createSubView() {
        self.zagView = UIImageView.init()
        self.zagView?.backgroundColor = UIColor.white
        self.addSubview(self.zagView!)
        
        self.titleLabel = UILabel.init()
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.titleLabel?.text = " "
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.textColor = UIColor.white
        self.addSubview(self.titleLabel!)
        
        
        self.addressBtn = UIButton.init(type: .custom)
        self.addressBtn?.setTitle("Sure", for: .normal)
        self.addressBtn?.setTitleColor(mainColor, for: .normal)
        self.addressBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(self.addressBtn!)
        
        self.mabelBtn = UIButton.init(type: .custom)
        self.mabelBtn?.setTitleColor(mainColor, for: .normal)
        self.mabelBtn?.setTitle("Cancel", for: .normal)
        self.mabelBtn?.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(self.mabelBtn!)
        
        
        
        self.line = UILabel.init()
        self.line?.backgroundColor = UIColor.colorWithHexString(hex: "cccccc")
        self.addSubview(self.line!)
        
        self.NwDatePicker = UIDatePicker.init()
        self.NwDatePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            self.NwDatePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        self.NwDatePicker.calendar = Calendar.current
        self.NwDatePicker.backgroundColor = UIColor.white
        self.NwDatePicker.addTarget(self, action: #selector(chooseDate( _:)), for:UIControl.Event.valueChanged)
        self.addSubview(self.NwDatePicker)
 
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.zagView?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(40)
        })
        
        self.mabelBtn?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(10)
            make.size.equalTo(CGSize.init(width: 50.0, height: 40.0))
        })
        
        self.titleLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(self.snp.top)
            make.centerX.equalTo(self.snp.centerX)
            make.height.equalTo(40)
        })
        
        self.addressBtn?.snp.makeConstraints({ (make) in
            make.right.equalTo(-10)
            make.top.equalTo(self.snp.top)
            make.size.equalTo(CGSize.init(width: 50.0, height: 40.0))
            
        })
        
        self.line?.snp.makeConstraints({ (make) in
            make.left.right.equalTo(0)
            make.height.equalTo(0.5)
            make.top.equalTo((self.titleLabel?.snp.bottom)!)
        })
        
        self.NwDatePicker.snp.makeConstraints { (make) in
            make.top.equalTo((self.line?.snp.bottom)!)
            make.left.right.equalTo(0)
            make.bottom.equalTo(self)
            
        }
    }
    
    @objc func chooseDate(_ datePicker:UIDatePicker) {
        let  chooseDate = datePicker.date
        let  dateFormater = DateFormatter.init()
        dateFormater.dateFormat = "yyyy-MM-dd"
        self.selectDate = dateFormater.string(from: chooseDate)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
