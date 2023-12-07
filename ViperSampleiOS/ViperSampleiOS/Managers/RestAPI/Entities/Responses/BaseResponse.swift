//
//  BaseResponse.swift
//  TopSwifts
//
//  Created by Dasser Basyouni on 07/12/2023.
//

struct BaseResponse<T: Codable>: Codable {
    let items: T
}

