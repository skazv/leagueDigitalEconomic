//
//  BlackListModel.swift
//  BlackList
//
//  Created by Suren Kazaryan on 26.03.2022.
//

import Foundation

enum HeaderNames: String {
    case exGirls = "Бывшие"
    case debtors = "Должники"
    case miyagiHaters = "Не любят Miyagi"
    case bithday = "Не пришласившие на ДР"
}

struct BlackList {
    subscript(index: Int) -> String {
        switch index {
        case 0: return HeaderNames.exGirls.rawValue
        case 1: return HeaderNames.debtors.rawValue
        case 2: return HeaderNames.miyagiHaters.rawValue
        case 3: return HeaderNames.bithday.rawValue
        default:
            print("ERROR")
            return "ERROR"
        }
    }
}
