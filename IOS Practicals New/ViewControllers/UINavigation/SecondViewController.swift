import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Variables
    var coordinator: SecondCoordinator?
    var firstVCDataTransferDelegate: FirstVCDataTransferDelegate?
    var message: String = ""
    
    // MARK: - Outlets
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var tfMessage: UITextField!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialValues()
    }

    // MARK: - File Private Functions
    fileprivate func initialValues() {
        self.title = "Second"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        lblMessage.text = message
    }
    
    // MARK: - Actions
    @IBAction func btnGoToThird(_ sender: UIButton) {
        coordinator?.goToThird()
    }
    
    @IBAction func btnBackToFirst(_ sender: UIButton) {
        firstVCDataTransferDelegate?.messageSent(tfMessage.text ?? "Empty")
        coordinator?.finish()
    }
    
    @IBAction func btnGoToFourth(_ sender: UIButton) {
        coordinator?.goToFourth()
    }
    
} // End of Class
