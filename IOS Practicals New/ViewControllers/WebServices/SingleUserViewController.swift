import UIKit

class SingleUserViewController: UIViewController, Storyboarded {
    
    // MARK: - Variables
    var coordinator: WebServicesCoordinator?
    var id: Int?
    private var user: UserData?
    
    // MARK: - Outlets
    @IBOutlet weak var ivProfilePic: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        loadUser()
    }
    
    // MARK: - File Private Functions
    fileprivate func loadUser() {
        guard let url = URL(string: "https://reqres.in/api/users/\(id ?? 0)") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                  error == nil else {
                      self.generateAlert("Error", "\(String(describing: error?.localizedDescription))", self)
                      return }
            do{
                let decoder = JSONDecoder()
                let userResponse = try decoder.decode(SingleUserData.self, from: dataResponse)
                
                DispatchQueue.main.async {
                    if let url = URL(string: userResponse.data.avatar) {
                        DispatchQueue.global().async {
                            let data = try? Data(contentsOf: url)
                            DispatchQueue.main.async {
                                self.ivProfilePic.image = UIImage(data: data!)
                            }
                        }
                    }
                    self.lblUserName.text = userResponse.data.last_name + userResponse.data.first_name
                    self.lblEmail.text = userResponse.data.email
                }
                
            } catch let parsingError {
                self.generateAlert("Error", "\(parsingError.localizedDescription)", self)
            }
        }
        task.resume()
    }
    
    fileprivate func generateAlert(_ title: String, _ message: String, _ context: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        context.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    @IBAction func btnNewsWithRss(_ sender: UIButton) {
        self.coordinator?.goToNewsWithRss()
    }
    
} // End of Class
