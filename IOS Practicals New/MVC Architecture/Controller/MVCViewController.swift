import UIKit

class MVCViewController: UIViewController, Storyboarded {

    // MARK: - Variables
    var coordinator: ArchitectureCoordinator?
    var counter = 0
    
    // MARK: - Outlets
    @IBOutlet weak var lblCounter: UILabel!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialData()
    }
    
    // MARK: - File Private Functions
    fileprivate func initialData() {
        if let navController = self.navigationController {
            coordinator = ArchitectureCoordinator(navController: navController)
        }
    }
    
    // MARK: - Actions
    @IBAction func btnIncrement(_ sender: UIButton) {
        counter = counter + 1
        lblCounter.text = String(counter)
    }

} // End of Class
