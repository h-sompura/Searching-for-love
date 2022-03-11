//
//  Monsters.swift
//  SearchingforLove
//
//  Created by Urja Desai on 02/03/22.
//

import Foundation

class Monsters : GameCharacter
{
   
    override init(_ names: String) {
        super.init(names)
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
