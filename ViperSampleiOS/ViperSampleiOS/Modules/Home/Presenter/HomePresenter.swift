// 
//  HomePresenter.swift
//  TopSwifts
//
//  Created by Blink22 on 06/12/2023.
//

import Foundation

final class HomePresenter {
    
    internal weak var view: HomeViewProtocol?
    internal var interactor: HomeInteractorProtocol!
    private var router: HomeRouterProtocol!
    
    // Repositories loading's result (list or error).
    private var error: Error?
    private var repositories: [GithubRepo]?
    
    init(
        view: HomeViewProtocol,
        interactor: HomeInteractorProtocol,
        router: HomeRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - Extension: HomeViewToPresenterProtocol
extension HomePresenter: HomeViewToPresenterProtocol {
    func loadData() {
        interactor.getTopSwiftRepositories()
    }
    
    func getReposCount() -> Int {
        return repositories?.count ?? 0
    }
    
    func getRepo(index: Int) -> GithubRepo? {
        guard let count = repositories?.count , count > index else {
            return nil
        }
        return repositories?[index]
    }
}

// MARK: - Extension: HomeInteractorToPresenterProtocol
extension HomePresenter: HomeInteractorToPresenterProtocol {
    
    func getTopSwiftRepositoriesDidEnd(with result: GithubReposResult) {
        switch result {
            case .success(let result):
            repositories = result.items
            view?.dataDidLoaded(data: result.items)
            case .failure(let error):
                view?.displayError(error: error)
        }
    }
}
