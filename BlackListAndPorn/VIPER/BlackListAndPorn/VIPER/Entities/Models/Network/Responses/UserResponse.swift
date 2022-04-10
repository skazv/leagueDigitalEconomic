//
//  ResulListResponse.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 02.04.2022.
//

import Foundation

struct UserResponse: Responsable {
    let results: UsersRaw
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(UsersRaw.self)
        results = value
    }
}
