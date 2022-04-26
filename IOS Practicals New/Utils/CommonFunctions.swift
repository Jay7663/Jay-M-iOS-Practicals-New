import Foundation
import UIKit

class CommonFunctions {
    
    static func generateAlert(_ title: String, _ message: String, _ context: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        context.present(alert, animated: true, completion: nil)
    }
    
}
