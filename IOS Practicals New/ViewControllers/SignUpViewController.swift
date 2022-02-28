import UIKit

class SignUpViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var lblLogIn: UILabel!
    
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
    
}// End of class

//MARK: - File Private Functions
extension SignUpViewController {
    
    @objc func lblLoginClick(sender: UITapGestureRecognizer) {
        if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as? LogInViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
}// End of extension
