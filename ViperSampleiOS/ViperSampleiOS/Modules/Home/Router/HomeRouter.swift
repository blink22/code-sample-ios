// 
//  HomeRouter.swift
//  TopSwifts
//
//  Created by Blink22 on 06/12/2023.
//

import UIKit

enum HomeRouterDestination {}
enum HomeRouterPresentation {}

final class HomeRouter: HomeRouterProtocol {
    
    func navigate(to destination: HomeRouterDestination, from source: HomeViewProtocol?) {}
    
    func present(to presentationOption: HomeRouterPresentation, from source: HomeViewProtocol?) {}
}

