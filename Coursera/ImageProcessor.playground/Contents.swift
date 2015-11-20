//: Playground - noun: a place where people can play

import UIKit

let image:UIImage! = UIImage(named: "sample")

// Process the image!
let rgbaImage:RGBAImage! = RGBAImage(image: image)

let pixelCount = rgbaImage.width * rgbaImage.height
let avgRed = 107
let avgGreen = 109
let avgBlue = 110
let sum = avgRed + avgGreen + avgBlue

for y in 0..<rgbaImage.height {
    for x in 0..<rgbaImage.width {
        let index = y * rgbaImage.width + x
        var pixel = rgbaImage.pixels[index]
        let redDelta = Int(pixel.red) - avgRed
        let greenDelta = Int(pixel.green) - avgBlue
        
        var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
        if (Int(pixel.red) < avgRed) {
            modifier = 1
        }
        
        pixel.red = UInt8(max(min(255, Int(round(Double(avgRed) + modifier * Double(redDelta)))), 0))
        rgbaImage.pixels[index] = pixel
    }
}


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









