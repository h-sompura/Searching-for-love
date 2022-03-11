//
//  Road.swift
//  SearchingforLove
//
//  Created by Urja Desai on 04/03/22.
//

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
