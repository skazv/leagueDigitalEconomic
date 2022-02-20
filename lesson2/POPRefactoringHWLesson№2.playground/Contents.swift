import UIKit

// MARK: - ЗАДАНИЕ 1
// Перепишите из OOP->POP
// Попробуйте использовать Traint/Mexin

protocol AllianceProtocol {
    typealias Statistics = (armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)

    var armor: Float? {get set}
    var attackPower: Float? {get set}
    var strength: Float? {get set}
    var agility: Float? {get set}
    var intelligence: Float? {get set}
    var hitPoints: Float? {get set}
    var mana: Float? {get set}

    func attack()
    func move()
    func stop()
    mutating func updateStatistics(_ statistics: Statistics)
    func ultimate()
    func info()
}

enum AttakStyle: String {
    case melee = "melee attak!"
    case longRange = "long range attak!"
}

extension AllianceProtocol {

     mutating func updateStatistics(_ statistics: Statistics) {
            self.armor = statistics.armor
            self.attackPower = statistics.attackPower
            self.strength = statistics.strength
            self.agility = statistics.agility
            self.intelligence = statistics.intelligence
            self.hitPoints = statistics.hitPoints
            self.mana = statistics.mana
        }
    
    func info() {
           print("\(String(describing: self))")
       }

    func attack() {
        print("attack")
    }

    func move() {
        print("move")
    }

    func stop() {
        print("stop")
    }
}

struct Archmage: AllianceProtocol {

    init(statistics: Statistics) {
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.strength = statistics.strength
        self.agility = statistics.agility
        self.intelligence = statistics.intelligence
        self.hitPoints = statistics.hitPoints
        self.mana = statistics.mana
    }

    var armor: Float?
    var attackPower: Float?
    var strength: Float?
    var agility: Float?
    var intelligence: Float?
    var hitPoints: Float?
    var mana: Float?

    func attack() {
        print(AttakStyle.longRange.rawValue)
    }

    func ultimate() {
        print("Avatar")
    }
}

struct MountainKing: AllianceProtocol {
    var armor: Float?
    var attackPower: Float?
    var strength: Float?
    var agility: Float?
    var intelligence: Float?
    var hitPoints: Float?
    var mana: Float?
    
    func attack() {
        print(AttakStyle.melee.rawValue)
    }

    func ultimate() {
        print("Mass Teleport")
    }
}

var x = AllianceProtocol.Statistics(armor: 31.0, attackPower: 3.0, strength: 14.0, agility: 17.0, intelligence: 19.0, hitPoints: 450, mana: 285)
var archimag = Archmage(statistics: x)

archimag.info()
archimag.attack()



