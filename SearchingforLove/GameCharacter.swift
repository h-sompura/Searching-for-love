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
    var maxHealthPoint = 0
    var abilityToAttack = 0
    var damageTaken = 0
    
    
    init(_ name : String)
    {
        self.name = name

    }
    
    func takeDamage(amt : Int)
    {
        
    }
    
    func attack() -> Int
    {
        return 0
    }
    
}
