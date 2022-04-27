import UIKit

class SignUpViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var lblLogIn: UILabel!
    @IBOutlet weak var tfFullName: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(lblLoginClick))
        lblLogIn.isUserInteractionEnabled = true
        lblLogIn.addGestureRecognizer(tap)
    }
    
    //MARK: - Actions
    @IBAction func backToMain(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func btnSignUp(_ sender: UIButton) {
        if let result = authenticateUser() {
            showMessage(result)
        } else {
            showMessage("Success")
        }
    }
    
}// End of class

//MARK: - File Private Functions
extension SignUpViewController {
    
    @objc func lblLoginClick(sender: UITapGestureRecognizer) {
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as? LogInViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    fileprivate func authenticateUser() -> String? {
        if let email = tfEmail.text, let password = tfPassword.text, let name = tfFullName.text {
            
            if(email.isEmpty || password.isEmpty || name.isEmpty) {
                return "All fields are required"
            } else if (!email.contains(".") || !email.contains("@")) {
                return "Wrong email"
            } else if (password.count < 8) {
                return "Atleast need 8 Characters"
            } else if (email == "jay@gmail.com" && password == "123123123") {
                return nil
            } else {
                return nil
            }
        }
        return "Something went wrong"
    }
    
    fileprivate func showMessage(_ message: String) {
        let alert = UIAlertController(title: "Auth Result", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}// End of extension

// MARK: - UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.tfFullName:
            self.tfEmail.becomeFirstResponder()
        case self.tfEmail:
            self.tfPassword.becomeFirstResponder()
        case self.tfPassword :
            self.tfPassword.resignFirstResponder()
        default:
            self.resignFirstResponder()
        }
        return true
    }
    
} // End of Extension
