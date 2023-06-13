//
//  Repositories.swift
//  Repository-App
//
//  Created by Walid Ahmed on 13/06/2023.
//

import Foundation

struct Repos: Codable {
    var id: Int?
    var description, name: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
    }
}

