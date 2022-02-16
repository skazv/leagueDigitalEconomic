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

struct Suren {
    
    func isGirlGood(girl: GoodGirlDetector) -> Bool {
        if girl.sawingBrains() {
            print("бывшая \(girl.name) не подходит, потому, что пилит мозги")
            return false
        }
        print("\(girl.name) подходит, нужно пробовать")
        return true
    }
}

let myEx = MyExGirlfreind(name: "Ксения", age: 24, isMarried: false)
let myNew = OtherGirl(name: "Виктория", age: 25, isMarried: false)
let me = Suren()
me.isGirlGood(girl: myEx) // бывшая Ксения не подходит, потому, что пилит мозги
me.isGirlGood(girl: myNew) // Виктория подходит, нужно пробовать
