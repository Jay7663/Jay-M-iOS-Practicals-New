import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    init(navController: UINavigationController) {
        navigationController = navController
    }
    
    func start() {
        if let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            mainVC.coordinator = self
            navigationController?.pushViewController(mainVC, animated: true)
        }
    }
    
    func finish() {
    }
    
    func finishToRoot() {
    }
    
} // End of Class
