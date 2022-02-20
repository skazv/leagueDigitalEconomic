import UIKit

// MARK: ЗАДАНИЕ 1
// Написать код, где можно будет сравнивать перечисления.
// Где перечисления могут быть =>, >, <=, < исходя из rating и их названия самого перечисления


enum LessonType {
    case math(rating: Int)
    case ntiveLanguage(rating: Int)
    case computerSince(rating: Int)
    case literature(rating: Int)
}

// Мой гавнокод V 1.1
extension LessonType: Comparable {
    static func > (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case let (.math(a), .math(b)),
            let (.ntiveLanguage(a), .ntiveLanguage(b)),
            let (.computerSince(a), .computerSince(b)),
            let (.literature(a), .literature(b)):
            return a > b
        default:
            return false
        }
    }
    
    static func < (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case let (.math(a), .math(b)),
            let (.ntiveLanguage(a), .ntiveLanguage(b)),
            let (.computerSince(a), .computerSince(b)),
            let (.literature(a), .literature(b)):
            return a < b
        default:
            return false
        }
    }
    
    static func >= (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case let (.math(a), .math(b)),
            let (.ntiveLanguage(a), .ntiveLanguage(b)),
            let (.computerSince(a), .computerSince(b)),
            let (.literature(a), .literature(b)):
            return a >= b
        default:
            return false
        }
    }
    
    static func <= (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case let (.math(a), .math(b)),
            let (.ntiveLanguage(a), .ntiveLanguage(b)),
            let (.computerSince(a), .computerSince(b)),
            let (.literature(a), .literature(b)):
            return a <= b
        default:
            return false
        }
    }
    
}

// MARK: ЗАДАНИЕ 2
// Реализуйте протокол Equitable у LessonType

extension LessonType: Equatable {
    static func == (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case let (.math(a), .math(b)),
            let (.ntiveLanguage(a), .ntiveLanguage(b)),
            let (.computerSince(a), .computerSince(b)),
            let (.literature(a), .literature(b)):
            print("E")
            return a == b
        default:
            return false
        }
    }
}
