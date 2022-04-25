import Foundation
import UIKit

class ArchitectureCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    init(navController: UINavigationController) {
        navigationController = navController
    }
    
    func start() {
    }
    func goToMVC() {
        let mvcVC = MVCViewController.instantiate(from: .mvcStoryBoard)
        mvcVC.coordinator = self
        navigationController?.pushViewController(mvcVC, animated: true)
    }
    func goToMVP() {
        let mvpVC = MVPLogInViewController.instantiate(from: .mvpLogIn)
        mvpVC.coordinator = self
        navigationController?.pushViewController(mvpVC, animated: true)
    }
    
    func goToMVVMLogIn() {
        let mvvmVC = MVVMLogInViewController.instantiate(from: .mvvmStoryboard)
        mvvmVC.coordinator = self
        navigationController?.pushViewController(mvvmVC, animated: true)
    }
    func goToMVVMNamesTable() {
        let mvvmVC = NamesViewController.instantiate(from: .mvvmStoryboard)
        mvvmVC.coordinator = self
        navigationController?.pushViewController(mvvmVC, animated: true)
    }
    
    func finish() {
    }
    
    func finishToRoot() {
    }
    
} // End of Class
