import UIKit

class FifthViewController: UIViewController {

    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func btnDismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
} // End of Class
