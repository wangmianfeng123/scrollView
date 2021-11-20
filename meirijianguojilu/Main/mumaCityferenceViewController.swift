
import UIKit
import SnapKit
import FDFullscreenPopGesture
class mumaCityferenceViewController:UIViewController ,UITableViewDataSource,UITableViewDelegate {
    
    var abstractionController : XanthicKafOverlayController!
    
    var imageView = UIImageView()
    
    
    lazy var mainTabelView:UITableView = {
        let table = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight - NavigationBarHeight ), style: .plain)
        
        table.delegate = self
        table.dataSource = self
        
        table.separatorStyle = .none
        table.rowHeight = 45
        table.backgroundColor =  UIColor.white
        table.tableFooterView = UIView()
        
        return table
    }()
    
    lazy var noDataImage:UIImageView = {
        let imageView = UIImageView.init()
        self.mainTabelView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.mainTabelView.snp.centerX)
            make.centerY.equalTo(self.mainTabelView.snp.centerY)
        }
        return imageView
    }()
    
    lazy var noDataLabel : UILabel = {
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.lightGray
        label.textAlignment = .center
        self.mainTabelView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(noDataImage.snp.bottom)
            make.centerX.equalTo(self.mainTabelView.snp.centerX)
        }
        return label
    }()
    
    
    
    func noDataView(messageStr:String,imageName:String,hidden:Bool) {
        self.noDataImage.image = UIImage.init(named: imageName)
        self.noDataLabel.text = messageStr
        self.noDataLabel.isHidden = hidden
        self.noDataImage.isHidden = hidden
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.colorWithHexString(hex: "#F5F7F8")
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.fd_prefersNavigationBarHidden = true
        imageView = UIImageView.init(frame: self.view.frame)
        imageView.image = UIImage.init(named: "1")
        self.view.addSubview(imageView)
        
        self.edgesForExtendedLayout = []
        
        if #available(iOS 11.0, *) {
            mainTabelView.contentInsetAdjustmentBehavior = .never
        } else {
            
        }
        
    }
    
    
    
    
    
}

extension mumaCityferenceViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }
    
}

extension mumaCityferenceViewController{
    func getTimes() -> [Int] {
        
        var timers: [Int] = []
        
        let calendar: Calendar = Calendar(identifier: .gregorian)
        var comps: DateComponents = DateComponents()
        comps = calendar.dateComponents([.year,.month,.day, .weekday, .hour, .minute,.second], from: Date())
        
        timers.append(comps.year!)
        timers.append(comps.month!)
        timers.append(comps.day!)
        timers.append(comps.hour!)
        timers.append(comps.minute!)
        timers.append(comps.second!)
        timers.append(comps.weekday! - 1)
        return timers;
    }
    
    func getTimes1(str:String) -> String {
        let date = NSDate()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = str
        let strNowTime = timeFormatter.string(from: date as Date) as String
        return strNowTime
    }
}


