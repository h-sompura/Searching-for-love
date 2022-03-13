//
//  Road.swift
//  SearchingforLove
//
//  Created by Urja Desai on 04/03/22.
//

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
