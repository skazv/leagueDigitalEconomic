import UIKit

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
    typealias Statistics = (armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)
    
    var armor: Float? { get set }
    var attackPower: Float? { get set }
    var strength: Float? { get set }
    var agility: Float? { get set }
    var intelligence: Float? { get set }
    var hitPoints: Float? { get set }
    var mana: Float? { get set }
    
    mutating func updateStatistics(_ statistics: Statistics)
    
    func info()
}

extension Stats {
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
}

enum AttakStyle: String {
    case melee = "melee attak!"
    case longRange = "long range attak!"
}

struct Archmage: Movable, Attackable, Stats, Ultimate {
    
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
    var haveUltimate: Bool?
    
    func attack() {
        print(AttakStyle.longRange.rawValue)
    }
    
    func ultimate() {
        print("Avatar")
    }
}

struct MountainKing: Movable, Attackable, Ultimate, Stats {
    
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
        print(AttakStyle.melee.rawValue)
    }
    
    func ultimate() {
        print("Mass Teleport")
    }
}

struct AntiMage: Movable, Attackable, Ultimate, Stats {
    
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
        print(AttakStyle.melee.rawValue)
    }
    func ultimate() {
        print("Mana void")
    }
    
}

var statistic = Stats.Statistics(armor: 12.0, attackPower: 33.0, strength: 14.0, agility: 44.0, intelligence: 22.0, hitPoints: 850, mana: 285)

var antimage = AntiMage(statistics: statistic)

antimage.attack()
antimage.info()
antimage.haveUltimate




