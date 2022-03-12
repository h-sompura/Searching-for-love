import Foundation

class road
{
    
    let startingLocation : String
    let endingLocation : String
    let road : roadType
    
    init(_ starting : String , _ ending : String, _ road : roadType)
    {
        self.startingLocation = starting
        self.endingLocation = ending
        self.road = road
    }
  
    
}
