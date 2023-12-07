// 
//  HomeInteractor.swift
//  TopSwifts
//
//  Created by Blink22 on 06/12/2023.
//

import Foundation
import PromiseKit

final class HomeInteractor {
    
    internal weak var presenter: HomeInteractorToPresenterProtocol?
    
//    init() {
//        getTopSwiftRepositories()
//    }
    
    func getTopSwiftRepositories() {
        fetchTopSwiftRepositories().done { result in
            self.presenter?.getTopSwiftRepositoriesDidEnd(with: .success(result))
        }.catch { error in
            self.presenter?.getTopSwiftRepositoriesDidEnd(with: .failure(error))
        }
    }
    
    /// Get Github Repositories base on the following:
    /// - language:swift (q) => get by Swift language only
    /// - stars (sort) => sort by stars
    /// - desc (order) => order by the highest to the lowest (stars)
    /// - 10 (per_page) => get only 10 repositories by single request
    private func fetchTopSwiftRepositories() -> Promise<BaseResponse<[GithubRepo]>> {
        return ApiManager.get(
            url: Routes.repositoriesSearch,
            parameters: [
                "q": "language:swift",
                "sort": "stars",
                "order": "desc",
                "per_page": 10
            ]
        )
    }
}

extension HomeInteractor: HomeInteractorProtocol {
    
}
