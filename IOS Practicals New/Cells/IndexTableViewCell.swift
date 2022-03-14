import UIKit

class IndexTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var lblCellItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
} // End of Class
