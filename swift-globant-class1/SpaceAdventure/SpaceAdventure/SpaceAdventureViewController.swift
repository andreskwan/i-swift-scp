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
    func textFieldDidEndEditing(textField: UITextField) {
        if let text = textField.text {
            switch text {
                case "YES":
                    print("yes")
                case "NO":
                    print("no")
                default:
                    print("Sorry, I didn't get that. Please answer YES or NO.   ")
            }
        }
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
        
        // flag
        var wasIdentified = false
        
        var emojiStringRange: NSRange
        
        // Construct the text that will be in the field if this change is accepted
        var newText = textField.text! as NSString
        
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        // For each dictionary entry in translations, pull out a string to search for
        // and an emoji to replace it with
        let translations = ["YES","NO"]
        
        for emojiString in translations {
            
            // Search for all occurances of key (ie. "dog"), and replace with emoji (ie. 🐶)
            repeat {
                //
                emojiStringRange = newText.rangeOfString(emojiString, options: NSStringCompareOptions.CaseInsensitiveSearch)
                print("New text: \(newText) vs String: \(emojiString) \n Length: \(emojiStringRange.length), Location: \(emojiStringRange.location)")
                if emojiStringRange.length <= 3 {
                    // found one
                    if emojiStringRange.location != NSNotFound {
                        //aqui debe lanzar
                        newText = newText.stringByReplacingCharactersInRange(emojiStringRange, withString: "\u{E052}")
                        wasIdentified = true
                    }
                } else {
                    "Sorry, I didn't get that. Please answer YES or NO.   "
                    newText = "Wrong!"
                }
            } while emojiStringRange.location != NSNotFound
        }
        
        // If we have replaced an emoji, then we directly edit the text field
        // Otherwise we allow the proposed edit.
        if wasIdentified {
            textField.text = newText as String
            return false
        } else {
            return true
        }
    }
}

