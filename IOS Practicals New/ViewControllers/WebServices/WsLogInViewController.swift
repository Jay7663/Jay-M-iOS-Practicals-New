import UIKit
import Alamofire

class WsLogInViewController: UIViewController, Storyboarded {
    
    // MARK: - Variables
    var user: UserLogIn?
    var coordinator: WebServicesCoordinator?
    
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
        hideKeyboardWhenTapAround()
        if let navController = self.navigationController {
            coordinator = WebServicesCoordinator(navController: navController)
        }
    }
    
    fileprivate func authenticateUserURLSession(_ user: UserLogIn) {
        if let url = URL(string: "https://reqres.in/api/login") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            do {
                urlRequest.httpBody = try JSONEncoder().encode(user)
            } catch let err {
                print("Error while Json Encoding \(err.localizedDescription)")
            }
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                guard let dataResponse = data,
                      error == nil else {
                          print(error?.localizedDescription ?? "Response Error")
                          return
                      }
                do{
                    let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
                    if let httpUrlResponse = response as? HTTPURLResponse {
                        if httpUrlResponse.statusCode == 200 {
                            DispatchQueue.main.async {
                                self.coordinator?.goToTableViewOfUsers(true)
                            }
                        }
                    }
                    print(jsonResponse)
                } catch let parsingError {
                    print("Error", parsingError)
                }
            }
            task.resume()
        }
    }
    
    fileprivate func authenticateUserAlamofire(_ user: UserLogIn) {
        if let url = URL(string: "https://reqres.in/api/login") {
            let params = ["email" : user.email, "password": user.password]
            NetworkingClient.networkCall(url: url, method: .post, params: params, encoding: JSONEncoding.default, headers: nil) { data in
                print("Ok")
                if data == nil {
                    let alert = UIAlertController(title: "Error", message: "Something went wrong Please try aging", preferredStyle: .actionSheet)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    self.coordinator?.goToTableViewOfUsers(false)
                }
            }
        }
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
    
} // End of Class
