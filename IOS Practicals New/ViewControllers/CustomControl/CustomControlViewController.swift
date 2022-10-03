import UIKit
import Alamofire

class CustomControlViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        apiCall()
    }
    
    func apiCall() {
        if let url = URL(string: "https://reqres.in/api/users?delay=3") {

            let params = ["email" : "eve.holt@reqres.in", "password": "asdaiub"]

            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response{ [weak self](response) in
                guard let _ = response.data else { return }
                guard let statusCode  = response.response?.statusCode else { return }
                if ((200 ..< 299) ~= statusCode) {
                    self?.generateAlert("Log in Success")
                } else {
                    self?.generateAlert("Log in Failed")
                }
            }
        }
        
        if let url = URL(string: "https://reqres.in/api/users/2") {
            
            let params = ["name": "morpheus", "job": "zion resident"]
            
            AF.request(url, method: .put, parameters: params, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response{ [weak self](response) in
                guard let data = response.data else { return }
                
                print(data)
                
                
            }
        }
    }

    fileprivate func generateAlert(_ message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

