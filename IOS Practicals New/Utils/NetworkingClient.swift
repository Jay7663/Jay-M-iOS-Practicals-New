import Foundation
import Alamofire

class NetworkingClient {

    static func networkCall(url: URL, method: HTTPMethod, params: Parameters?, encoding: ParameterEncoding, headers: HTTPHeaders?,viewController: UIViewController, completion: @escaping (Data) -> Void) {
        
        AF.request(url, method: method, parameters: params, encoding: encoding, headers: headers, interceptor: nil, requestModifier: nil).response{ (response) in
            guard let data = response.data else { return }
            guard let statusCode  = response.response?.statusCode else { return }
            if ((200 ..< 299) ~= statusCode) {
                completion(data)
            } else {
                let alert = UIAlertController(title: "Error", message: "Something went wrong Please try aging", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                viewController.present(alert, animated: true, completion: nil)
            }
        }
    }
    
} // End of Class
