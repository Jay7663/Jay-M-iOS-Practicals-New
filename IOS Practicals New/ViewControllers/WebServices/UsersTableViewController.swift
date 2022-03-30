import UIKit
import Alamofire

class UsersTableViewController: UIViewController, Storyboarded {
    
    // MARK: - Variables
    var coordinator: WebServicesCoordinator?
    private var arrayUsers = [UserData]()
    var isFromURLSession = true
    
    // MARK: - Outlets
    @IBOutlet weak var usersTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var btnAddUser: UIButton!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialData()
    }
    
    // MARK: - File Private Functions
    fileprivate func initialData() {
        activityIndicator.startAnimating()
        isFromURLSession ? getUsersDataFromURLSession() : getUsersDataFromAlamofire()
        if let navController = self.navigationController {
            coordinator = WebServicesCoordinator(navController: navController)
        }
        self.navigationController?.navigationBar.prefersLargeTitles = true
        usersTableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
    }
    
    fileprivate func getUsersDataFromURLSession() {
        self.title = "URL Session"
        btnAddUser.isHidden = true
        guard let url = URL(string: "https://reqres.in/api/users?delay=3") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }
            do{
                let decoder = JSONDecoder()
                let userResponse = try decoder.decode(RootUserData.self, from: dataResponse)
                
                for user in userResponse.data {
                    print(user)
                    self.arrayUsers.append(UserData(id: user.id, email: user.email, first_name: user.first_name, last_name: user.last_name, avatar: user.avatar))
                }
                
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                    self.usersTableView.reloadData()
                }
                
            } catch let parsingError {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    fileprivate func getUsersDataFromAlamofire() {
        self.title = "Alamofire"
        btnAddUser.isHidden = false
        if let url = URL(string: "https://reqres.in/api/users?delay=3") {
            NetworkingClient.networkCall(url: url, method: .get, params: nil, encoding: JSONEncoding.default, headers: nil, viewController: self) { result in
                do {
                    let decoder = JSONDecoder()
                    let userResponse = try decoder.decode(RootUserData.self, from: result)
                    
                    for user in userResponse.data {
                        print(user)
                        self.arrayUsers.append(UserData(id: user.id, email: user.email, first_name: user.first_name, last_name: user.last_name, avatar: user.avatar))
                    }
                    
                    DispatchQueue.main.async {
                        self.activityIndicator.stopAnimating()
                        self.activityIndicator.isHidden = true
                        self.usersTableView.reloadData()
                    }
                    
                } catch let error {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    fileprivate func handleCreationResponse(_ name: String, _ job: String){
        if let url = URL(string: "https://reqres.in/api/users") {
            let params = ["name" : name, "job": job]
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response{ (response) in
                if (response.response?.statusCode == 201) {
                    let alert = UIAlertController(title: "Success", message: "User Added Successfully", preferredStyle: .actionSheet)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
    
    //MARK: - Actions
    @IBAction func btnAddUser(_ sender: UIButton) {
        let alert = UIAlertController(title: "Add User", message: "Enter below details:", preferredStyle: .alert)

        alert.addTextField { (textField) in
            textField.placeholder = "Enter Name..."
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Enter Job..."
        }

        alert.addAction(UIAlertAction(title: "Add User", style: .default, handler: { [weak alert] (_) in
            let tfName = alert?.textFields![0] // Force unwrapping because we know it exists.
            let tfJob = alert?.textFields![1]
            self.handleCreationResponse(tfName?.text ?? "", tfJob?.text ?? "")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
} // End of Class

// MARK: - UITableViewDelegate
extension UsersTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
        coordinator?.goToSingleUserScreen(indexPath.row + 1)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(150)
    }
    
} // End of Extension

// MARK: - UITableViewDataSource
extension UsersTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView .dequeueReusableCell(withIdentifier: "UserTableViewCell") as? UserTableViewCell else {
            return UITableViewCell()
        }
        if let url = URL(string: arrayUsers[indexPath.row].avatar) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    cell.ivProfilePic.image = UIImage(data: data!)
                }
            }
        }
        cell.lblUserName.text = "\(arrayUsers[indexPath.row].first_name + arrayUsers[indexPath.row].last_name)"
        cell.lblEmail.text = "\(arrayUsers[indexPath.row].email)"
        return cell
    }
    
} // End of Extension
