//
//  TalaAlert.swift
//  Tala
//
//  Created by Blink22 on 31/10/2023.
//

import UIKit

public class Alert {
    public var alertController: UIAlertController?

    private init() {}

    private init(title: String?, message: String?, preferredStyle: UIAlertController.Style, tintColor: UIColor? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        if let tintColor = tintColor {
            alertController.view.tintColor = tintColor
        }

        self.alertController = alertController
    }

    public class func create(_ style: UIAlertController.Style = .alert, title: String? = nil, message: String? = nil, tintColor: UIColor? = nil) -> Alert {
        return Alert(title: title, message: message, preferredStyle: style, tintColor: tintColor)
    }

    public func addAction(_ title: String?, style: UIAlertAction.Style = .default, preferred: Bool = false, handler: ((_ action: UIAlertAction) -> Void)? = nil) -> Self {
        let action = UIAlertAction(title: title, style: style) { action in
            handler?(action)
            self.alertController = nil
        }

        alertController?.addAction(action)

        if preferred {
            alertController?.preferredAction = action
        }

        return self
    }
    
    public func addOK(handler: ((_ action: UIAlertAction) -> Void)? = nil) -> Self {
        return addAction("OK" , style: .default, handler: handler)
    }

    public func addCancel(handler: ((_ action: UIAlertAction) -> Void)? = nil) -> Self {
        return addAction("Cancel", style: .cancel, handler: handler)
    }
    
    public func show(_ viewControllerToPresent: UIViewController? = nil, animated: Bool = true, completion: @escaping ((Bool) -> Void) = { _ in } ) {
        guard let alert = alertController else {
            completion(false)
            return
        }

        guard let viewController = viewControllerToPresent ?? UIApplication.shared.visibleViewController else {
            completion(false)
            return
        }

        viewController.present(alert, animated: animated) {
            completion(true)
        }
    }
}
