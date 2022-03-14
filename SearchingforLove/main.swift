//
//  main.swift
//  SearchingforLove
//
//  Created by Urja Desai on 01/03/22.
//

import Foundation

//creating Hero Hugie
//var turn = 1
let gameHero = Hero(name: "Hugie")
print("-------------------------------")
print("")
print("> \(gameHero.name), it is the day before your wedding. You are very much excited to be getting married to the love of your life, Astrid.")
print("  But wait... a little birdy informs you that an evil wizard has kidnapped Astrid and fled to a castle somewhere far away and unknown.")
print("")
print("> Do not worry though! We will help in your quest to save Astrid.")
print("> We dropped a map next to you which will help with searching for Astrid.")
print("> Remember! This world is full of monsters which you have to defeat to move forward.")
print("> Good luck, \(gameHero.name). We hope you succeed in searching for your love! :) ")
print("")
print("-------------------------------")


var found_astrid = ""
var indexNum : Int = 0
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

//creating a map using locations list and roads list
let map = Map(locations: locationsList, roads: roadsList, placeAstrid:"Athens")
map.printMap()
//this prints the easiest path ---> map.takeJourney(startingLocation: "Ithaca", endingLocation: "Athens")


var isAstridFound:Bool = false
var searchCaseString = "Search for Astrid"

var valid = true //By default true to repeat the condition
repeat
{
    print("Hello..!! Welcome to Searching For Love Game")
    print("What will you do")
    if(isAstridFound == true)
    {
    print("1. Search for Astrid" + "[Complete!]")
    }
    else
    {
    print("1. Search for Astrid")
    }
    print("2. Rescue Astrid")
    print("3. Quit")
    let selection = Int(readLine()!)
    switch (selection) {
        case 1:
        print("> Searching for Astrid....")
                   isAstridFound = map.searchAstrid(startingLocation: "Ithaca")
        
                   if(isAstridFound == false) {
                       print("")
                       print("> Astrid is not on the map!")
                       
                   }
        case 2:
            print("Rescuing Astrid....")
            if(isAstridFound)
            {
                print(locationsList.capacity)
                print("already Know the location of astrid")
        
                while(gameHero.maxHealthPoints >= 0)
                {
                    print(indexNum)
                    let f1 = Fight(hero: gameHero, monster: locationsList[indexNum].monsters)
                        print(f1)
                        if(f1.turn == 1)
                        {
                            print("hugies's turn")
                            print("What will you do HUgie")
                            print("1. Attack")
                            print("2. Sneak")
                            print("3. Give Up")
                            var Hugie_selection = Int(readLine()!)
                            switch(Hugie_selection)
                            {
                            case 1:
                                print("attack")
                                if(f1.playerMonster.maxHealthPoints >= 0)
                                {
                                    if(f1.playerMonster.maxHealthPoints < f1.playerHero.weaponStrength)
                                    {
                                        print("Huggie won Moving to next Location")
                                        if(locationsList.count > indexNum)
                                        {
                                            print("Hugies won Yeahhh Found Astrid")
                                            valid = false
                                            Hugie_selection = 4
                                        }
                                       indexNum = indexNum + 1
                                    }
                                    else
                                    {
                                    f1.performTurn(abc: action_perform.attack)
                                    print(f1)
                                    }
                                }
                                else
                                {
                                    print("in ")
                                    if(locationsList.count > indexNum)
                                    {
                                        print("Hugies won Yeahhh Found Astrid")
                                        valid = false
                                        Hugie_selection = 4
                                    }
                                    indexNum = indexNum + 1
                                    print("abc",indexNum)
                                }
                            case 2:
                                print("sneak")
                            case 3:
                                print("give up")
                            default :
                                print("please enter valid")
                            }
                            f1.turn = 2
                        }
                        else
                        {
                            print("monster;s turn")
                            f1.performTurn(abc: action_perform.attack)
                            print(f1)
                            f1.turn = 1
                        }
                    }
                
                   
              
                
            }
            else
            {
            print("Please select option 1 from menu and Search For Astrid's Location")
            }
        case 3:
            print("bye")
            valid = false // make it false to close the   game
            break
        default:
            print("Invalid selection, try again.")
    }
}while(valid == true)




////                var m1 : Location?
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
