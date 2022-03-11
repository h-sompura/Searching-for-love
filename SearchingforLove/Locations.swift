//
//  Locations.swift
//  SearchingforLove
//
//  Created by Urja Desai on 03/03/22.
//

import Foundation



class Locations : Monsters
{
    var locationName = ""
    
    init( nameOfMonster : String , power : Double ,locationname : String, abilityToAttack : Double  , damageTaken : Double , healthPoint : Double)
    {
        super.init()
        super.name = nameOfMonster
        super.attackPower = power
        super.maxHealthPoint = healthPoint
        super.abilityToAttack = abilityToAttack
        super.damageTaken = damageTaken
        self.locationName = locationname
    
    }
}
