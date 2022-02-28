import UIKit

class LogInViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var lblSignUp: UILabel!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(lblSignUpClick))
        lblSignUp.isUserInteractionEnabled = true
        lblSignUp.addGestureRecognizer(tap)
    }
    
}// End of class

//MARK: - File Private Functions
extension LogInViewController {
    
    @objc func lblSignUpClick(sender: UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
    
}// End of extension
