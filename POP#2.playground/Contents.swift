import UIKit

// Перед тем как делать, можно посмотреть вот это. Своеобразное введение в protocol oriented programming
// https://www.raywenderlich.com/6742901-protocol-oriented-programming-tutorial-in-swift-5-1-getting-started
// Но если любите по харду, то можете начать сами, а потом посмотреть.))


// Если вам будет лень придумывать героев, вот ссылка на их источник
//https://liquipedia.net/warcraft/Races

// Задание #1 (обязательно)
// Перепишите из OOP->POP
// Попробуйте использовать Traint/Mexin
// По желанию можно выполнить необязательные задания

// Совет:
// Предлагаю использовать ульту(способность) героев в виде Enum при проектировании
//enum AttakStyle: String {
//    case melee = "melee attak!"
//    case longRange = "long range attak!"
//}

// Задание №2 (необязательно)
// Добавьте Гильдию. Мы можем это использовать, чтобы ненужно было создавать отдельную структуру под Orc
//enum GuildType {
//    case aliance
//    case orc
//}

// Задание №3 (необязательно)
// Добавьте свой-во currentPosition: CGPoint. Теперь Героев можно передвигать и при этом у них будет меняться currentPosition. Дороботайте для этого функцию move()

// Задание №4 (необязательно)
// Добавьте возможность героям летать. func fly(to point: CGPoint)


// Далее Задание №5 (необязательно)
// Подходите к заданию творчески, используйте свой функционал, придумывайте его не надо стесняться)))
// 5.1 Создайте свои структуры со своими героями и положите их в массив.
// 5.2 Отсортируйте массивы с героями отделяя Орду от Альянса.
// 5.3 Отсортируйте по мощности атаки attackPower
// 5.4 Найдите самого сильного в массиве (attackPower) или того у кого больше всего mana

// Задание №6 (необязательно)
// Придумайте как можно использовать Dictionary для хранения героев
// Используйте пример из презы_)

enum AttackStyle: String {
    case melee = "melee attak!"
    case longRange = "long range attak!"
}

enum GuildType {
    case alliance
    case orc
}

protocol Playable: Movable {
    var attackStyle: AttackStyle { get }

    func attack()
    
    func ultimate()
}

extension Playable {
    func attack() {
        print(attackStyle.rawValue)
    }
    
    func ultimate() {
        print("Ultimate")
    }
}

protocol Movable {
    var currentPosition: CGPoint { get set }

    mutating func move(by stepCount: CGPoint)
    
    mutating func fly(to point: CGPoint)

    func stop()
}

extension Movable {
    mutating func move(by stepCount: CGPoint) {
        currentPosition.x += stepCount.x
        currentPosition.y += stepCount.y
    }
    
    mutating func fly(to point: CGPoint) {
        currentPosition = point
    }
    
    func stop() {
        print("Stop")
    }
}

struct Hero: Playable, CustomStringConvertible {
    typealias Statistics = (armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)
    
    private(set) var name: String?
    private(set) var armor: Float?
    private(set) var attackPower: Float?
    private(set) var strength: Float?
    private(set) var agility: Float?
    private(set) var intelligence: Float?
    private(set) var hitPoints: Float?
    private(set) var mana: Float?
    private(set) var guildType: GuildType
    private(set) var attackStyle: AttackStyle
    var currentPosition: CGPoint
    
    init(name: String, statistics: Statistics, guildType: GuildType, attackStyle: AttackStyle) {
        self.name = name
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.strength = statistics.strength
        self.agility = statistics.agility
        self.intelligence = statistics.intelligence
        self.hitPoints = statistics.hitPoints
        self.mana = statistics.mana
        self.guildType = guildType
        self.attackStyle = attackStyle
        self.currentPosition = .zero
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
    
    var description: String {
        "\(String(describing: name ?? "no name"))"
    }
}



let archmageStats = Hero.Statistics(armor: 3, attackPower: 21, strength: 14, agility: 17, intelligence: 19, hitPoints: 450, mana: 285)
let mountainKingStats = Hero.Statistics(armor: 2, attackPower: 26, strength: 24, agility: 11, intelligence: 15, hitPoints: 700, mana: 225)
let paladinStats = Hero.Statistics(armor: 4, attackPower: 24, strength: 22, agility: 13, intelligence: 17, hitPoints: 650, mana: 255)
let blademasterStats = Hero.Statistics(armor: 5, attackPower: 24, strength: 18, agility: 22, intelligence: 16, hitPoints: 550, mana: 240)
let shadowHunterStats = Hero.Statistics(armor: 4, attackPower: 22, strength: 15, agility: 20, intelligence: 17, hitPoints: 475, mana: 255)

var archmage = Hero(name: "Archmage", statistics: archmageStats, guildType: .alliance, attackStyle: .longRange)
var mountainKing = Hero(name: "Mountain King", statistics: mountainKingStats, guildType: .alliance, attackStyle: .melee)
var paladin = Hero(name: "Paladin", statistics: paladinStats, guildType: .alliance, attackStyle: .melee)
var blademaster = Hero(name: "Blademaster", statistics: blademasterStats, guildType: .orc, attackStyle: .melee)
var shadowHunter = Hero(name: "Shadow Hinter", statistics: shadowHunterStats, guildType: .orc, attackStyle: .longRange)

archmage.currentPosition
archmage.fly(to: CGPoint(x: 2, y: 1))
archmage.move(by: CGPoint(x: 20, y: 10))
archmage.currentPosition

var heroes: [Hero] = [archmage, mountainKing, paladin, blademaster, shadowHunter]

for hero in heroes {
    hero.attack()
}

print(heroes.filter{ $0.guildType == .alliance })

print(heroes.filter{ $0.guildType == .orc })

print(heroes.sorted{ $0.attackPower ?? 0.0 > $1.attackPower ?? 0.0 })

print(heroes.max{ $0.mana ?? 0.0 < $1.mana ?? 0.0 }!)
