//
//  Heroes.swift
//  SearchingforLove
//
//  Created by Urja Desai on 02/03/22.
//

import Foundation


import Foundation

class Hero : GameCharacter {
    let weaponStrength : Int
    var abilityToSneak : Bool

    override init(name:String) {
        self.abilityToSneak = false
        self.weaponStrength = Int.random(in: 35..<40) //we are being biased by giving our hero more weapon strength
        super.init(name: name)
        super.damageDealt = self.weaponStrength // since a hero can deal a damage of the weapon strength they are occupied with
    }

}
