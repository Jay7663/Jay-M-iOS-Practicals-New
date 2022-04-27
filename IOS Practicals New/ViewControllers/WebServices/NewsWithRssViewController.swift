import UIKit
import Alamofire
import AlamofireRSSParser

class NewsWithRssViewController: UIViewController, Storyboarded {
    
    // MARK: - Variables
    private var newsTitle = Array<String>()
    var coordinator: WebServicesCoordinator?
    
    // MARK: - Outlets
    @IBOutlet weak var tblNewsTitle: UITableView!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialData()
        loadData()
    }
    
    // MARK: - File Private Functions
    fileprivate func initialData() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        tblNewsTitle.dataSource = self
        tblNewsTitle.register(UINib(nibName: "IndexTableViewCell", bundle: nil), forCellReuseIdentifier: "IndexTableViewCell")
    }
    
    fileprivate func loadData() {
        if let url = URL(string: "https://developer.apple.com/news/rss/news.rss") {
            AF.request(url).responseRSS { response in
                switch response.result {
                case .success(let feed) :
                    
                    for news in feed.items {
                        if let title = news.title {
                            self.newsTitle.append(title)
                        }
                    }
                    
                    self.tblNewsTitle.reloadData()
                    break
                case .failure(let error) :
                    print("Error : \(error.localizedDescription)")
                    break
                }
            }
        }
    }
    
} // End of Class

// MARK: - UITableViewDataSource
extension NewsWithRssViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView .dequeueReusableCell(withIdentifier: "IndexTableViewCell") as? IndexTableViewCell else {
            return UITableViewCell()
        }
        cell.lblCellItem.text = newsTitle[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Apple News Titles"
    }
    
} // End of Extension
