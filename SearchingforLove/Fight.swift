import Foundation
enum action {
    case attack
    case sneak
    case runAway
}
class Fight:CustomStringConvertible {
    let playerHero:Hero
    let playerMonster:Monster
    var turn:Int = 1
    var currentPlayer:String
    
    init(hero:Hero, monster:Monster) {
        self.playerHero = hero
        self.playerMonster = monster
        self.currentPlayer = hero.name
    }
    
    private func applyDamage(from:GameCharacter, to:GameCharacter) {
        if(to.maxHealthPoints > 0){
        let attackDamage = from.damageDealt
        print("> \(from.name) attacks: \(attackDamage) damage")
        to.maxHealthPoints = to.maxHealthPoints - attackDamage
        }
    }
    func performTurn(kind:action) {
        //assign action to characters
        switch(kind)
        {
        case .attack:
            if(currentPlayer.contains(playerHero.name)){
                applyDamage(from: playerHero, to: playerMonster)
                currentPlayer = playerMonster.name
                turn += 1
            } else {
                //monster attacks
                applyDamage(from: playerMonster, to: playerHero)
                currentPlayer = playerHero.name
                turn += 1
            }
            
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
            if(playerMonster.maxHealthPoints > 0){
                return "\n" +
                "----TURN #\(turn) ---- \n" +
                "> Current Turn: \(currentPlayer) \n" +
                "> \(characterHealthStatus(character: playerHero))" +
                "> \(characterHealthStatus(character: playerMonster))" +
                "\n"
            }
            return "\n"
        }
    }
}
