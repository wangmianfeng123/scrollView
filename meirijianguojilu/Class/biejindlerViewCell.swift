

import UIKit

class biejindlerViewCell: UICollectionViewCell {
    
    @IBOutlet weak var rpcImage: UIImageView!
    
    @IBOutlet weak var addImage: UIImageView!
    
    @IBOutlet weak var jacinthLabel: UILabel!
    
    @IBOutlet weak var labellumImage: UIImageView!
    
    @IBOutlet weak var biaoqianLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.jacinthLabel.font = UIFont.systemFont(ofSize: 12*suitParm)
        
    }

}
