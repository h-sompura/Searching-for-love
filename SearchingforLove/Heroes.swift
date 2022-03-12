import Foundation


class Heroes : GameCharacter
{
    var weaponStrength : Int
    var abilityToSneak : Double
    
     init() {
        self.abilityToSneak = 0.30
         self.weaponStrength = Int.random(in: 40..<60)
        super.init("Hugie")
         super.maxHealthPoint = 100
    }
    override func takeDamage(amt: Int) {
        self.maxHealthPoint = maxHealthPoint - amt
        self.damageTaken = damageTaken + amt
    }
    override func attack() -> Int {
        return self.damageTaken
    }
}
