import UIKit

class ArchitectureViewController: UIViewController, Storyboarded {

    // MARK: - Variables
    var coordinator: ArchitectureCoordinator?
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        if let navController = self.navigationController {
            coordinator = ArchitectureCoordinator(navController: navController)
        }
    }
    
    // MARK: - Actions
    @IBAction func btnMvc(_ sender: UIButton) {
        coordinator?.goToMVC()
    }
    
    @IBAction func btnMvp(_ sender: UIButton) {
        coordinator?.goToMVP()
    }
    
    @IBAction func btnMvvm(_ sender: UIButton) {
        coordinator?.goToMVVMLogIn()
    }
    
}
