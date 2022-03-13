//
//  Locations.swift
//  SearchingforLove
//
//  Created by Urja Desai on 03/03/22.
//

import Foundation



class Location
{
    var locationName = ""
    let monsters : Monster
    init(locationName : String, monster : Monster)
    {
        self.locationName = locationName
        self.monsters = monster
    }
    
    
    
}

extension Location : CustomStringConvertible
{
    var description: String
    {
        get
        {
            return monsters.name
        }
    }
}
