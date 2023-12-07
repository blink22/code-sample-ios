//
//  RepositoryTableViewCell.swift
//  TopSwifts
//
//  Created by Blink22 User on 07/12/2023.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    enum Constants {
        static let CellIdentifier = "RepositoryTableViewCell"
    }
    
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var langaugeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var starsCountLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    
    func bindData(repo: GithubRepo?) {
        langaugeLabel.text = repo?.language
        descriptionLabel.text = repo?.description
        ownerNameLabel.text = repo?.owner.name
        starsCountLabel.text = repo?.starsCount.formatted()
        forksCountLabel.text = repo?.forksCount.formatted()
    }
    
}
