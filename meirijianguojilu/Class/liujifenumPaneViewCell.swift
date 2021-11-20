

import UIKit

class liujifenumPaneViewCell: UITableViewCell {

    @IBOutlet weak var pacesetterLabel: UILabel!
    
    @IBOutlet weak var jacinthLabel: UILabel!
    
    @IBOutlet weak var xanthinLabel: UILabel!
    
    var Model : buhaokansolationDiaryModel?{
        didSet{
            if let model = Model{
                
                self.pacesetterLabel.text = model.virtualObjTime
                self.jacinthLabel.text = model.immediateName
                self.xanthinLabel.text = model.detailText
            }else{
                self.pacesetterLabel.text = " "
                self.jacinthLabel.text = " "
                self.xanthinLabel.text = " "
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
