//
//  main.swift
//  SearchingforLove
//
//  Created by Urja Desai on 01/03/22.
//

import Foundation

//By default true to repeat the condition
var valid = true
repeat
{
    print("Hello..!! Welcome to Searching For Love Game")
    print("What will you do")
    print("1. Search for Astrid")
    print("2. Rescue Astrid")
    print("3. Quit")
    let selection = Int(readLine()!)
    switch (selection) {
        case 1:
            print("Searching for Astrid....")
        let p1 = Locations(nameOfMonster: "Abc", power: 1.2, locationname: "xyz", abilityToAttack: 2.2 ,damageTaken: 0, healthPoint: 100)
        print(p1.name)

        p1.takeDamage(amt: 20)
        print(p1.attack())
            
        case 2:
            print("Rescuing Astrid....")
            
        case 3:
            print("bye")
            valid = false // make it false to close the game
            break
        default:
            print("Invalid selection, try again.")
    }
}while(valid == true)


