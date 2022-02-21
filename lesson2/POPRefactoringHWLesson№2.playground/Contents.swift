import UIKit
import Darwin

// MARK: - ЗАДАНИЕ 1
// Перепишите из OOP->POP
// Попробуйте использовать Traint/Mexin

protocol Movable {
    func move()
    func stop()
}

extension Movable {
    func move() {
        print("move")
    }
    
    func stop() {
        print("stop")
    }
}

protocol Attackable {
    func attack()
    var haveUltimate: Bool { get }
}

extension Attackable {
    func attack() {
        print("attack")
    }
    
    var haveUltimate: Bool { self is Ultimate }
}

protocol Ultimate {
    func ultimate()
}

protocol Stats {
    var stat: Statistic { get set }
    
    func info()
}

extension Stats {
    func info() {
        print("\(String(describing: self))")
    }
}

enum AttakStyle: String {
    case melee = "melee attak!"
    case longRange = "long range attak!"
}

struct Statistic {
    typealias Statistics = (armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)
    
    var armor: Float?
    var attackPower: Float?
    var strength: Float?
    var agility: Float?
    var intelligence: Float?
    var hitPoints: Float?
    var mana: Float?
    
    init(statistics: Statistics) {
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.strength = statistics.strength
        self.agility = statistics.agility
        self.intelligence = statistics.intelligence
        self.hitPoints = statistics.hitPoints
        self.mana = statistics.mana
    }
    
    mutating func updateStatistics(_ statistics: Statistics) {
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.strength = statistics.strength
        self.agility = statistics.agility
        self.intelligence = statistics.intelligence
        self.hitPoints = statistics.hitPoints
        self.mana = statistics.mana
    }
}

struct Archmage: Movable, Attackable, Stats, Ultimate {
    var stat: Statistic
    
    func attack() {
        print(AttakStyle.longRange.rawValue)
    }
    
    func ultimate() {
        print("Avatar")
    }
}

struct MountainKing: Movable, Attackable, Ultimate, Stats {
    var stat: Statistic
    
    func attack() {
        print(AttakStyle.melee.rawValue)
    }
    
    func ultimate() {
        print("Mass Teleport")
    }
}

struct AntiMage: Movable, Attackable, Ultimate, Stats {
    var stat: Statistic
    
    func attack() {
        print(AttakStyle.melee.rawValue)
    }
    func ultimate() {
        print("Mana void")
    }
    
}

var statistic = Statistic(statistics: (armor: 12.0, attackPower: 33.0, strength: 14.0, agility: 44.0, intelligence: 22.0, hitPoints: 850, mana: 285))
var antimage = AntiMage(stat: statistic)

antimage.attack()
antimage.info()
antimage.haveUltimate
