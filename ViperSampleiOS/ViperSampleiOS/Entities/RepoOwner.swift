//
//  RepoOwner.swift
//  TopSwifts
//
//  Created by Dasser Basyouni on 07/12/2023.
//

struct RepoOwner: Codable {
    let name: String

    private enum CodingKeys: String, CodingKey {
        case name = "login"
    }
}
