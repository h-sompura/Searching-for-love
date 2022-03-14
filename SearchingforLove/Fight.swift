import Foundation
enum action {
    case attack
    case sneak
}
class Fight:CustomStringConvertible {
    let playerHero:Hero
    let playerMonster:Monster
    let currentTurn: Int = 1
    
    init(hero:Hero, monster:Monster) {
        self.playerHero = hero
        self.playerMonster = monster
    }
    
    private func applyDamage(from:GameCharacter, to:GameCharacter) {
        let attackDamage = from.damageDealt
        to.maxHealthPoints = to.maxHealthPoints - attackDamage
    }
    func performTurn(kind:action) {
        //TODO: assign action to characters
    }
    private func characterHealthStatus(character:GameCharacter) -> String {
            return "\(character.name)'s HP: \(character.maxHealthPoints) \n"
    }
}

extension Fight {
    var description: String {
        get {
            return "Fight Begins! \n" +
            "\n" +
            "----TURN #\(self.currentTurn) ---- \n" +
            "> \(characterHealthStatus(character: playerHero))" +
            "> \(characterHealthStatus(character: playerMonster))" +
            "\n"
        }
    }
}
