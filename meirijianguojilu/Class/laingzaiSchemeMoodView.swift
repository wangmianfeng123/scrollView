

import UIKit

class laingzaiSchemeMoodView: UIView ,UICollectionViewDelegate,UICollectionViewDataSource {
    
    lazy var collectionView :UICollectionView = {
        let collLayou = UICollectionViewFlowLayout()
        let mag :CGFloat = 10.0
        let count : CGFloat = 5.0
        collLayou.itemSize=CGSize(width:50, height:50)
        collLayou.scrollDirection = .horizontal
        collLayou.minimumLineSpacing = 20
        
        let coll = UICollectionView.init(frame: CGRect.init(x: 20, y: 10, width: self.frame.width-40, height: 50), collectionViewLayout: collLayou)
        coll.showsVerticalScrollIndicator = false
        coll.showsHorizontalScrollIndicator = false
        
        coll.backgroundColor = UIColor.white
        return coll
    }()
    
    
    var qbpBlock : ((_ selectWeather:UIImage)->(Void))!
    
    let moodArray = ["tabbyDaxiao","user_shiyuyuanwei","qianfangzhaoliangnateZhou","huixiangwofsfgser","yihuqingjiu","faguangdewomena"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.collectionView)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName:"jianguoduoshaorneOapecViewCell", bundle:nil),forCellWithReuseIdentifier: "YDWeatherCollectionViewCellId")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.moodArray.count
    }
    
    
    func numberOfSections(in collectionView:UICollectionView) ->Int{
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"YDWeatherCollectionViewCellId", for: indexPath) as! jianguoduoshaorneOapecViewCell
        cell.backgroundColor = UIColor.clear
        cell.importImage.image = UIImage.init(named: self.moodArray[indexPath.row])
        
        return cell;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = UIImage.init(named: self.moodArray[indexPath.item])
        self.qbpBlock(image!)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
