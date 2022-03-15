import Foundation

enum action {
  case attack
  case sneak
  case runAway
}
class Fight: CustomStringConvertible {
  let playerHero: Hero
  let playerMonster: Monster
  var turn: Int = 1
  var currentPlayer: String

  init(hero: Hero, monster: Monster) {
    self.playerHero = hero
    self.playerMonster = monster
    self.currentPlayer = hero.name
  }

  private func applyDamage(from: GameCharacter, to: GameCharacter) {
    if to.maxHealthPoints > 0 {
      let attackDamage = from.attack()
      print("> \(from.name) attacks: \(attackDamage) damage")
      to.maxHealthPoints = to.maxHealthPoints - attackDamage
    }
  }
  
    private func calculateCriticalHit() -> Int {
        let randomPercentage = Double.random(in: 0.0...1)
        if(randomPercentage < 0.3){
            print("> Critical Hit ***")
            return playerHero.damageDealt*(Int(Double(playerHero.damageDealt)*0.2))
        }
        return playerHero.damageDealt
    }
    
    private func calculateMissDamage() -> Int{
        let randomPercentage = Double.random(in: 0.0...1)
        if(randomPercentage < 0.2){
            print("> \(playerMonster.name) misses ***")
            playerMonster.damageDealt = 0
            return playerMonster.damageDealt
        }
        return playerMonster.damageDealt
    }
    
  func performTurn(kind: action) {
    //assign action to characters
    switch kind
    {
    case .attack:
      if currentPlayer.contains(playerHero.name) {
        let heroDamageDealt = calculateCriticalHit()
        playerHero.damageDealt = heroDamageDealt
        
        applyDamage(from: playerHero, to: playerMonster)
        currentPlayer = playerMonster.name
        turn += 1
      } else {
        //monster is the current player
        let monsterDamageDealt = calculateMissDamage()
        playerMonster.damageDealt = monsterDamageDealt
        applyDamage(from: playerMonster, to: playerHero)
        currentPlayer = playerHero.name
        turn += 1
      }
    case .runAway:
        print("> You gave up on saving Astrid \n\n")
    default:
      print("something else is happening")
    }
  }
  private func characterHealthStatus(character: GameCharacter) -> String {
    return "\(character.name)'s HP: \(character.maxHealthPoints)/\(character.maxHealthPoints) \n"
  }
}

extension Fight {
  var description: String {
    if playerMonster.maxHealthPoints > 0 {
      return "\n" + "----TURN #\(turn) ---- \n" + "> Current Turn: \(currentPlayer) \n"
        + "> \(characterHealthStatus(character: playerHero))"
        + "> \(characterHealthStatus(character: playerMonster))" + "\n"
    }
    return "\n"
  }
}
