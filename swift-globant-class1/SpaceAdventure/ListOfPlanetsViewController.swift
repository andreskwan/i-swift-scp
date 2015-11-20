//
//  ListOfPlanetsViewController.swift
//  SpaceAdventure
//
//  Created by Andres Kwan on 11/6/15.
//  Copyright © 2015 Globant. All rights reserved.
//

import Foundation
import UIKit

enum AlertStrings: String {
    case title = "Travel Time"
    case estimatedTime = "The estimated time to destination is "
    case noTime = "Sorry, I can't provide an estimated time to destination right now. \nRelax and ejoy the trip."
    case actionTitle = "Ok"
}

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
        let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentier, forIndexPath: indexPath) as! PlanetTableViewCell
        cell.labelPlanetName.text = planetarySystem.planets[indexPath.row].name
        cell.labelPlanetDescription.text = planetarySystem.planets[indexPath.row].description
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let welcomeVC = storyboard.instantiateViewControllerWithIdentifier(kViewControllerIdentifier) as! WelcomePlanetViewController
        let selectedPlanet = planetarySystem.planets[indexPath.row]
        welcomeVC.planetName = selectedPlanet.name

        let title = AlertStrings.title.rawValue
        let message: String
        
        if let tripTime = selectedPlanet.timeFromEarth {
            message = AlertStrings.estimatedTime.rawValue + "\(tripTime)"
        } else {
            message = AlertStrings.noTime.rawValue
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let defaultAction = UIAlertAction(title: AlertStrings.actionTitle.rawValue, style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
            self.navigationController?.pushViewController(welcomeVC, animated: true)
        })
        alert.addAction(defaultAction)
        self.presentViewController(alert, animated: true, completion: nil)        

    }
}
