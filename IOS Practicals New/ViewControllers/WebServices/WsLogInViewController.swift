import UIKit
import Alamofire

class WsLogInViewController: UIViewController, Storyboarded {
    
    // MARK: - Variables
    var user: UserLogIn?
    var coordinator: WebServicesCoordinator?
    
    // MARK: - Outlets
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialData()
    }
    
    // MARK: - File Private Functions
    fileprivate func initialData() {
        hideKeyboardWhenTapAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        if let navController = self.navigationController {
            coordinator = WebServicesCoordinator(navController: navController)
        }
    }

    fileprivate func authenticateUserURLSession(_ user: UserLogIn) {
        if let validationMessage = validateFields() {
            generateAlert("Error", validationMessage, self)
        } else {
            if let url = URL(string: "https://reqres.in/api/login") {
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = "POST"
                do {
                    urlRequest.httpBody = try JSONEncoder().encode(user)
                } catch let err {
                    generateAlert("Error", "Error while Json Encoding\(err.localizedDescription)", self)
                }
                urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
                
                let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                    guard let dataResponse = data,
                          error == nil else {
                              self.generateAlert("Error", "\(String(describing: error?.localizedDescription))", self)
                              return
                          }
                    do{
                        _ = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                        if let httpUrlResponse = response as? HTTPURLResponse {
                            if httpUrlResponse.statusCode == 200 {
                                DispatchQueue.main.async {
                                    self.coordinator?.goToTableViewOfUsers(true)
                                }
                            }
                        }
                    } catch let parsingError {
                        self.generateAlert("Error", parsingError.localizedDescription, self)
                    }
                }
                task.resume()
            }
        }
    }
    
    fileprivate func authenticateUserAlamofire(_ user: UserLogIn) {
        if let validationMessage = validateFields() {
            generateAlert("Error", validationMessage, self)
        } else {
            if let url = URL(string: "https://reqres.in/api/login") {
                let params = ["email" : user.email, "password": user.password]
                NetworkingClient.networkCall(url: url, method: .post, params: params, encoding: JSONEncoding.default, headers: nil, viewController: self){ data in
                    self.coordinator?.goToTableViewOfUsers(false)
                }
            }
        }
    }
    
    fileprivate func validateFields() -> String? {
        if let email = tfEmail.text, let password = tfPassword.text {
            if(email.isEmpty || password.isEmpty) {
                return "All fields are required"
            } else if (!email.contains(".") || !email.contains("@")) {
                return "Wrong email"
            } else if (password.count < 8) {
                return "Atleast need 8 Characters"
            } else {
                return nil
            }
        }
        return "Error"
    }
    
    fileprivate func generateAlert(_ title: String, _ message: String, _ context: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        context.present(alert, animated: true, completion: nil)
    }
    
    @objc fileprivate func keyboardWillShow(notification:NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
    }
    
    @objc fileprivate func keyboardWillHide(notification:NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    // MARK: - Actions
    @IBAction func btnLogInURLSession(_ sender: UIButton) {
        user = UserLogIn(email: tfEmail.text ?? "", password: tfPassword.text ?? "")
        if let user = user {
            authenticateUserURLSession(user)
        }
    }
    
    @IBAction func btnLogInAlamofire(_ sender: UIButton) {
        user = UserLogIn(email: tfEmail.text ?? "", password: tfPassword.text ?? "")
        if let user = user {
            authenticateUserAlamofire(user)
        }
    }
    
    @IBAction func btnBackToHome(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
} // End of Class

extension WsLogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.tfEmail:
            self.tfPassword.becomeFirstResponder()
        default:
            self.tfPassword.resignFirstResponder()
        }
        return true
    }
    
}
