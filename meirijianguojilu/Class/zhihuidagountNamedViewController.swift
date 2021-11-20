

import UIKit

class zhihuidagountNamedViewController: mumaCityferenceViewController,UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate {

    let colorArray = ["#CADBF5","#B5CFF2","#9CBEED","#87B1ED","#75A7ED","#659EEF","#4E8BE2"]
    
    var numLabel = UILabel()
    var textField = UITextField()
    
    var yachtyCell : Int?
    
    var addModel = fuwutongzhieLaagerJournalModel()
    
    
    lazy var collectionView :UICollectionView = {
        let collLayou = UICollectionViewFlowLayout()
        let mag :CGFloat = 10.0
        let count : CGFloat = 5.0
        let weight = (screenWidth-100)/4
        collLayou.itemSize=CGSize(width:weight, height:100*suitParm)
        collLayou.scrollDirection = .horizontal
        
        collLayou.minimumLineSpacing = 10
        
        let coll = UICollectionView.init(frame: CGRect.init(x: 10, y: 40, width: screenWidth-20, height: 100*suitParm), collectionViewLayout: collLayou)
        coll.showsVerticalScrollIndicator = false
        coll.showsHorizontalScrollIndicator = false
        
        coll.backgroundColor = UIColor.white
        return coll
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.colorWithHexString(hex: "#F5F7F8")
        self.setNav()
        self.setHeadView()
        self.setNameView()
    }
}

extension zhihuidagountNamedViewController{
    func setNav() {
        let navView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: NavigationBarHeight))
        navView.backgroundColor = mainColor
        self.view.addSubview(navView)
        
        let titleLabel = UILabel.init()
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        titleLabel.textColor = UIColor.white
        titleLabel.text = "添加日记"
        navView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(navView.snp.bottom).offset(-8)
            make.centerX.equalTo(navView.snp.centerX)
        }
        
        let backBtn = UIButton.init(type: .custom)
        backBtn.setImage(UIImage.init(named: "feihuangtengda"), for: .normal)
        navView.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) in
            make.leading.equalTo(navView)
            make.centerY.equalTo(titleLabel.snp.centerY)
            
        }
        backBtn.addTouchClosure {
            self.navigationController!.popViewController(animated: true)
        }
        
        
        let saveBtn = UIButton.init(type: .custom)
        saveBtn.setImage(UIImage.init(named: "cabthingsfsBaocun"), for: .normal)
        navView.addSubview(saveBtn)
        saveBtn.snp.makeConstraints { (make) in
            make.trailing.equalTo(navView.snp.trailing).offset(-10)
            make.centerY.equalTo(titleLabel.snp.centerY)
        }
        
        saveBtn.addTouchClosure {
            self.view.endEditing(true)
            
            guard let _ = self.addModel.baathistColor else{
                PointGabbyProgress.showText("Please select the diary color")
                return
            }
            
            guard let text = self.textField.text else{
                PointGabbyProgress.showText("Please enter the name of the journal")
                return
            }
            if text.count <= 0{
                PointGabbyProgress.showText("Please enter the name of the journal")
                return

            }
            self.addModel.sarapeName = text
            
            
            if #available(iOS 11.0, *) {
                BabassuLabelledBaseManager.defaultManger.insert(model: self.addModel, name: "journalTable", successBlock: {
                    PointGabbyProgress.showText("The journal was added successfully")
                    self.navigationController!.popViewController(animated: true)
                    
                }, failBlock: {
                    PointGabbyProgress.showText("Journal add failed")
                    return
                    
                })
            } else {
            }
            
            
        }
        
        
        
    }
    
    
    func setHeadView() {
        let headView = UIView.init(frame: CGRect.init(x: 0, y: NavigationBarHeight, width: screenWidth, height: 150*suitParm))
        headView.backgroundColor = UIColor.white
        
        let titleLabel = UILabel.init()
        titleLabel.text = "封面选择"
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont.systemFont(ofSize: 16*suitParm)
        headView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(headView.snp.top).offset(10)
            make.leading.equalTo(headView.snp.leading).offset(10)
        }
        
        headView.addSubview(self.collectionView)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName:"biejindlerViewCell", bundle:nil),forCellWithReuseIdentifier: "YDCollectionViewCellId")
        self.view.addSubview(headView)
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.colorArray.count
    }
    
    
    func numberOfSections(in collectionView:UICollectionView) ->Int{
    return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"YDCollectionViewCellId", for: indexPath) as! biejindlerViewCell
        cell.addImage.isHidden = true
        cell.jacinthLabel.isHidden = true
        cell.rpcImage.isHidden = true
        cell.biaoqianLabel.isHidden = true
        
        cell.labellumImage.backgroundColor = UIColor.colorWithHexString(hex: self.colorArray[indexPath.row])
        cell.labellumImage.layer.cornerRadius = 4
        
        if let select = self.yachtyCell{
            if select == indexPath.row{
                cell.labellumImage.layer.shadowOpacity = 0.5
                cell.labellumImage.layer.shadowColor = UIColor.black.cgColor
                cell.labellumImage.layer.shadowOffset = CGSize(width: 1, height: 1)
                
            }else{
                cell.labellumImage.layer.shadowOpacity = 0.5
                cell.labellumImage.layer.shadowColor = UIColor.clear.cgColor
                cell.labellumImage.layer.shadowOffset = CGSize(width: 1, height: 1)
                
            }
        }else{
            cell.labellumImage.layer.shadowOpacity = 0.5
            cell.labellumImage.layer.shadowColor = UIColor.clear.cgColor
            cell.labellumImage.layer.shadowOffset = CGSize(width: 1, height: 1)
            
            cell.labellumImage.layer.cornerRadius = 4
            
        }
        
    
    
        return cell;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.view.endEditing(true)
        self.yachtyCell = indexPath.row
        self.addModel.baathistColor = UIColor.colorWithHexString(hex: self.colorArray[indexPath.row])
        self.collectionView.reloadData()
    }
    
}

extension zhihuidagountNamedViewController{
    
    func setNameView() {
        let nameView = UIView.init(frame: CGRect.init(x: 0, y: NavigationBarHeight+150*suitParm, width: screenWidth, height: 50))
        nameView.backgroundColor = UIColor.white
        self.view.addSubview(nameView)
        
        
        let line = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 1))
        line.backgroundColor = UIColor.colorWithHexString(hex: "#F5F7F8")
        nameView.addSubview(line)
        
        
        let diaryLabel  = UILabel.init()
        diaryLabel.text = "日记"
        diaryLabel.textColor = UIColor.black
        diaryLabel.font = UIFont.systemFont(ofSize: 16*suitParm)
        nameView.addSubview(diaryLabel)
        diaryLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(nameView.snp.centerY)
            make.leading.equalTo(nameView.snp.leading).offset(10)
        }
        
        self.numLabel = UILabel.init()
        self.numLabel.textColor = UIColor.colorWithHexString(hex: "#999999")
        self.numLabel.font = UIFont.systemFont(ofSize: 16*suitParm)
        self.numLabel.text = "(0/11)"
        nameView.addSubview(self.numLabel)
        self.numLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(diaryLabel.snp.centerY)
            make.leading.equalTo(diaryLabel.snp.trailing)
        }
        
        
        self.textField = UITextField.init()
        self.textField.font = UIFont.systemFont(ofSize: 16*suitParm)
        self.textField.textAlignment = .right
        self.textField.placeholder = "输入日记名称"
        self.textField.delegate = self
        nameView.addSubview(self.textField)
        self.textField.snp.makeConstraints { (make) in
            make.trailing.equalTo(nameView.snp.trailing).offset(-10)
            make.centerY.equalTo(nameView.snp.centerY)
            make.leading.equalTo(self.numLabel.snp.trailing).offset(10).priority(200)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         guard let text = textField.text else { return true }
        
        if text.count > 10 {
            self.numLabel.text = "(11/11)"
            return false
        }
        self.numLabel.text = "(\(text.count)/11)"
        return true
    }
}
