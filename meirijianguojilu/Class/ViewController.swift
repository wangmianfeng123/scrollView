
import UIKit

class ViewController: mumaCityferenceViewController,UICollectionViewDataSource,UICollectionViewDelegate,UINavigationControllerDelegate {
    
    
    lazy var collectionView :UICollectionView = {
        let collLayou = UICollectionViewFlowLayout()
        let mag :CGFloat = 10.0
        let count : CGFloat = 5.0
        let weight = (screenWidth-100)/4
        collLayou.itemSize=CGSize(width:weight, height:120*suitParm)
        collLayou.scrollDirection = .horizontal
        collLayou.minimumLineSpacing = 20
        
        let coll = UICollectionView.init(frame: CGRect.init(x: 20, y: 10, width: screenWidth-40, height: 120*suitParm), collectionViewLayout: collLayou)
        coll.showsVerticalScrollIndicator = false
        coll.showsHorizontalScrollIndicator = false
        
        coll.backgroundColor = UIColor.white
        return coll
    }()
    
    
    var journalModel = [fuwutongzhieLaagerJournalModel]()
    
    var diaryModel = [buhaokansolationDiaryModel]()
    
    var showModel = [buhaokansolationDiaryModel]()

    var yachtyCell = 0
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if #available(iOS 9.0, *) {
            self.journalModel = BabassuLabelledBaseManager.defaultManger.selectAll(name: "journalTable") as! [fuwutongzhieLaagerJournalModel]
            self.diaryModel = BabassuLabelledBaseManager.defaultManger.selectAll(name: "diaryTable") as! [buhaokansolationDiaryModel]
            
            self.setShowData()
            
            
        } else {
        }
        self.collectionView.reloadData()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
        self.setNav()
       
        self.setTableView()
        self.setEditBtn()
    }
}

extension ViewController{
    
    func setNav() {
        let navView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: NavigationBarHeight))
        navView.backgroundColor = mainColor
        self.view.addSubview(navView)
    
        let topImageV = UIImageView.init(frame: CGRect.init(x: 0, y: NavigationBarHeight, width: screenWidth, height: 160))
        topImageV.image = UIImage.init(named: "topImageV")
//        topImageV.backgroundColor = UIColor.blue
        self.view.addSubview(topImageV)
        
        
        

        
        
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation==UINavigationController.Operation.push {
            return ListBoxingPopAnimation()
        }
        else if operation==UINavigationController.Operation.pop{
            return meixiangTransactionPushAnimation()
        }
        return nil
    }
}

extension ViewController{
    
    
    func setTableView() {
        
        mainTabelView.frame = CGRect.init(x: 0, y: NavigationBarHeight+160, width: screenWidth, height: screenHeight-NavigationBarHeight-160)
        mainTabelView.backgroundColor = UIColor.clear
        
        mainTabelView.register(UINib.init(nibName: "chanmianFabricativeViewCell", bundle: nil), forCellReuseIdentifier: "YDHomeTableViewCellId")
        mainTabelView.register(UINib.init(nibName: "liujifenumPaneViewCell", bundle: nil), forCellReuseIdentifier: "YDHome1TableViewCellId")

        
        mainTabelView.rowHeight = UITableView.automaticDimension
        mainTabelView.estimatedRowHeight = 100
        mainTabelView.separatorStyle = .none
        mainTabelView.showsVerticalScrollIndicator = false
        
        
        self.view.addSubview(self.mainTabelView)
        self.setfootView()
        self.setHeadView()
        
    }
    
    func setfootView() {
        let headView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 10))
        headView.backgroundColor = UIColor.colorWithHexString(hex: "#F5F7F8")
        self.mainTabelView.tableFooterView = headView
    }
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.showModel.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = self.showModel[indexPath.row]
        if model.iconArray?.count ?? 0 > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "YDHomeTableViewCellId") as! chanmianFabricativeViewCell
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.clear
            
            cell.Model = self.showModel[indexPath.row]
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "YDHome1TableViewCellId") as! liujifenumPaneViewCell
            cell.selectionStyle = .none
            cell.backgroundColor = UIColor.clear
            
            cell.Model = self.showModel[indexPath.row]
            
            return cell
        }
        
        
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.showModel[indexPath.row]
        let vc = xunishenghuoguanructureViewController()
        vc.diaryModel = model
        vc.isEditBool = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


extension ViewController{
    func setHeadView() {
        let headView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: 150*suitParm))
        headView.backgroundColor = UIColor.white
        self.mainTabelView.tableHeaderView = headView
        
        headView.addSubview(self.collectionView)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName:"biejindlerViewCell", bundle:nil),forCellWithReuseIdentifier: "YDCollectionViewCellId")
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.journalModel.count+1
    }
    
    
    func numberOfSections(in collectionView:UICollectionView) ->Int{
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"YDCollectionViewCellId", for: indexPath) as! biejindlerViewCell
        cell.backgroundColor = UIColor.clear
        cell.labellumImage.isHidden = true
        if indexPath.row == self.journalModel.count {
            cell.addImage.isHidden = false
            cell.rpcImage.isHidden = true
            cell.jacinthLabel.text = "添加日记"
            cell.biaoqianLabel.isHidden = true
        }else{
            cell.jacinthLabel.text = self.journalModel[indexPath.row].sarapeName
            cell.rpcImage.backgroundColor = self.journalModel[indexPath.row].baathistColor
            cell.addImage.isHidden = true
            cell.rpcImage.isHidden = false
            cell.biaoqianLabel.isHidden = false
            cell.biaoqianLabel.text = "日记本\(indexPath.row)"
            if self.yachtyCell == indexPath.row{
                cell.rpcImage.layer.shadowOpacity = 0.5
                cell.rpcImage.layer.shadowColor = UIColor.black.cgColor
                cell.rpcImage.layer.shadowOffset = CGSize(width: 1, height: 1)
                
                cell.rpcImage.layer.cornerRadius = 4

               
            }else{
                cell.rpcImage.layer.shadowOpacity = 0.5
                cell.rpcImage.layer.shadowColor = UIColor.clear.cgColor
                cell.rpcImage.layer.shadowOffset = CGSize(width: 1, height: 1) 
                
                cell.rpcImage.layer.cornerRadius = 4
            }
            
        }
        
        return cell;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == self.journalModel.count {
            let vc = zhihuidagountNamedViewController()
            self.navigationController?.pushViewController(vc, animated: true)

        }else{
            self.yachtyCell = indexPath.row
            self.setShowData()
            self.collectionView.reloadData()
        }

    }
    
    func setShowData()  {
        self.showModel.removeAll()
        
        let model = self.journalModel[self.yachtyCell]
        
        if model.sarapeName == "All" {
            self.showModel = self.diaryModel
        }else{
            for item in self.diaryModel{
                
                if model.sarapeName == item.sarapeName{
                    self.showModel.append(item)
                }
            }
        }
        
        self.showModel = self.showModel.reversed()
        if self.showModel.count <= 0 {
            self.noDataView(messageStr: "暂无日记", imageName: "", hidden: false)
        }else{
            self.noDataView(messageStr: "暂无日记", imageName: "", hidden: true)

        }
        
        
        self.mainTabelView.reloadData()
        
    }
}

extension ViewController{
    func setEditBtn()   {
        let editBtn = UIButton.init(type: .custom)
        editBtn.setImage(UIImage.init(named: "nigeiwoqianjiu"), for: .normal)
        editBtn.backgroundColor = UIColor.colorWithHexString(hex: "#3A84F0")
        editBtn.layer.shadowOpacity = 0.5 //阴影区域透明度
        editBtn.layer.shadowColor = UIColor.black.cgColor // 阴影区域颜色
        editBtn.layer.shadowOffset = CGSize(width: 1, height: 1) //阴影区域范围
        editBtn.layer.cornerRadius = 20
        editBtn.setTitle("添加", for: .normal)
        self.view.addSubview(editBtn)
        editBtn.snp.makeConstraints { (make) in
//            make.trailing.equalTo(self.view.snp.trailing).offset(-50)
            make.leading.equalTo(self.view.snp.leading)
            make.bottom.equalTo(self.view.snp.bottom).offset(-kBottomSafe-50)
            make.height.equalTo(44)
            make.width.equalTo(120)
        }
        
        editBtn.addTouchClosure {
            let vc = xunishenghuoguanructureViewController()
            let model = self.journalModel[self.yachtyCell]
            vc.addJournalModel = model
            vc.yachtyCell = self.yachtyCell
            self.navigationController?.pushViewController(vc, animated:true)
        }
        
    }
}



