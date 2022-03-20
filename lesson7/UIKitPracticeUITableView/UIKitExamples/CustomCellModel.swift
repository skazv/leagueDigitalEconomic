//
//  CustomCellModel.swift
//  UIKitExamples
//
//  Created by Александров Роман Витальевич on 10.03.2022.
//

import Foundation
import UIKit

enum Genre {
    case hipHop
    case classic
    case nevnyatnaya

    static func count() -> Int {
        return 3
    }

     static subscript(index: Int) -> String {
        switch index {
        case 0: return "Hip-Hop"
        case 1: return "Classic"
        case 2: return "Невнятная"
        default: return "Fuck up"
        }
    }
}

enum Rating {
    case one(Int)
    case two(Int)
    case three(Int)
    case fore(Int)
    case five(Int)
}

struct Songs {
    var isOpened: Bool
    let cells: [CustomCellModel]
}

struct CustomCellModel {
    let title: String
    let imageString: String
    let rating: Int
    
    init(title: String, imageString: String, rating: Int) {
        self.title = title
        self.imageString = imageString
        
        var correctRating = rating
        
        if !CustomCellModel.isValidRating(rating: rating) {
            correctRating = 0
        }
        
        self.rating = correctRating
    }
    
}

//MARK: - Private methods
extension CustomCellModel {
    private static func isValidRating(rating: Int) -> Bool {
        if rating >= 0 && rating <= 5 {
            return true
        }
        print("ERROR: Rating less than 0 or more than 5")
        return false
    }
}
