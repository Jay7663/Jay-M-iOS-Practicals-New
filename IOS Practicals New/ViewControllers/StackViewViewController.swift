import UIKit

class StackViewViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var switchOrientation: UISwitch!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func switchToggle(_ sender: UISwitch) {
        sender.isOn ? (stackView.axis = .horizontal) : (stackView.axis = .vertical)
    }
    
} // End of Class
