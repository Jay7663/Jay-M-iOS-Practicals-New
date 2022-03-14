import UIKit
import WebKit

class WebViewUICompViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPDF()
    }
    
    // MARK: - Actions
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func btnHome(_ sender: UIBarButtonItem) {
        loadURL(loadURL: "https://www.google.com")
    }
    
    @IBAction func btnForward(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
} // End of Class

// MARK: - File Private Functions
extension WebViewUICompViewController {
    
    fileprivate func loadURL(loadURL: String) {
        let url = URL(string: loadURL)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    fileprivate func loadPDF() {
        guard let pdfURL = Bundle.main.url(forResource: "ios 15 - Google Search", withExtension: ".pdf") else {
            return
        }
        webView.loadFileURL(pdfURL, allowingReadAccessTo: pdfURL.deletingLastPathComponent())
    }
    
} // End of Extension
