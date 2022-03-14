import UIKit

protocol FirstDelegate {
    
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
    }
    
    // MARK: - Actions
    @IBAction func btnGoToSecond(_ sender: UIButton) {
        if let navController = self.navigationController {
            coordinator = FirstCoordinator(navController: navController)
        }
        coordinator?.goToSecond(tfMessage.text ?? "Empty", self)
    }

} // End of Class

//MARK: - FirstDelegate
extension FirstViewController: FirstDelegate {
    
    func messageSent(_ message: String) {
        lblMessage.text = message
    }
    
} // End of Extension
