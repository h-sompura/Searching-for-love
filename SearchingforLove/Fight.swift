import Foundation
enum action {
    case attack
    case sneak
}
class Fight {
    let playerHero:Hero
    let playerMonster:Monster
    
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
}
