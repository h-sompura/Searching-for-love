//
//  Fight.swift
//  SearchingforLove
//
//  Created by Urja Desai on 04/03/22.
//

import Foundation

import Foundation
enum action_perform {
    case attack
    case sneak
}
class Fight : CustomStringConvertible{
   
    
    let playerHero: Hero
    let playerMonster:Monster
    var turn : Int = 1
    
    init(hero: Hero, monster:Monster) {
        self.playerHero = hero
        self.playerMonster = monster
        //self.turn = 1


    }
    
    private func applyDamage(from:GameCharacter, to:GameCharacter) {
        let attackDamage = from.damageDealt
        to.maxHealthPoints = to.maxHealthPoints - attackDamage
        
    }
    func performTurn(abc : action_perform ) {
        //TODO: assign action to characters
        switch(abc)
        {
        case .attack:
            if(self.turn == 1)
                {
                    self.applyDamage(from: self.playerHero, to: self.playerMonster)
                    
                }
            else
            {
                self.applyDamage(from: self.playerMonster, to: self.playerHero)
                //self.turn = 1
            }
        case .sneak:
                print("hero is sneaking")
            
        }
    }
}

extension Fight
{
    var description: String {
            var turn = ""
            if(self.turn == 1)
            {
                turn = "Current Turn is :\(self.playerHero.name)"
                return "\(turn), \n  \(self.playerHero.name)'s Health Point : \(self.playerHero.maxHealthPoints) \n \(self.playerMonster.name)'s health point \(self.playerMonster.maxHealthPoints)  "

            }
            else
            {
                turn = "Current Turn is :\(self.playerMonster.name)"
                return "\(turn), \n  \(self.playerHero.name)'s Health Point : \(self.playerHero.maxHealthPoints) \n \(self.playerMonster.name)'s health point \(self.playerMonster.maxHealthPoints)  "

                
            }
       
       
       }
}
