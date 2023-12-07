import UIKit

extension UIApplication {
    
    var visibleViewController: UIViewController? {
        var rootViewController = windows.first(where: \.isKeyWindow)?.rootViewController
        while let presentedViewController = rootViewController?.presentedViewController {
            rootViewController = getVisibleViewController(presentedViewController)
        }
        return getVisibleViewController(rootViewController)
    }
    
    var safeAreaTopInset: CGFloat? {
        return delegate?.window??.safeAreaInsets.top
    }
    
    var safeAreaBottomInset: CGFloat? {
        return delegate?.window??.safeAreaInsets.bottom
    }
    
    var keyWindow: UIWindow? {
        connectedScenes.compactMap { ($0 as? UIWindowScene)?.keyWindow }.last
    }
    
    private func getVisibleViewController(_ rootViewController: UIViewController?) -> UIViewController? {
        if let navigationController = rootViewController as? UINavigationController {
            return navigationController.visibleViewController
        } else if let tabBarController = rootViewController as? UITabBarController,
                  let navigationController = tabBarController.selectedViewController as? UINavigationController {
            return navigationController.visibleViewController
        } else if let tabBarController = rootViewController as? UITabBarController {
            return tabBarController.selectedViewController
        } else {
            return rootViewController
        }
    }
    
}
