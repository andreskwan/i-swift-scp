//: Playground - noun: a place where people can play

import UIKit

let image:UIImage! = UIImage(named: "sample")

// Process the image!
let rgbaImage:RGBAImage! = RGBAImage(image: image)

//pixel position
let x = 1
let y = 1

let width = rgbaImage.width

let index = y * rgbaImage.width + x
var pixel = rgbaImage.pixels[index]

pixel.red
pixel.blue
pixel.green

pixel.red = 255
pixel.blue = 0
pixel.green = 0

pixel.red
pixel.blue
pixel.green

rgbaImage.pixels[index] = pixel

let newImage = rgbaImage.toUIImage()

//Objective-C
//http://stackoverflow.com/questions/11592313/how-do-i-save-a-uiimage-to-a-file
//swift 2.1
//http://stackoverflow.com/questions/14531912/storing-images-locally-on-an-ios-device
let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
let imageURL = documentsURL.URLByAppendingPathComponent("pixelModifiedImage.jpg")
imageURL

UIImageJPEGRepresentation(newImage!, 1.0)?.writeToURL(imageURL, atomically: false)