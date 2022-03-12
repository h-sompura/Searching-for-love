import Foundation

class Road
{
    
    let startingLocation:String
    let endingLocation:String
    let roadType:roadType
    
    init(startingLocation: String , endingLocation: String, roadType : roadType)
    {
        self.startingLocation = startingLocation
        self.endingLocation = endingLocation
        self.roadType = roadType
    }
  
    
}
