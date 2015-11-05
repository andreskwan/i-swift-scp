//: Playground - noun: a place where people can play

import Cocoa

///////////////////////////////////////////
// Globant - Assignment 1

enum SomePlanetarySystems : String
{
    case Solar = "Solar"
    case Gliese = "Gliese 876"
    case Cancri = "55 Cancri"
    case Kepler = "Kepler-42"
}

let solar = SomePlanetarySystems.Solar

func useEnum(planetary:SomePlanetarySystems) -> String
{
    switch planetary {
    case .Cancri:
        return "Cancri, I don't know nothing about it"
    case .Solar:
        return "Solar, where I live"
    default:
        return "no solar system"
    }
}

useEnum(SomePlanetarySystems.Cancri)

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

struct Planet {
    var name: String!
    var description: String!
    
    init(name:String, description:String)
    {
        self.name = name
        self.description = description
    }
}

var planets:[Planet] = []

for (planetName,description) in solarSystemPlanets {
    planets.append(Planet(name: planetName, description: description))
}

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

    func setArrayOfPlanets(dictOfPlanets:[String:String],planetarySystemName:SomePlanetarySystems) -> [Planet]
    {
        var planets = [Planet]()
         planets = dictOfPlanets.map(
            {(planetName,planetDescription) -> Planet in
                return Planet(name: planetName, description: planetDescription)
            })
        return planets;
    }
    
    func amountOfPlanets() -> Int
    {
        return planets.count
    }
}

///////////////////////////////////////////
//Public and Private
// one file doesn't allow "access control"
let solarSystem = PlanetarySystem(planetaySystemName: SomePlanetarySystems.Solar)
solarSystem.name
solarSystem.amountOfPlanets()
solarSystem.planets

//min 32 - mutabilidad



