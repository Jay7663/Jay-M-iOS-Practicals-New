import UIKit

class ScrollablesSegmentViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var segmentTableCollection: UISegmentedControl!
    @IBOutlet weak var tableViewContainer: UIView!
    @IBOutlet weak var collectionViewContainer: UIView!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewContainer.alpha = CGFloat(Constants.ONE)
        collectionViewContainer.alpha = CGFloat(Constants.ZERO)
    }
    
    // MARK: - Actions
    @IBAction func segmentValueChange(_ sender: UISegmentedControl) {
        switch(sender.selectedSegmentIndex) {
        case 0:
            tableViewContainer.alpha = CGFloat(Constants.ONE)
            collectionViewContainer.alpha = CGFloat(Constants.ZERO)
        case 1:
            tableViewContainer.alpha = CGFloat(Constants.ZERO)
            collectionViewContainer.alpha = CGFloat(Constants.ONE)
        default:
            break
        }
    }
    
    @IBAction func btnBackToHome(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
} // End of Class
