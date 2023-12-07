//
//  UIViewControllerExtension.swift
//  Tala
//
//  Created by Blink22 on 31/10/2023.
//

import UIKit

extension UIViewController {
    
    func showError(error: String, title: String ) {
        Alert.create(.alert, title: title, message: error).addOK().show()
    }
}

