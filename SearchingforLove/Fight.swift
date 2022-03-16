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
  var isFightOver: Bool
  var winner: String

  init(hero: Hero, monster: Monster) {
    self.playerHero = hero
    self.playerMonster = monster
    self.currentPlayer = hero.name
    self.winner = monster.name
    self.isFightOver = false
    //reset HP
    self.playerHero.maxHealthPoints = playerHero.finalMaxHP
    self.playerMonster.maxHealthPoints = playerMonster.maxHealthPoints
  }

  private func applyDamage(from: GameCharacter, to: GameCharacter) {
    if to.maxHealthPoints > 0 {
      let attackDamage = from.attack()
      print("> *** \(from.name) attacks: \(attackDamage) damage! ***")
      to.maxHealthPoints = to.maxHealthPoints - attackDamage
    } else {
      winner = from.name
    }
  }

  func checkIfCharacterDied(_ character: GameCharacter) -> Bool {
    if character.maxHealthPoints <= 0 {
      return true
    }
    return false
  }

  private func calculateCriticalHit() -> Int {
    let randomPercentage = Int.random(in: 1...10)
    if randomPercentage <= 3 {
      print("> *** Critical Hit ***")
      let damage = Double(playerHero.damageDealt) * 0.2
      return Int(damage) + playerHero.damageDealt
    }
    return playerHero.damageDealt
  }

  private func calculateMissDamage() -> Int {
    let randomPercentage = Int.random(in: 1...10)
    if randomPercentage <= 2 {
      print("> *** \(playerMonster.name) misses ***")
      playerMonster.damageDealt = 0
      return playerMonster.damageDealt
    }
    return playerMonster.damageDealt
  }

  func performTurn(kind: action) -> Bool {
    //assign action to characters
    isFightOver = false
    switch kind
    {
    case .attack:
      if currentPlayer.contains(playerHero.name) {
        let heroDamageDealt = calculateCriticalHit()
        playerHero.damageDealt = heroDamageDealt
        applyDamage(from: playerHero, to: playerMonster)
        isFightOver = checkIfCharacterDied(playerMonster)
        currentPlayer = playerMonster.name
        turn += 1
        winner = playerHero.name
      } else {
        //monster is the current player
        let monsterDamageDealt = calculateMissDamage()
        playerMonster.damageDealt = monsterDamageDealt
        applyDamage(from: playerMonster, to: playerHero)
        isFightOver = checkIfCharacterDied(playerHero)
        currentPlayer = playerHero.name
        turn += 1
      }
    case .sneak:
      print("> *** \(playerHero.name) is sneaking ***")
      let randomPercentage = Int.random(in: 1...10)
      if randomPercentage <= 3 {
        self.playerHero.abilityToSneak = true
        self.playerMonster.maxHealthPoints = 0
        print("> *** \(playerHero.name) successfully sneaked past \(playerMonster.name)")
        isFightOver = true
        winner = playerHero.name
      } else {
        self.playerHero.abilityToSneak = false
        print(
          "> \(playerHero.name), you were not able to sneak past \(playerMonster.name)")
        print("> *** \(playerMonster.name) gobbled you up! You LOSE *** ")
        isFightOver = false
        self.playerHero.maxHealthPoints = 0
      }
    case .runAway:
      print("> *** You gave up on searching for your love! You LOSE *** \n")
      isFightOver = true
    }
    return isFightOver
  }
  private func characterHealthStatus(character: GameCharacter) -> String {
    return "\(character.name)'s HP: \(character.maxHealthPoints)/\(character.finalMaxHP) \n"
  }

  func finalFightStats() -> String {
    return "> *** Phew, the fight is over! *** \n" + "> Final Stats: \n"
      + "> \(characterHealthStatus(character: playerHero))"
      + "> \(characterHealthStatus(character: playerMonster))" + "> Winner is: \(winner) \n"
  }
}

extension Fight {
  var description: String {
    if playerMonster.maxHealthPoints > 0 && playerMonster.maxHealthPoints > 0 {
      return "\n" + "----TURN #\(turn) ---- \n" + "> Current Turn: \(currentPlayer) \n"
        + "> \(characterHealthStatus(character: playerHero))"
        + "> \(characterHealthStatus(character: playerMonster))" + "\n"
    }
    return "\n"
  }
}

