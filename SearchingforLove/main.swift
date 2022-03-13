//
//  main.swift
//  SearchingforLove
//
//  Created by Urja Desai on 01/03/22.
//

import Foundation

//creating Hero Hugie
var turn = 1
let gameHero = Hero(name: "Hugie")
print("-------------------------------")
print("") //intro for the game
print("> \(gameHero.name), it is the day before your wedding. You are very much excited to be getting married to the love of your life, Astrid.")
print("  But wait... a little birdy informs you that an evil wizard has kidnapped Astrid and fled to a castle somewhere far away and unknown.")
print("")
print("> Do not worry though! We will help in your quest to save Astrid.")
print("> We dropped a map next to you which will help with searching for Astrid.")
print("> Remember! This world is full of monsters which you have to defeat to move forward.")
print("> Good luck, \(gameHero.name). We hope you succeed in searching for your love! :) ")
print("")
print("-------------------------------")


//creating Monsters
let monstersList = [
    Monster(name: "Mistflayer"),
    Monster(name: "Glowtalon"),
    Monster(name: "Brinesword"),
    Monster(name: "Acidchild"),
    Monster(name: "Fetidbrute")
]

//creating a list of locations
let locationsList = [
    Location(locationName: "Ithaca", monster: monstersList[0]),
    Location(locationName: "Sparta", monster: monstersList[1]),
    Location(locationName: "Argos", monster: monstersList[2]),
    Location(locationName: "Mycanae", monster: monstersList[3]),
    Location(locationName: "Athens", monster: monstersList[4]),
]

//creating a list of roads
let roadsList = [
    Road(startingLocation: "Ithaca", endingLocation: "Sparta", roadType: roadType.Mountainous),
    Road(startingLocation: "Sparta", endingLocation: "Argos", roadType: roadType.Paved),
    Road(startingLocation: "Sparta", endingLocation: "Mycanae", roadType: roadType.Swampy),
    Road(startingLocation: "Argos", endingLocation: "Athens", roadType: roadType.Mountainous),
    Road(startingLocation: "Mycanae", endingLocation: "Athens", roadType: roadType.Paved),
    Road(startingLocation: "Athens", endingLocation: "Athens",roadType: roadType.Paved), //could we change ending to string optional here??***
]

//creating a map using locations list and roads list with placing Astrid on the map
let astridOnMap:String? = "Athens"
let map = Map(locations: locationsList, roads: roadsList, placeAstrid:astridOnMap)
printLineSeperator()
map.printMap()

var isAstridFound:Bool = false
var isAstridRescued:Bool = false
var valid = true //By default true to repeat the condition
var searchCaseString = "Search for Astrid"
var resuceCaseString = "Rescue Astrid"
printLineSeperator()
repeat
{
    print("> What will you do?")
    if(isSearched == true)
    {
    print("\t 1. Search for Astrid" + "[Complete!]")
    }
    print("\t 1. \(searchCaseString)")
    print("\t 2. \(resuceCaseString)")
    print("\t 3. Quit")
    let selection = Int(readLine()!)
    switch (selection) {
        case 1:
            print("> Searching for Astrid....")
            isSearched = true
        case 2:
            var giveUp = true
            print("Rescuing Astrid....")
            if(isSearched)
            {
                print("> Starting quest")
                print("> Generating the easiest path to Astrid...")
                //this prints the easiest path
                let path = map.takeJourney(startingLocation: "Ithaca", endingLocation: astridOnMap!)
                print("> Path found. The easiest path to Astrid is: \(path)")
//                let m1 = Monsters(name: "Xyz")
                //print("main",m1.abilityToAttack)
                //print("main",m1.maxHealthPoint)
                //let l1 = Locations(locationName: "abc",monster: m1)
                // l1
                repeat
                {
                    print("Hugie, what move will you make?")
                    if(true)
                    {
                    print("1. Attack")
                    print("2. Sneak")
                    print("3. Give Up")
                    
                    let selection = Int(readLine()!)
                    switch(selection)
                        {
                            case 1:
                                print("Attack")
                                //gameHero.takeDamage(amt: m1.abilityToAttack)
                                print("Damage taken",gameHero.attack())
                                print(gameHero.maxHealthPoints)
                                //m1.takeDamage(amt: gameHero.weaponStrength)
                                //print(m1.attack())
                            case 2:
                                print("Sneak")
                            case 3:
                                giveUp = false
                                print("Monster wins..Hugie Gave up..!!")
                            default :
                                print("Default")
                        }
                        isAstridRescued = true //TODO: set this to true only if Hero wins
                        if(isAstridRescued){
                            resuceCaseString = "Rescue Astrid [COMPLETE!]"
                        }
                    }
                print("in while")
                if(turn == 1)
                {
                        f1.performTurn(abc: action_perform.attack, turn: 1)
                        print(f1.playerMonster.maxHealthPoints)
                        print(f1.playerHero.maxHealthPoints)
            
                }
                else
                {
                    f1.performTurn(abc: action_perform.attack, turn: 2)
                    print("max point in 2  ", f1.playerMonster.maxHealthPoints)
                    print("max point in 2 for hero",f1.playerHero.maxHealthPoints)
                    print("in else")
                    turn = 1
                }
                
                }
                
                
//                var m1 : Location?
//                for i in locationsList
//                {
//                    print("\(i)")
//                    print(i.monsters.maxHealthPoints)
//                    m1 = i
//                }
//                while(m1!.monsters.maxHealthPoints >= 0 && gameHero.maxHealthPoints >= 0)
//                {
//                    if turn == 1
//                    {
//                        print("hugie's turn")
//                        m1?.monsters.maxHealthPoints = m1?.monsters.maxHealthPoints ?? 0  - gameHero.weaponStrength
//                        turn = 2
//                    }
//                    else
//                    {
//                        print("monster's turn")
//                        gameHero.maxHealthPoints = gameHero.maxHealthPoints - (m1?.monsters.attackPower)! ?? 0
//                        turn = 1
//                    }
//                }
            }
            else
            {
            print("> Uh-oh, you don't know Astrid's location yet, select 1 to search for Astrid!")
            printLineSeperator()
            }
        case 3:
            print("bye")
            valid = false // make it false to close the game
            break
        default:
            print("Invalid selection, try again.")
    }
}while(valid == true)


//Roads list for a different map in case we need to show easiest path logic - works yay!

//Road(startingLocation: "Ithaca", endingLocation: "Argos", roadType: roadType.Paved),
//Road(startingLocation: "Ithaca", endingLocation: "Mycanae", roadType: roadType.Swampy),
//Road(startingLocation: "Argos", endingLocation: "Lokris", roadType: roadType.Mountainous),
//Road(startingLocation: "Argos", endingLocation: "Salamis", roadType: roadType.Swampy),
//Road(startingLocation: "Lokris", endingLocation: "Athens", roadType: roadType.Paved),
//Road(startingLocation: "Salamis", endingLocation: "Athens", roadType: roadType.Paved),
//Road(startingLocation: "Mycanae", endingLocation: "Athens", roadType: roadType.Paved),



