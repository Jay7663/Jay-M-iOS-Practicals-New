import UIKit

class ThirdViewController: UIViewController {

    // MARK: - Variables
    var coordinator: ThirdCoordinator?
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialValues()
    }
    
    // MARK: - File Private Functions
    fileprivate func initialValues() {
        self.title = "Third"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
 
    // MARK: - Actions
    @IBAction func btnGoToFourth(_ sender: UIButton) {
        coordinator?.goToFourth()
    }
    
    @IBAction func btnBackToSecond(_ sender: UIButton) {
        coordinator?.finish()
    }
    
} // End of Class
