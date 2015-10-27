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

let solarSystemPlanets: Dictionary = [
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
    
    init(planetaySystemName:SomePlanetarySystems)
    {
        switch planetaySystemName {
            case .Solar:
                name = planetaySystemName.rawValue
                planets = setArrayOfPlanets(solarSystemPlanets, planetarySystemName: .Solar)
            case .Gliese:
                self.planets = []
            case .Cancri:
                self.planets = []
            case .Kepler:
                self.planets = []
        }
    }
    
    func setArrayOfPlanets(systemPlanets:[String:String],planetarySystemName:SomePlanetarySystems) -> [Planet]
    {
        var planets = [Planet]()
        for (planetName,description) in solarSystemPlanets {
            planets.append(Planet(name: planetName, description: description))
        }
        return planets
    }
    
    func amountOfPlanets() -> Int
    {
        return planets.count
    }
}
