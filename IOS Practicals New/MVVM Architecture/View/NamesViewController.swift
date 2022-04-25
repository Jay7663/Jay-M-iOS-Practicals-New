import UIKit

class NamesViewController: UIViewController, Storyboarded {

    // MARK: - Variables
    let namesViewModel = NamesViewModel()
    var names = Array<String>()
    var coordinator: ArchitectureCoordinator?
    
    // MARK: - Outlets
    @IBOutlet weak var tblNames: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        bindViewModel()
        namesViewModel.getNamesFromApi()
    }
    
    // MARK: - File Private Functions
    fileprivate func bindViewModel() {
        namesViewModel.returnedName = { data in
            
            for user in data {
                self.names.append("\(user.first_name) \(user.last_name)")
            }
            
            self.tblNames.reloadData()
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }

} // End of Class

// MARK: - UITableViewDataSource
extension NamesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
} // End of Extension
