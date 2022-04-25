//
//  MVVMLogInViewController.swift
//  IOS Practicals New
//
//  Created by Modhawadiya Jay on 14/04/22.
//

import UIKit

class MVVMLogInViewController: UIViewController, Storyboarded {

    // MARK: - Variables
    let namesViewModel = NamesViewModel()
    var coordinator: ArchitectureCoordinator?
    
    // MARK: - Outlets
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var lblError: UILabel!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        lblError.alpha = 0
        bindViewModel()
    }
    
    // MARK: - File Private Functions
    fileprivate func bindViewModel() {
        namesViewModel.validationError = { message in
            self.lblError.alpha = 1
            self.lblError.text = message
        }
        namesViewModel.onSuccess = { message in
            self.lblError.alpha = 0
            self.coordinator?.goToMVVMNamesTable()
        }
    }
    
    // MARK: - Actions
    @IBAction func btnLogIn(_ sender: UIButton) {
        namesViewModel.validate(tfEmail.text ?? "", tfPassword.text ?? "")
    }
    
} // End of Class
