import UIKit

class FourthViewController: UIViewController {
    
    // MARK: - Variables
    var coordinator: FourthCoordinator?
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fourth"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: - Actions
    @IBAction func btnBackToRoot(_ sender: UIButton) {
        coordinator?.finishToRoot()
    }
    
    @IBAction func btnBackToThird(_ sender: UIButton) {
        coordinator?.finish()
    }
    
    @IBAction func btnPopoverScreen(_ sender: UIButton) {
        presentView(source: sender, isFromBtn: true)
    }
    
    @IBAction func bbiAddFormSheet(_ sender: UIBarButtonItem) {
        presentView(isFromBtn: false)
    }
    
} // End of Class

//MARK: - File Private Functions
extension FourthViewController {
    
    fileprivate func presentView(source sender: UIButton = UIButton(), isFromBtn flag: Bool = false) {
        if let mainVC = UIStoryboard(name: "UINavigation", bundle: nil).instantiateViewController(withIdentifier: "FifthViewController") as? FifthViewController {
            if flag {
                mainVC.modalPresentationStyle = .popover
                mainVC.popoverPresentationController?.sourceView = sender
                mainVC.popoverPresentationController?.permittedArrowDirections = .up
            }
            self.present(mainVC, animated: true, completion: nil)
        }
    }
    
} // End of Extension
