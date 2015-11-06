//
//  ViewController.swift
//  SpaceAdventure
//
//  Created by Julie Caccavo on 10/22/15.
//  Copyright © 2015 Globant. All rights reserved.
//

import UIKit

class SpaceAdventureViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var answer: UITextField!
    
    var keyBoardHeight: CGFloat!
    var planetarySystem = PlanetarySystem(planetaySystemName: SomePlanetarySystems.Solar)
    
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
    // MARK: UITextFieldDelegate - Methods
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
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
    
//    this method is called everytime we insert a single letter - YES
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var answerStringRange: NSRange
        
        // Construct the text that will be in the field if this change is accepted
        var newAnswer = textField.text! as NSString
        
        newAnswer = newAnswer.stringByReplacingCharactersInRange(range, withString: string)
        
        // For each dictionary entry in translations, pull out a string to search for
        // and an emoji to replace it with
        let translations = ["YES","NO"]
        
        for actualString in translations {
            repeat {
                answerStringRange = newAnswer.rangeOfString(actualString, options: NSStringCompareOptions.CaseInsensitiveSearch)
                print("New Answer: \(newAnswer) length : \(newAnswer.length) \n String: \(actualString) \n Length: \(answerStringRange.length), Location: \(answerStringRange.location)")
                if newAnswer.length <= 3 {
                    // found one
                    if answerStringRange.location != NSNotFound {
                        //aqui debe lanzar
                        newAnswer = newAnswer.stringByReplacingCharactersInRange(answerStringRange, withString: "\u{E052}")
                        textField.text = newAnswer as String
                        return true
                    }
                } else {
                    newAnswer = ""
                    textField.text = newAnswer as String
                    
                    textField.resignFirstResponder()
                    
                    //1 controller for alert
                    let alert = UIAlertController(title: "Wrong Answer", message: "Sorry, I didn't get that. Please answer YES or NO.", preferredStyle: UIAlertControllerStyle.Alert)

                    //2 action for alert
                    let defaultAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                    })
                    
                    //3 add action to the alert controller 
                    alert.addAction(defaultAction)
                    
                    //4 present the alert
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                    return false
                }
            } while answerStringRange.location != NSNotFound
        }
       return true
    }
}

