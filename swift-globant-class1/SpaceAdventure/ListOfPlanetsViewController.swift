//
//  ListOfPlanetsViewController.swift
//  SpaceAdventure
//
//  Created by Andres Kwan on 11/6/15.
//  Copyright © 2015 Globant. All rights reserved.
//

import Foundation
import UIKit

class PlanetarySystemViewController: UITableViewController {
    var planetarySystem = PlanetarySystem(planetaySystemName: SomePlanetarySystems.Solar)
    let kCellIdentier = "PlanetTableViewCell"
    let kViewControllerIdentifier = "WelcomePlanetIdentifier"
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planetarySystem.amountOfPlanets()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //cell identifier
        let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentier, forIndexPath: indexPath) as! PlanetTableViewCell
        cell.labelPlanetName.text = planetarySystem.planets[indexPath.row].name
        cell.labelPlanetDescription.text = planetarySystem.planets[indexPath.row].description
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let welcomeVC = storyboard.instantiateViewControllerWithIdentifier(kViewControllerIdentifier) as!WelcomePlanetViewController
        welcomeVC.planetName = planetarySystem.planets[indexPath.row].name
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
}
