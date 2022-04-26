import UIKit

class UICompLogInViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet var rootView: UIView!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        hideKeyboardWhenTapAround()
    }
    
    //MARK: - FilePrivateFunctions
    fileprivate func validateFields() -> String? {
        if let email = tfEmail.text, let password = tfPassword.text {
            if(email.isEmpty || password.isEmpty) {
                return "All fields are required"
            } else if (!email.contains(".") || !email.contains("@")) {
                return "Wrong email"
            } else if (password.count < 8) {
                return "Atleast need 8 Characters"
            } else if ((email == "jay@gmail.com" && password == "123123123")) {
                return nil
            } else {
                return "Unauthorized User"
            }
        }
        return "Something Went Wrong, Please try again"
    }
    
    // MARK: - Actions
    @IBAction func btnLogInClick(_ sender: UIButton) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        if let result = validateFields() {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
            CommonFunctions.generateAlert("Error", result, self)
        } else {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                self.performSegue(withIdentifier: "LogInToTabBar", sender: self)
            }
        }
    }
    
} // End of Class

// MARK: - UITextFieldDelegate
extension UICompLogInViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.tfEmail:
            self.tfPassword.becomeFirstResponder()
        case self.tfPassword:
            self.tfPassword.resignFirstResponder()
        default:
            self.resignFirstResponder()
        }
        return true
    }
    
} // End of Extension
