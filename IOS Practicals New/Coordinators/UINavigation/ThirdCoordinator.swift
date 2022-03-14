import Foundation
import UIKit

class ThirdCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    init(navController: UINavigationController) {
        navigationController = navController
    }
    
    func start() {
        if let thirdVC = UIStoryboard(name: "UINavigation", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController {
            thirdVC.coordinator = self
            navigationController?.pushViewController(thirdVC, animated: true)
        }
    }
    
    func goToFourth() {
        if let navigationController = navigationController {
            let fourthVC = FourthCoordinator(navController: navigationController)
            fourthVC.start()
        }
    }
    
    func finish() {
        navigationController?.popViewController(animated: true)
    }
    
    func finishToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
    
} // End of Class
