import Foundation
import UIKit

class FourthCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    init(navController: UINavigationController) {
        navigationController = navController
    }
    
    func start() {
        if let fourthVC = UIStoryboard(name: "UINavigation", bundle: nil).instantiateViewController(withIdentifier: "FourthViewController") as? FourthViewController {
            fourthVC.coordinator = self
            navigationController?.pushViewController(fourthVC, animated: true)
        }
    }
    
    func finish() {
        navigationController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
    
} // End of Class
