

import UIKit

class chayecabaJitTitleView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {

    lazy var collectionView :UICollectionView = {
        let collLayou = UICollectionViewFlowLayout()
        let mag :CGFloat = 10.0
        let count : CGFloat = 5.0
        let weight = (screenWidth-100)/4
        collLayou.itemSize=CGSize(width:weight, height:120*suitParm)
        collLayou.scrollDirection = .horizontal
        collLayou.minimumLineSpacing = 20
        
        let coll = UICollectionView.init(frame: CGRect.init(x: 20, y: 10, width: self.frame.width-40, height: 120*suitParm), collectionViewLayout: collLayou)
        coll.showsVerticalScrollIndicator = false
        coll.showsHorizontalScrollIndicator = false
        
        coll.backgroundColor = mainColor
        return coll
    }()

    var journalModel = [fuwutongzhieLaagerJournalModel]()
    
    var yachtyCell = 0
    
    var qbpBlock : ((_ yachtyCell:Int,_ isAdd:Bool)->(Void))!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.collectionView)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName:"biejindlerViewCell", bundle:nil),forCellWithReuseIdentifier: "YDCollectionViewCellId")
    }
    
    
    func reload(journalModel:[fuwutongzhieLaagerJournalModel]) {
        self.journalModel = journalModel
        self.collectionView.reloadData()
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
        if indexPath.row == self.journalModel.count {
            cell.addImage.isHidden = false
            cell.rpcImage.isHidden = true
            cell.jacinthLabel.text = "Add journal"
        }else{
            cell.addImage.isHidden = true
            cell.rpcImage.isHidden = false
            
            if self.yachtyCell == indexPath.row{
                cell.rpcImage.borderColor = UIColor.white
                cell.rpcImage.borderWidth = 1
            }else{
                cell.rpcImage.borderColor = UIColor.clear
                cell.rpcImage.borderWidth = 1
            }
            cell.jacinthLabel.text = self.journalModel[indexPath.row].sarapeName
            cell.rpcImage.backgroundColor = self.journalModel[indexPath.row].baathistColor
        }
        
        return cell;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == self.journalModel.count {
            
            self.qbpBlock(self.yachtyCell,true)

        }else{
            self.yachtyCell = indexPath.row
            self.collectionView.reloadData()
            self.qbpBlock(self.yachtyCell,false)
          
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
