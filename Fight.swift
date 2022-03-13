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
class Fight {
    let playerHero: Hero
    let playerMonster:Monster
  //  var turn : Int = 1
    
    init(hero: Hero, monster:Monster) {
        self.playerHero = hero
        self.playerMonster = monster
        print(hero.name)
        print(monster.name)

    }
    
    private func applyDamage(from:GameCharacter, to:GameCharacter) {
        let attackDamage = from.damageDealt
        to.maxHealthPoints = to.maxHealthPoints - attackDamage
    }
    func performTurn(abc : action_perform , turn : Int ) {
        //TODO: assign action to characters
        switch(abc)
        {
        case .attack:
                if(turn == 1)
                {

                    self.applyDamage(from: self.playerHero, to: self.playerMonster)
                    
                }
            else
            {
                print("monster is attackinG")
                self.applyDamage(from: self.playerMonster, to: self.playerHero)
            }
        case .sneak:
                print("hero is sneaking")
            
        }
    }
}
