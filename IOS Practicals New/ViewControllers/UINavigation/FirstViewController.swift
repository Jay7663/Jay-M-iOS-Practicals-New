import UIKit

protocol FirstVCDataTransferDelegate {
    
    func messageSent(_ message: String)
    
} // End of Protocol

class FirstViewController: UIViewController {
    
    // MARK: - Variables
    var coordinator: FirstCoordinator?
    
    // MARK: - Outlets
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTapAround()
    }
    
    // MARK: - Actions
    @IBAction func btnGoToSecond(_ sender: UIButton) {
        if let navController = self.navigationController {
            coordinator = FirstCoordinator(navController: navController)
        }
        coordinator?.goToSecond(tfMessage.text ?? "Empty", self)
    }
    
    @IBAction func btnToHome(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

} // End of Class

//MARK: - FirstDelegate
extension FirstViewController: FirstVCDataTransferDelegate {
    
    func messageSent(_ message: String) {
        lblMessage.text = message
    }
    
} // End of Extension

//MARK: - UITextFieldDelegate
extension FirstViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.tfMessage:
            self.tfMessage.resignFirstResponder()
        default:
            self.tfMessage.resignFirstResponder()
        }
        return true
    }
    
} // End of Extension
