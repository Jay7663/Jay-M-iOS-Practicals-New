import Foundation
import UIKit.UITextView

extension UITextView {
    
    func addDoneButtonOnKeyboard() {
        let keyBoardToolBar = UIToolbar()
        keyBoardToolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(resignFirstResponder))
        keyBoardToolBar.items = [flexibleSpace, doneButton]
        self.inputAccessoryView = keyBoardToolBar
    }
    
} // End of Extension
