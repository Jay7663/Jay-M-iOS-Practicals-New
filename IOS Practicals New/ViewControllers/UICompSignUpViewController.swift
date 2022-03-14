import UIKit

class UICompSignUpViewController: UIViewController {
    
    // MARK: - Variables
    var datePicker = UIDatePicker()
    
    // MARK: - Outlets
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tvBio: UITextView!
    @IBOutlet weak var lblAge: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    @IBOutlet weak var imgViewProfile: UIImageView!
    @IBOutlet weak var tfDatePicker: UITextField!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialData()
    }
    
    // MARK: - Actions
    @IBAction func ageSliderValueChange(_ sender: UISlider) {
        lblAge.text = "\(Int(sender.value))"
    }
    
    @IBAction func btnSignUpClick(_ sender: UIButton) {
        UIView.animate(withDuration: 5.0) {
            self.progressView.setProgress(1.0, animated: true)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5.0) {
            self.performSegue(withIdentifier: "SignUpToTabBar", sender: self)
        }
    }
    
    @IBAction func radioBtnGender(_ sender: UIButton) {
        btnMale.isSelected = sender.tag == Constants.ONE ? true : false
        btnFemale.isSelected = sender.tag == Constants.TWO ? true : false
    }
    
} // End of class

// MARK: - UIImagePickerControllerDelegate
extension UICompSignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage {
            imgViewProfile.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
} // End of Extension

// MARK: - UITextFieldDelegate
extension UICompSignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.tfEmail:
            self.tfPassword.becomeFirstResponder()
        case self.tfPassword:
            self.tvBio.becomeFirstResponder()
        default:
            self.resignFirstResponder()
        }
        return true
    }
    
} // End of Extension

// MARK: - File Private Functions
extension UICompSignUpViewController {
    
    fileprivate func initialData() {
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        tvBio.layer.borderWidth = 0.5
        tvBio.layer.borderColor = borderColor.cgColor
        tvBio.layer.cornerRadius = 5.0
        tvBio.addDoneButtonOnKeyboard()
        
        imgViewProfile.layer.borderWidth = 1
        imgViewProfile.layer.borderColor = UIColor.black.cgColor
        imgViewProfile.layer.cornerRadius = imgViewProfile.frame.height/2
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgViewProfile.isUserInteractionEnabled = true
        imgViewProfile.addGestureRecognizer(tapGestureRecognizer)
        
        createDatePicker()
        hideKeyboardWhenTapAround()
    }
    
    @objc fileprivate func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let viewController = UIImagePickerController()
        viewController.sourceType = .photoLibrary
        viewController.delegate = self
        viewController.allowsEditing = false
        present(viewController, animated: true)
    }
    
    @objc fileprivate func doneBtnClick() {
        let formater = DateFormatter()
        formater.dateStyle = .medium
        formater.timeStyle = .none
        tfDatePicker.text = formater.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    fileprivate func createDatePicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneBtnClick))
        toolBar.setItems([doneBtn], animated: true)
        tfDatePicker.inputAccessoryView = toolBar
        tfDatePicker.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
    }
    
} // End of Extension
