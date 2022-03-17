import Foundation

class Map {
  var adjacencyList: [String: [(locationName: String, roadType: roadType)]] = [:]
  var placeAstridOnMap: String?

  init(locations: [Location], roads: [Road], placeAstrid: String?) {
    // build the dictionary (db) of locations & which roads they are connected by
    self.placeAstridOnMap = placeAstrid ?? nil
    for road in roads {
      // RECALL: Every road has a start and ending location

      // get the value stored in the starting location
      let startingLocation = road.startingLocation

      // check if this value is already in our nodes dictionray
      if adjacencyList[startingLocation] == nil {
        // no, it is not in the dictionary
        // create a new entry for it
        // (ie: create an empty list)
        adjacencyList[startingLocation] = []
        // add the ending location to to the list
        // - RECALL: Accessing a value in the dictionary will always return an Optional value
        // - To edit the value of an optional, the optional needs to be unwrapped
        // - the ! symbol means to forcibly unwrap the contents of the variable
        // - Usually, force unwrapping is dangerous and should only be used if you are 100% certain that the value in adjacencyList[srcValue] is NOT NULL
        // - In the previous step, we initialized an empty list at adjacencyList[srcValue], so we can 100% say that adjacencyList[srcValue]'s stored value is NOT NULL
        // - Hence why we can safely unwrap using forced unwrapping
        let tupleToAdd = (road.endingLocation, road.roadType)
        adjacencyList[startingLocation]!.append(tupleToAdd)
      } else {
        // yes, we already have an entry for this location value
        // directly add the location to the list
        let tupleToAdd = (road.endingLocation, road.roadType)
        adjacencyList[startingLocation]!.append(tupleToAdd)
      }
    }  // end for

    // at this point, the initializer will have finished examining all the roads in the parameter
    print("The map is in your hands!")
  }

  func takeJourney(startingLocation: String, endingLocation: String) -> [String] {
    // 1. Get the current location that the hero is at
    var currentLocation = startingLocation
    var outputLocation = [startingLocation]
    while currentLocation != endingLocation {

      // 2. What are the location's neighbours
      if let neighboursList = adjacencyList[currentLocation] {
        // neighbours exist
        // 3. Determine which neighbour is the easiest to travel through
        var nextLocation = neighboursList.first!.locationName
        var easiestRoad = neighboursList.first!.roadType.rawValue

        // find easiest neighbour
        for neighbour in neighboursList {
          if neighbour.roadType.rawValue < easiestRoad {
            easiestRoad = neighbour.roadType.rawValue
            nextLocation = neighbour.locationName
          }
        }
        // update the current location
        currentLocation = nextLocation
        outputLocation.append(currentLocation)
        // search complete
        //print("The next location to visit is: \(currentLocation)")
      } else {
        // neighbours do not exist
        // - you are at a location that has no further nodes beyond it
      }

      // 4. Repeat this process until you reach the end (ending Point)
    }  // while
    return outputLocation
  }  // function

  func searchAstrid(startingLocation: String) -> Bool {
    var astridFound = false
    //tracks which locations we need to visit
    var stackToExplore: [String] = []
    let locationOfAstrid = self.placeAstridOnMap
    // Track which locations were already visited
    //  - this is necessary when you aren't sure if your graph has loops / cycles
    var visitedNodes: [String] = []

    // indicate where you want to start the traversal from
    // - depending on the map and your starting point, you may or may not end up visiting all the nodes
    stackToExplore.append(startingLocation)

    while stackToExplore.isEmpty == false {
      // popping a stack means to remove the last item that was added
      let currNode = stackToExplore.removeLast()

      if visitedNodes.contains(currNode) == false {

        // we have not seen this node before
        // so mark it as visited
        visitedNodes.append(currNode)
      }
      if let found = locationOfAstrid {
        if visitedNodes.contains(found) {
          print("> Searching \(currNode): Astrid found!")
          print("")
          print("> Astrid is in \(currNode)")
          print("")
          astridFound = true
          break
        }
      }
      print("> Searching \(currNode): Astrid not found, moving to the next city")
      // get neighbours of the current location
      if let neighbours = self.adjacencyList[currNode] {
        //                neighbours = self.adjacencyList[currNode]!

        // iterate through the neighbours and put the unvisited neighbours into the stack
        for neighbour in neighbours {
          if visitedNodes.contains(neighbour.locationName) == true {
            // we've visited this neighbour in the past, so there is no need to examine it again
            // we've returned back to a node we saw previously
            continue
          } else {
            stackToExplore.append(neighbour.locationName)
          }
        }
      } else {
        //                    print("\(currNode) does not have an entry in the adjacency list")
        //                    print("At a terminal node, moving on")
      }

    }
    return astridFound
  }
  func printMap() {
    for entry in adjacencyList {
      let endingLocation = entry.value.map { $0.locationName }
      let roadType = entry.value.map { $0.roadType }
      for i in 0..<endingLocation.count {
        print("\(entry.key) is connected to \(endingLocation[i]) via a \(roadType[i]) road")
      }
    }
  }
}
