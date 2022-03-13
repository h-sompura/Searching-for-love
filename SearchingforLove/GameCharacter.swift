import Foundation
class GameCharacter
{
    let name:String
    var maxHealthPoints:Int
    var damageDealt:Int

    init(name:String) {
        self.name = name
        self.maxHealthPoints = 100
        self.damageDealt = 25
    }

    func takeDamage(amount : Int) {
        self.maxHealthPoints = self.maxHealthPoints - amount
    }
    
    func attack() -> Int {
        return self.damageDealt
    }
    
}