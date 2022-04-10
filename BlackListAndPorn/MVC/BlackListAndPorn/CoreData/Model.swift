//
//  Model.swift
//  BlackListAndPorn
//
//  Created by Suren Kazaryan on 23.03.2022.
//

import Foundation

struct Model {
    var headerNames: String
    var isOpened = true
    var cellCards: [CardModel]?
}

struct CardModel {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
