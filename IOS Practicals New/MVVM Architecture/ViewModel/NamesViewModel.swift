import UIKit
import Alamofire

class NamesViewModel: NSObject {
    
    // MARK: - Variables
    var names = [String]()
    private var arrayUsers = [UserData]()
    var returnedName: (([UserData]) -> Void)?
    var validationError: ((String) -> Void)?
    var onSuccess: ((String) -> Void)?
    
    // MARK: - Functions
    func getNamesFromApi() {
        apiRequestForUsersList()
    }
    
    func validate(_ email: String , _ password: String) {
        if (email.isEmpty) {
            validationError?("Empty email")
        } else if (password.isEmpty) {
            validationError?("Empty password")
        } else {
            validateUserFromApi(email,password)
        }
    }
    
    func validateUserFromApi(_ email: String, _ password: String) {
        authenticateUserAlamofire(email,password)
    }
    
    fileprivate func authenticateUserAlamofire(_ email: String, _ password: String) {
        if let url = URL(string: "https://reqres.in/api/login") {
            let params = ["email" : email, "password": password]
            NetworkingClient.networkCall(url: url, method: .post, params: params, encoding: JSONEncoding.default, headers: nil) { data in
                //self.coordinator?.goToTableViewOfUsers(false)
                if let _ = data {
                    self.onSuccess?("LogIn Success")
                } else {
                    self.validationError?("Wrong Credentials...")
                }
            }
        }
    }
    
    fileprivate func apiRequestForUsersList() {
        if let url = URL(string: "https://reqres.in/api/users?delay=3") {
            NetworkingClient.networkCall(url: url, method: .get, params: nil, encoding: JSONEncoding.default, headers: nil) { result in
                if let result = result {
                    do {
                        let decoder = JSONDecoder()
                        let userResponse = try decoder.decode(RootUserData.self, from: result)
                        
                        for user in userResponse.data {
                            print(user)
                            //self.names.append("\(user.first_name) \(user.last_name)")
                            self.arrayUsers.append(UserData(id: user.id, email: user.email, first_name: user.first_name, last_name: user.last_name, avatar: user.avatar))
                        }
                        self.returnedName?(self.arrayUsers)
                    } catch let error {
                        print("Error: \(error.localizedDescription)")
                    }
                } else {
                    print("No Data Found")
                }
            }
        }
    }
} // End of Class
