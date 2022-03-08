import UIKit

class PageViewController: UIPageViewController {
    
    // MARK: - Variables
    lazy var vcList:[UIViewController] = {
        let storyboard = UIStoryboard(name: "UIComponents", bundle: nil)
        let firstVC = storyboard.instantiateViewController(identifier: "UICompSignUpViewController")
        let secondVC = storyboard.instantiateViewController(identifier: "UICompLogInViewController")
        return [firstVC, secondVC]
    }()
    
    // MARK: - UIPageViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let vc = vcList.first{
            self.setViewControllers([vc], direction: .forward, animated: true, completion: nil)
        }
    }
    
} // End of class

// MARK: - UIPageViewControllerDataSource
extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = vcList.lastIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        guard previousIndex >= 0 else {return nil}
        guard previousIndex < vcList.count else {return nil}
        return vcList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = vcList.lastIndex(of: viewController) else { return nil }
        let previousIndex = index + 1
        guard previousIndex >= 0 else {return nil}
        guard previousIndex < vcList.count else {return nil}
        return vcList[previousIndex]
    }
    
} // End of extension
