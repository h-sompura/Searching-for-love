import Foundation

class GameCharacter: CustomStringConvertible {
  let name: String
  var maxHealthPoints: Int
  var damageDealt: Int
  final var finalMaxHP:Int

  init(name: String) {
    self.name = name
    self.maxHealthPoints = 50
    self.damageDealt = 25
    self.finalMaxHP = maxHealthPoints
  }

  func takeDamage(amount: Int) {
    self.maxHealthPoints = self.maxHealthPoints - amount
  }

  func attack() -> Int {
    return self.damageDealt
  }

}
extension GameCharacter {
  var description: String {
    return "\(name)"
  }
}

