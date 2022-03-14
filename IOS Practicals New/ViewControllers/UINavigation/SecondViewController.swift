import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Variables
    var coordinator: SecondCoordinator?
    var firstDelegate: FirstDelegate?
    var message: String = ""
    
    // MARK: - Outlets
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var tfMessage: UITextField!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Second"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        lblMessage.text = message
    }

    // MARK: - Actions
    @IBAction func btnGoToThird(_ sender: UIButton) {
        coordinator?.goToThird()
    }
    
    @IBAction func btnBackToFirst(_ sender: UIButton) {
        firstDelegate?.messageSent(tfMessage.text ?? "Empty")
        coordinator?.finish()
    }
    
    @IBAction func btnGoToFourth(_ sender: UIButton) {
        coordinator?.goToFourth()
    }
    
} // End of Class
