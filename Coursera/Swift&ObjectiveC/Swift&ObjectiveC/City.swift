//
//  City.swift
//  Swift&ObjectiveC
//
//  Created by Andres Kwan on 11/1/15.
//  Copyright © 2015 Kwan. All rights reserved.
//

import Foundation

class City {
    let name: String
    let population: Int
    
    init(name: String, population: Int){
        self.name = name
        self.population = population
    }
}

class Country {
    let name: String
    let cities: [City]
    
    init(name: String, cities: [City]){
        self.name = name
        self.cities = cities
    }
    
    //is quite clear that the function might
    //return nil
    func findCityWithName(name: String) -> City? {
        for city in cities {
            //here compares the value
            //value type
            if city.name == name {
                return city
            }
        }
        return nil
    }
    
    // Calculated propertie
    var cityWithLargestPopulation: City {
        var maxPopulation: Int = 0
        var largestCity: City = cities[0]
        for city in cities {
            if city.population > maxPopulation {
                largestCity = city
                maxPopulation = city.population
            }
        }
        return largestCity
    }
}