import Foundation

class Location:CustomStringConvertible
{
    let locationName:String
    let monster:Monster
    
    init(locationName : String, monster : Monster)
    {
        self.locationName = locationName
        self.monster = monster
    }
}

extension Location {
    var description: String {
        get {
            return "Arrived at \(locationName). \n \t \(monster) is waiting to fight!"
        }
    }
}
