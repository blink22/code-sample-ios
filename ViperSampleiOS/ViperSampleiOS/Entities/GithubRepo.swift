//
//  GithubRepo.swift
//  TopSwifts
//
//  Created by Blink22 on 06/12/2023.
//

struct GithubRepo: Codable {
    let name: String
    let description: String
    let starsCount: Int
    let language: String
    let forksCount: Int
    let owner: RepoOwner

    private enum CodingKeys: String, CodingKey {
        case name = "full_name"
        case description
        case starsCount = "stargazers_count"
        case language
        case forksCount = "forks_count"
        case owner
    }
}
