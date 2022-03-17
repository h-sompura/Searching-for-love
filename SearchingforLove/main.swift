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
print(
  "> \(gameHero), it is the day before your wedding. You are very much excited to be getting married to the love of your life, Astrid."
)
sleep(1)
print(
  "  But wait... a little birdy informs you that an evil wizard has kidnapped Astrid and fled to a castle somewhere far away and unknown."
)
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
  Monster(name: "Fetidbrute"),
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

let astridOnMap: String? = "Athens"  // we can also choose not to place Astrid on map --> nil, could be randomized later ***

//creating a map using locations list and roads list with placing Astrid on the map
let map = Map(locations: locationsList, roads: roadsList, placeAstrid: astridOnMap)
printLineSeperator()
sleep(1)
map.printMap()
sleep(1)
var isAstridFound: Bool = false
var isAstridRescued: Bool = false

var runningGame = true  //By default true to repeat the game options

/*
 strings used to display game options;
 declared mutable because has to be updated
 when the search/rescue is completed
*/
var searchCaseString = "Search for Astrid"
var resuceCaseString = "Rescue Astrid"

var currentWinner: String = ""

printLineSeperator()

repeat {
  print("> \(gameHero.name), what will you do?")

  if isAstridFound {
    searchCaseString = "Search for Astrid [COMPLETE!]"
  }

  if isAstridRescued {
    resuceCaseString = "Rescue Astrid [COMPLETE!]"
  }

  print("\t 1. \(searchCaseString)")
  print("\t 2. \(resuceCaseString)")
  print("\t 3. Quit")

  var playerInput = Int(readLine()!)  //take input from the player

  switch playerInput {

  case 1:
    searchCaseString = "Search for Astrid"
    print("> Searching for Astrid....")
    sleep(1)

    //start search for Astrid from Ithaca
    //& store the return value in a bool var
    isAstridFound = map.searchAstrid(startingLocation: "Ithaca")

    if isAstridFound == false {
      print("")
      print("> Astrid is not on the map!")
      currentWinner = "> \(gameHero.name) could not find Astrid! You LOSE ***"
      print("\(currentWinner)")
      printLineSeperator()
    }
    break
  case 2:
    resuceCaseString = "Rescue Astrid"
    var heroGivesUp = false

    //place Hugie on Map now @ a random location
    var hugieOnMap = locationsList[Int.random(in: 0..<locationsList.count)]
    print("> Rescuing Astrid....")

    //only start the rescue if Astrid was found on map
    if isAstridFound {
      //generate easiest path from Hugie's location
      print("> \(gameHero.name), looks like you are at \(hugieOnMap.locationName)")
      print("> Generating the easiest path from your location...")
      var path = map.takeJourney(
        startingLocation: hugieOnMap.locationName, endingLocation: astridOnMap!)
      sleep(1)
      print("> Path found. The easiest path to Astrid is: \(path)")
      printLineSeperator()

      //start journey, visit each location, print location deets
      //traverse next location only player hasn't given up
      LOCATION: while path.isEmpty == false && heroGivesUp == false {

        isAstridRescued = false

        //print Hugie's current location
        print(hugieOnMap)
        printLineSeperator()

        //fight specific output here
        let fight = Fight(hero: gameHero, monster: hugieOnMap.monster)
        print(fight)

        var trackFight = false
        FIGHT: while trackFight == false {

          if fight.currentPlayer.contains(gameHero.name) {
            //current player is Hero
            print("> \(gameHero), what move will you make?")
            print("\t> 1. Attack")
            print("\t> 2. Sneak")
            print("\t> 3. Give Up")

            playerInput = Int(readLine()!)

            switch playerInput {
            case 1:
              //attack
              trackFight = fight.performTurn(kind: .attack)
            //print("> In HERO ATTACK: \(trackFight)")
            case 2:
              //sneak
              trackFight = fight.performTurn(kind: .sneak)
              printLineSeperator()
              //print("> In HERO SNEAK: \(trackFight)")
              if(trackFight) { break FIGHT}
            case 3:
              //run away
              trackFight = fight.performTurn(kind: .runAway)
              //print("> In HERO GIVEUP: \(trackFight)")
              heroGivesUp = true
              continue LOCATION
            default:
              //invalid
              print("> Invalid command, try again!")
            }
          } else {
            //current player is Monster
            //monster only attacks
            trackFight = fight.performTurn(kind: .attack)
            //print("> In MONSTER ATTACK: \(trackFight)")
          }
          print(fight)
        }  //FIGHT ENDS

        let fightResult = fight.finalFightStats()
        print(fightResult)

        currentWinner = fight.winner
        if currentWinner == gameHero.name {
          //after fight is over & hugie wins, move to next location
          path.removeFirst()
          let nextLocation = path.first

          //find the next location in our loc. list
          if let foundLocation = locationsList.firstIndex(where: { $0.locationName == nextLocation }
          ) {
            //next loc. found, hence update hugie's location
            hugieOnMap = locationsList[foundLocation]
          } else {
            //no next loc. found
            isAstridRescued = true
            break LOCATION
          }
        } else {
          isAstridRescued = false
        }
      }  //LOCATION ENDS
    } else {
      print("> Uh-oh, you don't know Astrid's location yet, select 1 to search for Astrid!")
      printLineSeperator()
    }
    if isAstridRescued {
      print("> ~~~ Congratulations! You rescued your love! ~~~ \n")
    }
    break
  case 3:
    print("Bye!")
    runningGame = false  //end the game
    break
  default:
    print("Invalid selection, try again.")
  }
} while runningGame == true

//Roads list for a different map in case we need to show easiest path logic - works yay!

//Road(startingLocation: "Ithaca", endingLocation: "Argos", roadType: roadType.Paved),
//Road(startingLocation: "Ithaca", endingLocation: "Mycanae", roadType: roadType.Swampy),
//Road(startingLocation: "Argos", endingLocation: "Lokris", roadType: roadType.Mountainous),
//Road(startingLocation: "Argos", endingLocation: "Salamis", roadType: roadType.Swampy),
//Road(startingLocation: "Lokris", endingLocation: "Athens", roadType: roadType.Paved),
//Road(startingLocation: "Salamis", endingLocation: "Athens", roadType: roadType.Paved),
//Road(startingLocation: "Mycanae", endingLocation: "Athens", roadType: roadType.Paved),

