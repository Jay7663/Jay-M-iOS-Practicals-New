import UIKit

class TableContentViewController: UIViewController {
    
    // MARK: - Variables
    let refreshControl = UIRefreshControl()
    var topCities: [String] = ["Mumbai", "Delhi", "Bangalore", "Hyderabad", "Ahmedabad", "Chennai", "Kolkata", "Surat", "Pune", "Jaipur"]
    var topStates: [String] = ["Maharashtra", "Delhi", "Karnataka", "Telangana", "Gujarat", "Tamil Nadu ", "West Bengal", "Rajasthan", "Uttar Pradesh", "Bihar"]
    
    // MARK: - Outlets
    @IBOutlet weak var tblContainer: UITableView!
    @IBOutlet var viewHeader: UIView!
    @IBOutlet var viewFooter: UIView!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var lblFooter: UILabel!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialData()
    }
    
    // MARK: - Actions
    @IBAction func backToSignUp(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
}// End of class

// MARK: - File Private Functions
extension TableContentViewController {
    
    fileprivate func initialData() {
        tblContainer.register(UINib(nibName: "IndexTableViewCell", bundle: nil), forCellReuseIdentifier: "IndexTableViewCell")
        
        viewHeader.frame = CGRect(x: 0.0, y: 0.0, width: tblContainer.frame.size.width, height: CGFloat(Constants.TABLEVIEW_HIGHT_FOR_ROW_AT))
        viewFooter.frame = CGRect(x: 0.0, y: 0.0, width: tblContainer.frame.size.width, height: CGFloat(Constants.TABLEVIEW_HIGHT_FOR_ROW_AT))
        lblHeader.text = "Header Starts"
        lblFooter.text = "Footer Ends"
        tblContainer.tableHeaderView = viewHeader
        tblContainer.tableFooterView = viewFooter
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tblContainer.addSubview(refreshControl)
    }
    
    @objc fileprivate func refresh(_ sender: AnyObject) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            print("3 second delay")
            self.refreshControl.endRefreshing()
        }
    }
    
} // End of extension

// MARK: - UITableViewDelegate
extension TableContentViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.TABLEVIEW_HIGHT_FOR_ROW_AT)
    }
    
} // End of extension

// MARK: - UITableViewDataSource
extension TableContentViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.TWO
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? topCities.count : topStates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView .dequeueReusableCell(withIdentifier: "IndexTableViewCell") as? IndexTableViewCell else {
            return UITableViewCell()
        }
        cell.lblCellItem.text = indexPath.section == 0 ? topCities[indexPath.row] : topStates[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Top 10 Cities in India" : "TOp 10 States in India"
    }
    
} // End of extension
