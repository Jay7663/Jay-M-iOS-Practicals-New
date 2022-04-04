import Foundation
import UIKit

class WebServicesCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    init(navController: UINavigationController) {
        navigationController = navController
    }
    
    func start() {
    }
    
    func goToSingleUserScreen(_ id: Int) {
        let singleUserVC = SingleUserViewController.instantiate(from: .webServices)
        singleUserVC.coordinator = self
        singleUserVC.id = id
        navigationController?.pushViewController(singleUserVC, animated: true)
    }
    
    func goToTableViewOfUsers(_ isFromURLSession: Bool) {
        let usersTableVC = UsersTableViewController.instantiate(from: .webServices)
        usersTableVC.coordinator = self
        usersTableVC.isFromURLSession = isFromURLSession
        navigationController?.pushViewController(usersTableVC, animated: true)
    }
    
    func goToNewsWithRss() {
        let rssVC = NewsWithRssViewController.instantiate(from: .webServices)
        rssVC.coordinator = self
        navigationController?.pushViewController(rssVC, animated: true)
    }
    func finish() {
    }
    
    func finishToRoot() {
    }
    
} // End of Class
