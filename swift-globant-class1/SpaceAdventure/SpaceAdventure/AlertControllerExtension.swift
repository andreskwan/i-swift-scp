//
//  AlertControllerExtension.swift
//  SpaceAdventure
//
//  Created by Andres Kwan on 11/9/15.
//  Copyright © 2015 Globant. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    static func alertControllerWithOkAction(title: String, message: String, preferredStyle: UIAlertControllerStyle) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let defaultAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
        })
        alert.addAction(defaultAction)
        return alert
    }
}