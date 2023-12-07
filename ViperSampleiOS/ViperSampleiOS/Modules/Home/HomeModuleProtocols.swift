// 
//  HomeModuleProtocols.swift
//  TopSwifts
//
//  Created by Blink22 on 06/12/2023.
//

import Foundation

typealias GithubReposResult = Result<BaseResponse<[GithubRepo]>, Error>

protocol HomeRouterProtocol: AnyObject {
    func navigate(to destination: HomeRouterDestination, from source: HomeViewProtocol?)
    func present(to presentationOption: HomeRouterPresentation, from source: HomeViewProtocol?)
}

protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    func getTopSwiftRepositories()
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
    var interactor: HomeInteractorProtocol! { get set }
    func getTopSwiftRepositoriesDidEnd(with result: GithubReposResult)
}

protocol HomeViewProtocol: AnyObject {
    
    var presenter: HomeViewToPresenterProtocol! { get set }
    func dataDidLoaded(data: [GithubRepo])
    func displayError(error: Error)
    
}

protocol HomeViewToPresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    func loadData()
    func getReposCount() -> Int
    func getRepo(index: Int) -> GithubRepo?
}
