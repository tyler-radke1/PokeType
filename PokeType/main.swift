import Cocoa
import Foundation

enum PokeType: String, CaseIterable {
    case normal = "Normal"
    case fire = "Fire"
    case water = "Water"
    case electric = "Electric"
    case grass = "Grass"
    case ice = "Ice"
    case fighting = "Fighting"
    case poison = "Poison"
    case ground = "Ground"
    case flying = "Flying"
    case psychic = "Psychic"
    case bug = "Bug"
    case rock = "Rock"
    case ghost = "Ghost"
    case dragon = "Dragon"
    case dark = "Dark"
    case steel = "Steel"
}

struct Resistances {
    let type: PokeType
    let noEffect: [PokeType]
    let notVeryEffective: [PokeType]
    let superEffective: [PokeType]
    
    init(type: PokeType, noEffect: [PokeType], notVeryEffective: [PokeType], superEffective: [PokeType]) {
        self.type = type
        self.noEffect = noEffect
        self.notVeryEffective = notVeryEffective
        self.superEffective = superEffective
    }
}

let normal = Resistances(type: .normal, noEffect: [.ghost], notVeryEffective: [.rock, .dark], superEffective: [])
let fire = Resistances(type: .fire, noEffect: [], notVeryEffective: [.fire, .water, .rock, .dragon], superEffective: [.grass, .ice, .bug, .steel])
let water = Resistances(type: .water, noEffect: [], notVeryEffective: [.fire, .grass, .dragon], superEffective: [.fire, .ground, .rock])

let electric = Resistances(type: .electric, noEffect: [.ground], notVeryEffective: [.electric, .grass, .dragon], superEffective: [.water, .flying])

let grass = Resistances(type: .grass, noEffect: [], notVeryEffective: [.fire, .grass, .poison, .flying, .bug, .dragon], superEffective: [.water, .ground, .rock])

let ice = Resistances(type: .ice, noEffect: [], notVeryEffective: [.fire, .water, .ice, .steel], superEffective: [.grass, .ground, .flying, .dragon])

let fighting = Resistances(type: .fighting, noEffect: [.ghost], notVeryEffective: [.poison, .flying, .psychic, .bug], superEffective: [.normal, .ice, .rock, .dark, .steel])

let poison = Resistances(type: .poison, noEffect: [.steel], notVeryEffective: [.poison, .ground, .rock, .ghost], superEffective: [.grass])

let ground = Resistances(type: .ground, noEffect: [.flying], notVeryEffective: [.grass, .bug], superEffective: [.fire, .electric, .poison, .rock, .steel])

let flying = Resistances(type: .flying, noEffect: [], notVeryEffective: [.electric, .rock, .steel], superEffective: [.grass, .bug, .fighting])

let psychic = Resistances(type: .psychic, noEffect: [.dark], notVeryEffective: [.psychic, .steel], superEffective: [.fighting, .poison])

let bug = Resistances(type: .bug, noEffect: [], notVeryEffective: [.fire, .fighting, .poison, .flying, .ghost, .steel], superEffective: [.grass, .psychic, .dark])

let rock = Resistances(type: .rock, noEffect: [], notVeryEffective: [.fighting, .ground, .steel], superEffective: [.fire, .ice, .flying, .bug])
let ghost = Resistances(type: .ghost, noEffect: [.normal], notVeryEffective: [.dark, .steel], superEffective: [.psychic, .ghost])

let dragon = Resistances(type: .dragon, noEffect: [], notVeryEffective: [.steel], superEffective: [.dragon])

let dark = Resistances(type: .dark, noEffect: [], notVeryEffective: [.fighting, .dark, .steel], superEffective: [.psychic, .ghost])

let steel = Resistances(type: .steel, noEffect: [], notVeryEffective: [.fire, .water, .electric, .steel], superEffective: [.ice, .rock])

let allResistances: [Resistances] = [
    normal, fire, water, electric, grass, ice, fighting, poison, ground, flying, psychic, bug, rock, ghost, dragon, dark, steel
]


func findOffensiveBuild() -> [PokeType] {
    var typesToUse: [PokeType] = []
    
    var typesAccountedFor: [PokeType] = []
    
    var addType = false
    for resistance in allResistances {
        print("\(resistance.type) is strong against \(resistance.superEffective.map({$0.rawValue}))")
        //For each resistance.superEffective, all elements can be added to typesAccountedFor
        
        for subType in resistance.superEffective {
            if !typesAccountedFor.contains(subType) {
                addType = true
                typesAccountedFor.append(subType)
            }
        }
        
        if addType {
            typesToUse.append(resistance.type)
            addType = false
        }
    }
    
    return typesToUse
}

print(findOffensiveBuild().map({ $0.rawValue }))


