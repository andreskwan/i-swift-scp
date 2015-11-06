//
//  WelcomePlanet.swift
//  SpaceAdventure
//
//  Created by Andres Kwan on 11/6/15.
//  Copyright © 2015 Globant. All rights reserved.
//

import Foundation
import UIKit

class WelcomePlanetViewController: UIViewController {
    var planetName = "Earth"
    @IBOutlet weak var labelWelcomePlanet: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.labelWelcomePlanet.text = "Welcome to planet \(planetName)"
    }
}
