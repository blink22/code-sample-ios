// 
//  HomeModuleBuilder.swift
//  TopSwifts
//
//  Created by Blink22 on 06/12/2023.
//

import UIKit
import Foundation

final class HomeModuleBuilder {
    
    static func build() -> UIViewController {
        guard let view = R.storyboard.homeViewController.homeViewController() else {
            return UIViewController()
        }
        let router = HomeRouter()
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: view,
                                      interactor: interactor,
                                      router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
    
}
