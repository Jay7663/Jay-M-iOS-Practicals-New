//
//  LogInViewController.swift
//  IOS Practicals New
//
//  Created by Modhawadiya Jay on 12/04/22.
//

import UIKit

class MVPLogInViewController: UIViewController, Storyboarded {

    // MARK: - Variables
    lazy var presenter = LogInPresenter(view:self)
    var coordinator: ArchitectureCoordinator?
    
    // MARK: - Outlets
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
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
    
    fileprivate func generateAlert(_ message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    @IBAction func btnLogIn(_ sender: UIButton) {
        presenter.email = tfEmail.text
        presenter.password = tfPassword.text
        presenter.doLogIn()
    }
    
} // End of Class

// MARK: - LogInResponse
extension MVPLogInViewController: LogInResponse {
    func logInSuccess(message: String) {
        generateAlert(message)
    }
    
    func logInFailed(message: String) {
        generateAlert(message)
    }
} // End of Extension
