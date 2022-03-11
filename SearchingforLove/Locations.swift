//
//  Locations.swift
//  SearchingforLove
//
//  Created by Urja Desai on 03/03/22.
//

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
