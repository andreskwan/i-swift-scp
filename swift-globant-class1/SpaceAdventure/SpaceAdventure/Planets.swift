//
//  Planets.swift
//  SpaceAdventure
//
//  Created by Andres Kwan on 10/26/15.
//  Copyright © 2015 Globant. All rights reserved.
//

import Foundation

struct Planet {
    var name: String!
    var description: String!
    
    init(name:String, description:String)
    {
        self.name = name
        self.description = description
    }
}