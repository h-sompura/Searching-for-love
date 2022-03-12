import Foundation

class Monster:GameCharacter
{
   
    override init(name: String) {
        super.init(name: name)
        super.maxHealthPoint = Int.random(in: 30..<50)
        super.abilityToAttack = Int.random(in: 20..<25)
    }
   
    override func takeDamage(amt: Int) {
        self.maxHealthPoint = maxHealthPoint - amt
        self.damageTaken = damageTaken + amt
    }
    override func attack() -> Int {
        return self.damageTaken
    }
}
