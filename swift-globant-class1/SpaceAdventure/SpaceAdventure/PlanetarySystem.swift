//
//  PlanetarySystem.swift
//  SpaceAdventure
//
//  Created by Andres Kwan on 10/27/15.
//  Copyright © 2015 Globant. All rights reserved.
//

import Foundation

enum SomePlanetarySystems : String
{
    case Solar = "Solar"
    case Gliese = "Gliese 876"
    case Cancri = "55 Cancri"
    case Kepler = "Kepler-42"
}

let SolarSytem: Dictionary = [
    "Mercury": "A very hot planet, closest to the sun.",
    "Venus": "It's very cloudy here!",
    "Earth": "There is something very familiar about this planet.",
    "Mars": "Known as the red planet.",
    "Jupiter": "A gas giant, with a noticeable red spot.",
    "Saturn": "This planet has beautiful rings around it.",
    "Uranus": "Strangely, this planet rotates around on its side.",
    "Neptune": "A very cold planet, furthest from the sun."
]


class PlanetarySystem {
    var planets: [Planet] = []
    var name: String = ""
    
////    var planetarySystem: SomePlanetarySystems
//    
//    init(planets:[Planets],name:String,planetaySystemName:SomePlanetarySystems)
//    {
//        self.name = name
//        switch planetarySystemName {
//            case .Solar:
//                self.planets = []
//            case .Gliese:
//                self.planets = []
//            case .Cancri:
//                self.planets = []
//            case .Kepler:
//        }()
//        
//    }
}