//
//  Monsters.swift
//  SearchingforLove
//
//  Created by Urja Desai on 02/03/22.
//

import Foundation

import Foundation

class Monster:GameCharacter
{
    let attackPower:Int
    
    override init(name: String) {
        self.attackPower = Int.random(in: 20..<30) // less damage power to the monster --> a biased decision to make hero win
        super.init(name: name)
        super.maxHealthPoints = Int.random(in: 75..<85) //giving less HP to Monsters
        super.damageDealt = attackPower // since a monster can deal a damage of attackPower they have
    }
    
}
