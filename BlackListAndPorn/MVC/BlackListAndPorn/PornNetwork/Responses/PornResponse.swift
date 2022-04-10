//
//  PornResponse.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 05.04.2022.
//

import Foundation

struct PornResponse: Responsable {
    let result: PornRaw
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(PornRaw.self)
        result = value
    }
}
