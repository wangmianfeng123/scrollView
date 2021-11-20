

import UIKit

class chanmianFabricativeViewCell: UITableViewCell {

    @IBOutlet weak var pacesetterLabel: UILabel!
    
    @IBOutlet weak var jacinthLabel: UILabel!
    
    @IBOutlet weak var xanthinLabel: UILabel!
    
    @IBOutlet weak var Image1: UIImageView!
    
    @IBOutlet weak var Image2: UIImageView!
    
    @IBOutlet weak var Image3: UIImageView!
    
    var Model : buhaokansolationDiaryModel?{
        didSet{
            if let model = Model{
                
                self.pacesetterLabel.text = model.virtualObjTime
                self.jacinthLabel.text = model.immediateName
                self.xanthinLabel.text = model.detailText
                
                self.Image1.isHidden = true
                self.Image2.isHidden = true
                self.Image3.isHidden = true
                if let iconArray = model.iconArray{
                    if iconArray.count > 0{
                        
                        if iconArray.count == 1{
                            self.Image1.isHidden = false
                            self.Image1.image = iconArray[0]
                        }else if iconArray.count == 2{
                            self.Image1.isHidden = false
                            self.Image1.image = iconArray[0]
                            
                            self.Image2.isHidden = false
                            self.Image2.image = iconArray[1]
                        }else if iconArray.count >= 3{
                            self.Image1.isHidden = false
                            self.Image1.image = iconArray[0]
                            
                            self.Image2.isHidden = false
                            self.Image2.image = iconArray[1]
                            
                            self.Image3.isHidden = false
                            self.Image3.image = iconArray[2]
                        }
                        
                        
                        
                    }
                    
                }
                
                
            }else{
                self.pacesetterLabel.text = " "
                self.jacinthLabel.text = " "
                self.xanthinLabel.text = " "
                self.Image1.isHidden = true
                self.Image2.isHidden = true
                self.Image3.isHidden = true
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
