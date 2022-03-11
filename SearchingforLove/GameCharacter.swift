//
//  GameCharacter.swift
//  SearchingforLove
//
//  Created by Urja Desai on 02/03/22.
//

import Foundation


class GameCharacter
{
    var name  = ""
    var maxHealthPoint = 100.0
    var abilityToAttack = 0.0
    var damageTaken = 0.0
    
    
    func takeDamage(amt : Double)
    {
        self.maxHealthPoint = maxHealthPoint - amt ;
        damageTaken = damageTaken + amt;
    }
    
    func attack() -> Double
    {
        return damageTaken
    }
    
}
