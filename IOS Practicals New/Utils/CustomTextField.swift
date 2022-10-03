import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    @IBInspectable var textHint: String = "Name" {
        didSet {
            self.placeholder = textHint
            self.textColor = UIColor.green
        }
    }
    
    @IBInspectable var startImage: UIImage? {
        didSet {
            placeImage()
        }
    }
    
    func placeImage() {
        if let image = startImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = UIColor.blue
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: UIColor.blue])
    }
    
}
