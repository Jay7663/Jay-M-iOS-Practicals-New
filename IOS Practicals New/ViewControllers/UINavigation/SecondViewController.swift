import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Variables
    var coordinator: SecondCoordinator?
    var firstVCDataTransferDelegate: FirstVCDataTransferDelegate?
    var message: String = ""
    
    // MARK: - Outlets
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialValues()
    }

    // MARK: - File Private Functions
    fileprivate func initialValues() {
        hideKeyboardWhenTapAround()
        self.title = "Second"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        lblMessage.text = message
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc fileprivate func keyboardWillShow(notification:NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 20
        scrollView.contentInset = contentInset
    }
    
    @objc fileprivate func keyboardWillHide(notification:NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    // MARK: - Actions
    @IBAction func btnGoToThird(_ sender: UIButton) {
        coordinator?.goToThird()
    }
    
    @IBAction func btnBackToFirst(_ sender: UIButton) {
        firstVCDataTransferDelegate?.messageSent(tfMessage.text ?? "Empty")
        coordinator?.finish()
    }
    
    @IBAction func btnGoToFourth(_ sender: UIButton) {
        coordinator?.goToFourth()
    }
    
} // End of Class

//MARK: - UITextFieldDelegate
extension SecondViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.tfMessage:
            self.tfMessage.resignFirstResponder()
        default:
            self.tfMessage.resignFirstResponder()
        }
        return true
    }
    
} // End of Extension
