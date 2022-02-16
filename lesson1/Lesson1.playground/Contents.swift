import Foundation

protocol GoodGirlDetector {
    var name: String { get set }
    var age: Int { get set }
    var isMarried: Bool {get set}
    func sawingBrains () -> Bool
}

struct MyExGirlfreind: GoodGirlDetector {
    var name: String
    var age: Int
    var isMarried: Bool

    func sawingBrains() -> Bool {
        true
    }
}

struct OtherGirl: GoodGirlDetector {
    var name: String
    var age: Int
    var isMarried: Bool

    func sawingBrains() -> Bool {
        false
    }
}

let myEx = MyExGirlfreind(name: "Ksenya", age: 24, isMarried: false)
myEx.sawingBrains() //Если пилит мозги, то плохая девочка. Все мои бывшие пилили мозги.
