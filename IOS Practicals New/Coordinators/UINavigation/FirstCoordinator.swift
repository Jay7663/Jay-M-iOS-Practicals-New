import Foundation
import UIKit

class FirstCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    init(navController: UINavigationController) {
        navigationController = navController
    }
    
    func start() {
        if let firstVC = UIStoryboard(name: "UINavigation", bundle: nil).instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController {
            firstVC.coordinator = self
            navigationController?.pushViewController(firstVC, animated: true)
        }
    }
    
    func goToSecond(_ message: String, _ delegate: FirstDelegate) {
        if let navigationController = navigationController {
            let secondVC = SecondCoordinator(navController: navigationController)
            secondVC.dataPassing(message, delegate)
        }
    }
    
    func finish() {
        navigationController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
    
} // End of Class
