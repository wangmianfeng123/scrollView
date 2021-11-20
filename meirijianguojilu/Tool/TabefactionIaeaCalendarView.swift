

import UIKit

class TabefactionIaeaCalendarView: UICollectionView,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.register(AliasXanthinuriaCalendarCell.self, forCellWithReuseIdentifier: "cell")
        self.backgroundColor = UIColor.white
        self.delegate = self
        self.dataSource = self
        self.showsVerticalScrollIndicator = false
        self.isScrollEnabled = false
    }
    var getDatesBlock: ((String)->())?
    
    var yearAndMonth = ""
    
    var date: Date = Date() {
        didSet {
            self.weekday = getFirstDayInDateMonth(date) - 1
            self.days = calculateDaysInDateMonth(date)
            self.yearAndMonth = self.formatYearOMonth(date)
        }
    }
    
    var selectDay = ""
    func clockReload(clock:String)  {
        self.selectDay = clock
        self.reloadData()
    }
    
    var weekday: Int = 0
    var days: Int = 0 {
        didSet {
            self.raceDay = 1
            self.reloadData()
        }
    }
    var raceDay: Int = 1
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.weekday + self.days
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AliasXanthinuriaCalendarCell
        
        
        var itemDay = ""
        if raceDay > self.days{
            itemDay = ("\(self.yearAndMonth)\(self.days)")
        }else{
            itemDay = ("\(self.yearAndMonth)\(raceDay)")
        }
        
        let timeStamp = itemDay.stringToTimeStamp("yyyy-MM-d")
        itemDay = String(timeStamp).timeStampToString("yyyy-MM-dd")
        

        var isContains = false
        
        if itemDay == self.selectDay {
            isContains = true
        }
        

        
        if isContains {
            cell.dateLabel.backgroundColor = mainColor
            cell.dateLabel.textColor = UIColor.white
        }else{
            cell.dateLabel.backgroundColor = UIColor.white
            cell.dateLabel.textColor = UIColor.black
        }
        
        
        
        if indexPath.row >= self.weekday && indexPath.row < self.weekday + self.days  {
            cell.dateLabel.text = "\(raceDay)"
            raceDay += 1
        }else {
            cell.dateLabel.text = ""
            cell.dateLabel.backgroundColor = UIColor.white
        }
        print("\(self.yearAndMonth)\(raceDay)")
        
        return cell
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! AliasXanthinuriaCalendarCell
        let dayLabel = cell.dateLabel

        self.selectDay = self.yearAndMonth + (dayLabel.text ?? "")
        let timeStamp = self.selectDay.stringToTimeStamp("yyyy-MM-d")
        self.selectDay = String(timeStamp).timeStampToString("yyyy-MM-dd")
        self.raceDay = 1
        self.reloadData()
        self.getDatesBlock?(self.selectDay)
    }
   
  
    func calculateDaysInDateMonth(_ date: Date) -> Int {
        let calendar = Calendar(identifier: .gregorian)
        let specifiedDateCom = calendar.dateComponents([.year,.month,.day], from: date)
        var startCom = DateComponents()
        startCom.day = 1
        startCom.month = specifiedDateCom.month
        startCom.year = specifiedDateCom.year
        let startDate = calendar.date(from: startCom)
        var endCom = DateComponents()
        endCom.day = 1
        endCom.month = specifiedDateCom.month == 12 ? 1 : specifiedDateCom.month! + 1
        endCom.year = specifiedDateCom.month == 12 ? specifiedDateCom.year! + 1 : specifiedDateCom.year
        let endDate = calendar.date(from: endCom)
        let days = calendar.dateComponents([.day], from: startDate!, to: endDate!)
        let count = days.day ?? 0
        return count
    }
    func getFirstDayInDateMonth(_ date: Date) -> Int {
        let calendar = Calendar(identifier: .gregorian)
        var specifiedDateCom = calendar.dateComponents([.year,.month], from: date)
        specifiedDateCom.setValue(1, for: .day)
        let startOfMonth = calendar.date(from: specifiedDateCom)
        let weekDayCom = calendar.component(.weekday, from: startOfMonth!)
        return weekDayCom
    }
    
    func formatYearOMonth(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-"
        let string = formatter.string(from: date)
        return string
    }
}
