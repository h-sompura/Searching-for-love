import Foundation

func printLineSeperator() {
    print("")
    print("-------------------------------")
    print("")
}

//creating Hero Hugie
let gameHero = Hero(name: "Hugie")
printLineSeperator()

//intro for the game
print("> \(gameHero), it is the day before your wedding. You are very much excited to be getting married to the love of your life, Astrid.")
sleep(1)
print("  But wait... a little birdy informs you that an evil wizard has kidnapped Astrid and fled to a castle somewhere far away and unknown.")
print("")
sleep(1)
print("> Do not worry though! We will help in your quest to save Astrid.")
sleep(1)
print("> We dropped a map next to you which will help with searching for Astrid.")
sleep(1)
print("> Remember! This world is full of monsters which you have to defeat to move forward.")
sleep(1)
print("> Good luck, \(gameHero). We hope you succeed in searching for your love! :) ")
printLineSeperator()
sleep(1)

//creating Monsters
let monstersList = [
    Monster(name: "Mistflayer"),
    Monster(name: "Glowtalon"),
    Monster(name: "Brinesword"),
    Monster(name: "Acidchild"),
    Monster(name: "Fetidbrute")
]

//creating a list of locations with a monster associated
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
    //Road(startingLocation: "Athens", endingLocation: "Athens",roadType: roadType.Paved), //could we change ending to string optional here or do we even need to connect ending location??***
]


let astridOnMap:String? = "Athens" // we can also choose not to place Astrid on map --> nil, could be randomized later ***

//creating a map using locations list and roads list with placing Astrid on the map
let map = Map(locations: locationsList, roads: roadsList, placeAstrid:astridOnMap)
printLineSeperator()
sleep(1)
map.printMap()
sleep(1)
var isAstridFound:Bool = false
var isAstridRescued:Bool = false

var runningGame = true //By default true to repeat the game options

/*
 strings used to display game options;
 declared mutable because has to be updated
 when the search/rescue is completed
*/
var searchCaseString = "Search for Astrid"
var resuceCaseString = "Rescue Astrid"

printLineSeperator()

repeat
{
    print("> \(gameHero.name), what will you do?")
    if(isAstridFound)
    {
        searchCaseString = "Search for Astrid [COMPLETE!]"
    }
    
    print("\t 1. \(searchCaseString)")
    print("\t 2. \(resuceCaseString)")
    print("\t 3. Quit")
    
    let selection = Int(readLine()!) //take input from the player
    
    switch (selection) {
        
        case 1:
            print("> Searching for Astrid....")
            sleep(1)
        
            //start search for Astrid from Ithaca
            //& store the return value in a bool var
            isAstridFound = map.searchAstrid(startingLocation: "Ithaca")
            
            if(isAstridFound == false) {
                print("")
                print("> Astrid is not on the map!")
                printLineSeperator()
            }
            break
        case 2:
            
            print("> Rescuing Astrid....")
            
            //only start the rescue if Astrid was found on map
            if(isAstridFound)
            {
                //placing Hugie on a random location on the map
                var hugieOnMap = locationsList[Int.random(in: 0..<locationsList.count)]
                
                print("> \(gameHero), looks like you are at \(hugieOnMap.locationName)! ")
                sleep(1)
                print("> Generating the easiest path to Astrid from \(hugieOnMap.locationName)...")
                
                //print the easiest path
                //starting location to take journey will be where Hugie is
                var path = map.takeJourney(startingLocation: hugieOnMap.locationName, endingLocation: astridOnMap!)
                
                print("> Path found. The easiest path to Astrid is: \(path)")
                printLineSeperator()
                
                print(hugieOnMap)
                printLineSeperator()
                
                var giveUp = false
                while(path.isEmpty == false && giveUp == false) {
                    
                    let fight = Fight(hero: gameHero, monster: hugieOnMap.monster)
                    print(fight)
                    
                    while(fight.playerMonster.maxHealthPoints > 0){
                    
                    if(fight.currentPlayer == gameHero.name){
                        print("> \(gameHero), what move will you make?")
                        print("\t> 1. Attack")
                        print("\t> 2. Sneak")
                        print("\t> 3. Give Up")
                        
                        let selection = Int(readLine()!)
                        switch(selection)
                        {
                                case 1:
                                    //print("Attack")
                                    fight.performTurn(kind: .attack)
                                case 2:
                                    print("Sneak")
                                case 3:
                                    giveUp = true
                                    isAstridRescued = false
                                    print("> Monster wins... You gave up on rescuing Astrid!")
                                    break
                                default :
                                    print("> Invalid option, try again!")
                        }
                    }
                        else{
                            fight.performTurn(kind: .attack)
                            
                        }
                        print(fight)
                    }
                    
                    print("> \(hugieOnMap.monster) was defeated! \n")
                    isAstridRescued = true
                    path.removeFirst()
                    
                    let nextLocation = path.first
                    
                    if let i = locationsList.firstIndex(where: { $0.locationName == nextLocation }){
                        hugieOnMap = locationsList[i]
                    } else {
                        break
                    }
                    
                    printLineSeperator()
                    print(hugieOnMap)
                    printLineSeperator()
                }
                        
                if(isAstridRescued){
                            resuceCaseString = "Rescue Astrid [COMPLETE!]"
                }
            }
            else
            {
                print("> Uh-oh, you don't know Astrid's location yet, select 1 to search for Astrid!")
                printLineSeperator()
            }
            break
        case 3:
            print("Bye!")
            runningGame = false //end the game
            break
        default:
            print("Invalid selection, try again.")
    }
}while(runningGame == true)


//Roads list for a different map in case we need to show easiest path logic - works yay!

//Road(startingLocation: "Ithaca", endingLocation: "Argos", roadType: roadType.Paved),
//Road(startingLocation: "Ithaca", endingLocation: "Mycanae", roadType: roadType.Swampy),
//Road(startingLocation: "Argos", endingLocation: "Lokris", roadType: roadType.Mountainous),
//Road(startingLocation: "Argos", endingLocation: "Salamis", roadType: roadType.Swampy),
//Road(startingLocation: "Lokris", endingLocation: "Athens", roadType: roadType.Paved),
//Road(startingLocation: "Salamis", endingLocation: "Athens", roadType: roadType.Paved),
//Road(startingLocation: "Mycanae", endingLocation: "Athens", roadType: roadType.Paved),
