import Foundation

class Monster: GameCharacter {
  let attackPower: Int

  override init(name: String) {
    self.attackPower = Int.random(in: 0..<15)  // less damage power to the monster --> a biased decision to make hero win
    super.init(name: name)
    super.maxHealthPoints = Int.random(in: 20..<30)  //giving less HP to Monsters
    super.damageDealt = attackPower  // since a monster can deal a damage of attackPower they have
  }

}
