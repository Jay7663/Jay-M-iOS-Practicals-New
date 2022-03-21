import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    init(navController: UINavigationController) {
        navigationController = navController
    }
    
    func start() {
        if let navVC = navigationController {
            let mainCoordinator = MainCoordinator(navController: navVC)
            mainCoordinator.start()
        }
    }
    
    func finish() {
    }
    
    func finishToRoot() {
    }
    
} // End of Class

