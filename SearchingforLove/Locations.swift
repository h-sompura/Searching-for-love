import Foundation



class Locations
{
    var locationName = ""
    let monsters : Monsters
    init(locationName : String, monster : Monsters)
    {
        self.locationName = locationName
        self.monsters = monster
    }
}
