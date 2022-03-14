import Foundation
enum action {
    case attack
    case sneak
    case runAway
}
class Fight:CustomStringConvertible {
    let playerHero:Hero
    let playerMonster:Monster
    let turn:Int = 1
    
    init(hero:Hero, monster:Monster) {
        self.playerHero = hero
        self.playerMonster = monster
    }
    
    private func applyDamage(from:GameCharacter, to:GameCharacter) {
        let attackDamage = from.damageDealt
        print("> \(from.name) attacks: \(attackDamage) damage")
        to.maxHealthPoints = to.maxHealthPoints - attackDamage
    }
    func performTurn(kind:action) {
        //assign action to characters
        switch(kind)
        {
        case .attack:
            applyDamage(from: playerHero, to: playerMonster)
        default:
            print("something else is happening")
        }
    }
    private func characterHealthStatus(character:GameCharacter) -> String {
        return "\(character.name)'s HP: \(character.maxHealthPoints)/\(character.maxHealthPoints) \n"
    }
}

extension Fight {
    var description: String {
        get {
            return "\n" +
            "----TURN #\(turn) ---- \n" +
            "> \(characterHealthStatus(character: playerHero))" +
            "> \(characterHealthStatus(character: playerMonster))" +
            "\n"
        }
    }
}
