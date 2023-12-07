// 
//  HomeViewController.swift
//  TopSwifts
//
//  Created by Blink22 on 06/12/2023.
//

import UIKit
import Foundation

final class HomeViewController: UIViewController {
    
    // Table view to display repositories
    @IBOutlet weak var repositoriesTableview: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    internal var presenter: HomeViewToPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
        presenter.loadData()
    }
    
}

// MARK: - Extension: HomeViewProtocol
extension HomeViewController: HomeViewProtocol {
    
    func dataDidLoaded(data: [GithubRepo]) {
        activityIndicatorView.stopAnimating()
        repositoriesTableview.reloadData()

    }
    
    func displayError(error: Error) {
        activityIndicatorView.stopAnimating()
        showError(error: error.localizedDescription, title: "Error")
    }
    
}

// MARK: - Extension for Respositroies TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: RepositoryTableViewCell.Constants.CellIdentifier,
                                  bundle: nil)
        repositoriesTableview.register(textFieldCell,
                                forCellReuseIdentifier: RepositoryTableViewCell.Constants.CellIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getReposCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.Constants.CellIdentifier) as? RepositoryTableViewCell {
            let repoData = presenter.getRepo(index: indexPath.row)
            cell.bindData(repo: repoData)
            return cell
        }
        
        return UITableViewCell()
    }
    
}
