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
    
    // MARK: - Actions
    @IBAction func btnLogInClick(_ sender: UIButton) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
            self.activityIndicator.stopAnimating()
            self.performSegue(withIdentifier: "LogInToTabBar", sender: self)
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
