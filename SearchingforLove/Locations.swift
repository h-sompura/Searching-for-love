import Foundation



class Location
{
    let locationName:String
    let monster:Monster
    
    init(locationName : String, monster : Monster)
    {
        self.locationName = locationName
        self.monster = monster
    }
}