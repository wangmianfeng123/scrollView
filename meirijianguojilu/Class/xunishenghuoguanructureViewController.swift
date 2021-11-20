

import UIKit

class xunishenghuoguanructureViewController: mumaCityferenceViewController {
    var addJournalModel = fuwutongzhieLaagerJournalModel()
    var yachtyCell = 0
    
    var isEditBool = false
    
    var journalModel = [fuwutongzhieLaagerJournalModel]()
    
    var textView = MinimumLibraryTextView()
    
    
    var diaryModel = buhaokansolationDiaryModel()
    lazy var titleView : chayecabaJitTitleView = {
        let titView = chayecabaJitTitleView.init(frame: CGRect.init(x: 10, y: 0, width: screenWidth-20, height: 150*suitParm))
        titView.backgroundColor = mainColor
        titView.layer.cornerRadius = 4
        return titView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 9.0, *) {
            self.journalModel = BabassuLabelledBaseManager.defaultManger.selectAll(name: "journalTable") as! [fuwutongzhieLaagerJournalModel]
        } else {
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.colorWithHexString(hex: "#F5F7F8")
        if !self.isEditBool {
            self.diaryModel.sarapeName = self.addJournalModel.sarapeName
            self.diaryModel.virtualObjTime = self.getTimes1(str: "yyyy-MM-dd")
            self.diaryModel.importImage = UIImage.init(named: "wuwenxidonggequ")
            self.diaryModel.firewallImage = UIImage.init(named: "tabbyDaxiao")
        }
        
        self.setNav()
        self.setHeadView()
        self.setNameView()
        
        
        
    }
    
}

extension xunishenghuoguanructureViewController{
    func setNav() {
        let navView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: NavigationBarHeight))
        navView.backgroundColor = mainColor
        self.view.addSubview(navView)
        

        
        let titleBtn = UIButton.init(type: .custom)
        if self.isEditBool {
            titleBtn.setTitle(self.diaryModel.sarapeName, for: .normal)
        }else{
            titleBtn.setTitle(self.addJournalModel.sarapeName, for: .normal)

        }
        titleBtn.setTitleColor(UIColor.white, for: .normal)
        titleBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17*suitParm)
        titleBtn.setImage(UIImage.init(named: "huakaizhishiFanhui"), for: .normal)
        navView.addSubview(titleBtn)
        titleBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(navView.snp.bottom).offset(-8)
            make.centerX.equalTo(navView.snp.centerX)
        }
        titleBtn.addTouchClosure {
            
            
            self.titleView.yachtyCell = self.yachtyCell
            self.titleView.reload(journalModel: self.journalModel)
            self.titleView.qbpBlock = { [weak self] (select,isAdd) in
                self?.yachtyCell = select
                if isAdd == true{
                    let vc = zhihuidagountNamedViewController()
                    self?.navigationController?.pushViewController(vc, animated: true)
                }else{
                    self?.addJournalModel = (self?.journalModel[select])!
                    self?.diaryModel.sarapeName = self?.addJournalModel.sarapeName
                    titleBtn.setTitle(self?.addJournalModel.sarapeName, for: .normal)
                }
                self?.abstractionController.dismiss(animated: true)
            }
            
            self.abstractionController = XanthicKafOverlayController(aView: self.titleView, overlayStyle: .BlackTranslucent)
            self.abstractionController.importStyle = .Centered
            self.abstractionController.isAllowDrag = true
            self.abstractionController.isUsingElastic = true
            self.abstractionController.present(animated: true)
        }
        
        
        
        let backBtn = UIButton.init(type: .custom)
        backBtn.setImage(UIImage.init(named: "feihuangtengda"), for: .normal)
        navView.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) in
            make.leading.equalTo(navView)
            make.centerY.equalTo(titleBtn.snp.centerY)
            
        }
        backBtn.addTouchClosure {
            self.navigationController!.popViewController(animated: true)
        }
        
        let saveBtn = UIButton.init(type: .custom)
        saveBtn.setImage(UIImage.init(named: "cabthingsfsBaocun"), for: .normal)
        navView.addSubview(saveBtn)
        saveBtn.snp.makeConstraints { (make) in
            make.trailing.equalTo(navView.snp.trailing).offset(-10)
            make.centerY.equalTo(titleBtn.snp.centerY)
        }
        
        saveBtn.addTouchClosure {
            self.view.endEditing(true)
            if let immediateName = self.diaryModel.immediateName{
                if immediateName.count <= 0{
                    PointGabbyProgress.showText("Please enter a title")
                    return
                }
            }else{
                PointGabbyProgress.showText("Please enter a title")
                return
            }
            
            
            if let pacesetterDetail = self.diaryModel.pacesetterDetail{
                if pacesetterDetail.length <= 0{
                    PointGabbyProgress.showText("Please enter the content")
                    return
                }
            }else{
                PointGabbyProgress.showText("Please enter the content")
                return
            }
            
            if self.isEditBool{
                if #available(iOS 11.0, *) {
                    BabassuLabelledBaseManager.defaultManger.update(model: self.diaryModel, uid: self.diaryModel.unmanagedFmdb!, name: "", successBlock: {
                        
                        PointGabbyProgress.showText("Successfully modified")
                        self.navigationController?.popToRootViewController(animated: true)
                        
                        
                    }, failBlock: {
                        PointGabbyProgress.showText("Fail to edit")
                        return

                    })
                } else {
                    // Fallback on earlier versions
                }
            }
            
            
            
            if #available(iOS 11.0, *) {
                BabassuLabelledBaseManager.defaultManger.insert(model: self.diaryModel, name: "diaryTable", successBlock: {
                    PointGabbyProgress.showText("The diary was saved successfully")
                    self.navigationController?.popToRootViewController(animated: true)
                }, failBlock: {
                    PointGabbyProgress.showText("Journal save failed")
                    return
                })
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

extension xunishenghuoguanructureViewController{
    func setHeadView()  {
        let headView = UIView.init(frame: CGRect.init(x: 0, y: NavigationBarHeight, width: screenWidth, height: 50))
        headView.backgroundColor = UIColor.white
        self.view.addSubview(headView)
        
        let timeBtn = UIButton.init(type: .custom)
        if self.isEditBool {
            timeBtn.setTitle(self.diaryModel.virtualObjTime, for: .normal)

        }else{
            timeBtn.setTitle(self.getTimes1(str: "yyyy-MM-dd"), for: .normal)

        }
        
        
        
        timeBtn.setTitleColor(mainColor, for: .normal)
        timeBtn.setImage(UIImage.init(named: "kaishicaballo"), for: .normal)
        timeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15*suitParm)
        headView.addSubview(timeBtn)
        timeBtn.snp.makeConstraints { (make) in
            make.leading.equalTo(headView.snp.leading).offset(10)
            make.centerY.equalTo(headView.snp.centerY)
        }
        timeBtn.addTouchClosure {
            let pickerView = LabellumDeferPickerView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 200))
            
            pickerView.addressBtn?.addTouchClosure(closure: {
                var date = ""
                if pickerView.selectDate.count < 1{
                    let now = NSDate()
                    
                    let dateformatter =  DateFormatter()
                    dateformatter.dateFormat = "yyyy-MM-dd"
                    date = dateformatter.string(from: now as Date)
                }else{
                    date = pickerView.selectDate
                }
                timeBtn.setTitle(date, for: .normal)
                self.diaryModel.virtualObjTime = date
                self.abstractionController.dismiss(animated: true)
                self.mainTabelView.reloadData()
            })
            
            pickerView.mabelBtn?.addTouchClosure(closure: {
                self.abstractionController.dismiss(animated: true)
            })
            self.abstractionController = XanthicKafOverlayController(aView: pickerView, overlayStyle: .BlackTranslucent)
            self.abstractionController.importStyle = .Bottom
            self.abstractionController.isAllowDrag = true
            self.abstractionController.isUsingElastic = true
            self.abstractionController.present(animated: true)
        }
        
        let weatherBtn = UIButton.init(type: .custom)
        if self.isEditBool {
            weatherBtn.setImage(self.diaryModel.importImage, for: .normal)

        }else{
            weatherBtn.setImage(UIImage.init(named: "wuwenxidonggequ"), for: .normal)

        }
        headView.addSubview(weatherBtn)
        weatherBtn.snp.makeConstraints { (make) in
            make.trailing.equalTo(headView.snp.trailing).offset(-10)
            make.centerY.equalTo(headView.snp.centerY)
        }
        
        weatherBtn.addTouchClosure {

            let weatherView = congmingderenTabefactionWeatherView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 70))
            weatherView.backgroundColor = UIColor.white
            
            weatherView.qbpBlock = {[weak self](image)in
                weatherBtn.setImage(image, for: .normal)
                self?.diaryModel.importImage = image
                self?.abstractionController.dismiss(animated: true)
            }
            
            self.abstractionController = XanthicKafOverlayController(aView: weatherView, overlayStyle: .BlackTranslucent)
            self.abstractionController.importStyle = .Centered
            self.abstractionController.isAllowDrag = true
            self.abstractionController.isUsingElastic = true
            self.abstractionController.present(animated: true)
        }
        
        
        let moodBtn = UIButton.init(type: .custom)
        
        if self.isEditBool{
            moodBtn.setImage(self.diaryModel.firewallImage, for: .normal)

        }else{
            moodBtn.setImage(UIImage.init(named: "tabbyDaxiao"), for: .normal)

        }
        headView.addSubview(moodBtn)
        
        moodBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(headView.snp.centerY)
            make.trailing.equalTo(weatherBtn.snp.leading).offset(-10)
        }
        moodBtn.addTouchClosure {
            
            let moodView = laingzaiSchemeMoodView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 70))
            moodView.backgroundColor = UIColor.white
            
            moodView.qbpBlock = {[weak self](image)in
                moodBtn.setImage(image, for: .normal)
                self?.diaryModel.firewallImage = image
                self?.abstractionController.dismiss(animated: true)
            }
            
            self.abstractionController = XanthicKafOverlayController(aView: moodView, overlayStyle: .BlackTranslucent)
            self.abstractionController.importStyle = .Centered
            self.abstractionController.isAllowDrag = true
            self.abstractionController.isUsingElastic = true
            self.abstractionController.present(animated: true)
        }
    }
}

extension xunishenghuoguanructureViewController:UITextFieldDelegate{
    func setNameView()  {
        let textField = UITextField.init()
        textField.placeholder = "Title"
        textField.font = UIFont.systemFont(ofSize: 15*suitParm)
        textField.textColor = UIColor.black
        textField.textAlignment = .left
        textField.delegate = self
        self.view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(NavigationBarHeight+50+10)
            make.leading.equalTo(self.view.snp.leading).offset(10)
            make.trailing.equalTo(self.view.snp.trailing).offset(-10)
        }
        
        
        let line = UIView.init()
        line.backgroundColor = UIColor.lightGray
        self.view.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view.snp.leading)
            make.trailing.equalTo(self.view.snp.trailing)
            make.height.equalTo(0.5)
            make.top.equalTo(textField.snp.bottom).offset(10)
        }
        
        
        
        let placeholderLabel = UILabel.init()
        placeholderLabel.text = "Record beautiful..."
        placeholderLabel.textColor = UIColor.colorWithHexString(hex: "#999999")
        placeholderLabel.font = UIFont.systemFont(ofSize: 17)
        self.view.addSubview(placeholderLabel)
        placeholderLabel.snp.makeConstraints { (make) in
            make.top.equalTo(line.snp.bottom).offset(10)
            make.leading.equalTo(self.view.snp.leading).offset(10)
            make.height.equalTo(35)
            
        }
        
        
        
        textView = MinimumLibraryTextView.init()
        textView.showsVerticalScrollIndicator = false
        textView.backgroundColor = UIColor.clear
 
        if let pacesetterDetail = self.diaryModel.pacesetterDetail{
            pacesetterDetail.enumerateAttribute(.attachment, in: NSMakeRange(0, pacesetterDetail.length), options: []) { (value, range, stop) in

                if let values = value{

                    let attachment : NSTextAttachment = values as! NSTextAttachment
                    
                    if let image = attachment.image{
                        let width = image.size.width
                        let height = image.size.height
                        attachment.bounds = CGRect.init(x: 0, y: 0, width: screenWidth-40, height: height*((screenWidth-40)/width))
                    }
                }
            }
            textView.attributedText = pacesetterDetail
            placeholderLabel.isHidden = true
        }else{
            placeholderLabel.isHidden = false
        }
  
        
        textView.activeEditing = {(bool) in
            placeholderLabel.isHidden = true
            
            return true
        }
        textView.dependentEditing = {[weak self] (text) in
            self?.diaryModel.pacesetterDetail = text.attributedText
            self?.diaryModel.iconArray = self?.textView.rz_richTextImages()
            self?.diaryModel.detailText = self?.textView.text
            if text.attributedText.length <= 0 && (self?.textView.text.count)! <= 0 {
                placeholderLabel.isHidden = false
            }
            
            
            
            
            
        }
        
        self.view.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.top.equalTo(line.snp.bottom).offset(10)
            make.leading.equalTo(self.view.snp.leading).offset(10)
            make.trailing.equalTo(self.view.snp.trailing).offset(-10)
            make.bottom.equalTo(self.view.snp.bottom).offset(-kBottomSafe)
 
        }
  
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       self.diaryModel.immediateName = textField.text
    }
    
    
}













