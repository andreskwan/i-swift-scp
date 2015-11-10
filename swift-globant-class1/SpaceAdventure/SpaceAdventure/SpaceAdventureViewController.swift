//
//  ViewController.swift
//  SpaceAdventure
//
//  Created by Julie Caccavo on 10/22/15.
//  Copyright © 2015 Globant. All rights reserved.
//

import UIKit


enum ValidAnswers:String {
    case YES = "YES"
    case NO = "NO"
}

enum SegueIdentifiers: String {
    case VisitPlanet   = "VisitPlanet"
    case ListOfPlanets = "ViewPlanetarySystem"
}

class SpaceAdventureViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var answer: UITextField!

    
    let translations = ["YES","NO"]
    
    var keyBoardHeight: CGFloat!
    var planetarySystem = PlanetarySystem(planetaySystemName: SomePlanetarySystems.Solar)
    var nameOfRamdomPlanet: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        answer.autocapitalizationType = UITextAutocapitalizationType.AllCharacters
        answer.textAlignment = NSTextAlignment.Center
        answer.delegate = self
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = true
        subscribeToKeyboardNotifications()
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBarHidden = false
        unsubscribeFromKeyBoardNotifications()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: present other views
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
        case SegueIdentifiers.VisitPlanet.rawValue:
                let controller = segue.destinationViewController as! WelcomePlanetViewController
                controller.planetName = "Pepino"//self.nameOfRamdomPlanet
        case SegueIdentifiers.ListOfPlanets.rawValue:
                let controller = segue.destinationViewController as! PlanetarySystemViewController
                controller.planetarySystem = PlanetarySystem(planetaySystemName: SomePlanetarySystems.Solar)
        default: break
        }
    }
    
    // MARK: UITextFieldDelegate - Methods
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var answerStringRange: NSRange
        var newAnswer = textField.text! as NSString
        newAnswer = newAnswer.stringByReplacingCharactersInRange(range, withString: string)
        
        for actualString in translations {
            repeat {
                answerStringRange = newAnswer.rangeOfString(actualString, options: NSStringCompareOptions.CaseInsensitiveSearch)
                if newAnswer.length < 4 {
                    // found one
                    if answerStringRange.location != NSNotFound {
                        textField.text = newAnswer as String
                        if newAnswer == ValidAnswers.YES.rawValue {
                            //TODO: obtain a name of a planet randomly
                            performSegueWithIdentifier(SegueIdentifiers.VisitPlanet.rawValue, sender: self)
                        } else {
                            performSegueWithIdentifier(SegueIdentifiers.ListOfPlanets.rawValue, sender: self)
                        }
                        //hide keyboard
                        textField.resignFirstResponder()
                       return true
                    }
                } else {
                    newAnswer = ""
                    textField.text = newAnswer as String
                    
                    textField.resignFirstResponder()

                    let alert = UIAlertController.alertControllerWithOkAction("Wrong Answer", message: "Sorry, I didn't get that. Please answer YES or NO.", preferredStyle: UIAlertControllerStyle.Alert)
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                    return false
                }
            } while answerStringRange.location != NSNotFound
        }
       return true
    }
    
    // MARK: Keyboard
    func subscribeToKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    func unsubscribeFromKeyBoardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name:UIKeyboardWillHideNotification, object: nil)
    }
    func keyboardWillShow(notification: NSNotification) {
        if answer.isFirstResponder() {
            keyBoardHeight = getKeyboardHeight(notification)
            if keyBoardHeight != 0 {
                animateTextField(true)
            }
        }
    }
    func keyboardWillHide(notification: NSNotification) {
        if answer.isFirstResponder() && keyBoardHeight != nil {
            animateTextField(false)
        }
    }
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        if let userInfo = notification.userInfo {
            if let keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.CGRectValue() {
                return keyboardSize.height
            }
        }
        return 0
    }
    func animateTextField(up: Bool) {
        let movement = (up ? -keyBoardHeight : keyBoardHeight)
        UIView.animateWithDuration(0.3, animations: {
            self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        })
    }
    
}

