import UIKit

class LogInViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var lblSignUp: UILabel!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(lblSignUpClick))
        lblSignUp.isUserInteractionEnabled = true
        lblSignUp.addGestureRecognizer(tap)
    }
    
    //MARK: - Actions
    @IBAction func btnLogIn(_ sender: UIButton) {
        if let result = authenticateUser() {
            showMessage(result)
        } else {
            showMessage("Success")
        }
    }
    
}// End of class

//MARK: - File Private Functions
extension LogInViewController {
    
    @objc func lblSignUpClick(sender: UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
    
    fileprivate func authenticateUser() -> String? {
        if let email = tfEmail.text, let password = tfPassword.text {
            
            if(email.isEmpty || password.isEmpty) {
                return "All fields are required"
            } else if (!email.contains(".") || !email.contains("@")) {
                return "Wrong email"
            } else if (password.count < 8) {
                return "Atleast need 8 Characters"
            } else if (email == "jay@gmail.com" && password == "123123123") {
                return nil
            } else {
                return "Unauthorized User"
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
extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
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
