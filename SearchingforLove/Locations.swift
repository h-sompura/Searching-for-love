import Foundation

class Location: CustomStringConvertible {
  let locationName: String
  let monster: Monster

  init(locationName: String, monster: Monster) {
    self.locationName = locationName
    self.monster = monster
  }
}

extension Location {
  var description: String {
    return "ARRIVED AT \(locationName). \n \t \(monster) IS WAITING TO FIGHT! \n"
      + "\t FIGHT BEGINS! \n"
  }
}
