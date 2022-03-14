import Foundation
import UIKit

class SecondCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    init(navController: UINavigationController) {
        navigationController = navController
    }
    
    func start() {
        if let secondVC = UIStoryboard(name: "UINavigation", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            secondVC.coordinator = self
            navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    
    func dataPassing (_ message: String, _ delegate: FirstDelegate) {
        if let secondVC = UIStoryboard(name: "UINavigation", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            secondVC.coordinator = self
            secondVC.message = message
            secondVC.firstDelegate = delegate
            navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    
    func goToThird() {
        if let navigationController = navigationController {
            let thirdVC = ThirdCoordinator(navController: navigationController)
            thirdVC.start()
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
