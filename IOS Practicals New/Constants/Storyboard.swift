import UIKit
import Foundation

/// Storyboards
enum Storyboard: String {
    case webServices = "WebServices"
    case architecture = "Architecture"
    case mvcStoryBoard = "MVCStoryboard"
    case mvpLogIn = "MVPLogIn"
    case mvvmStoryboard = "MVVMStoryboard"
}

/// Storyboarded
protocol Storyboarded {
    static func instantiate(from storyboard: Storyboard) -> Self
}

// MARK: - Storyboarded extension to return view controller
extension Storyboarded where Self: UIViewController {
    
    /// Instantiate
    static func instantiate(from storyboard: Storyboard) -> Self {
        
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self // swiftlint:disable:this force_cast
    }
    
} // End Of Extension
