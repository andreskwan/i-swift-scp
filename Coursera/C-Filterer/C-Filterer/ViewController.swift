//
//  ViewController.swift
//  C-Filterer
//
//  Created by Andres Kwan on 11/15/15.
//  Copyright © 2015 Kwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var filteredImage: UIImage?
    var isFiltered: Bool = false
    let originalImage = UIImage(named: "sample")
    @IBOutlet weak var imageToggle: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func onImageToggle(sender: AnyObject) {
        imageView.image = isFiltered ? filteredImage : originalImage
        isFiltered = !isFiltered
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let image:UIImage! = UIImage(named: "sample")
        processImage()
        isFiltered = true
        imageView.image = originalImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func processImage() {
        // Process the image!
        let rgbaImage:RGBAImage! = RGBAImage(image: originalImage!)
        
        let avgRed = 107
        
        for y in 0..<rgbaImage.height {
            for x in 0..<rgbaImage.width {
                let index = y * rgbaImage.width + x
                var pixel = rgbaImage.pixels[index]
                let redDelta = Int(pixel.red) - avgRed
                
                var modifier = 1 + 4 * (Double(y) / Double(rgbaImage.height))
                if (Int(pixel.red) < avgRed) {
                    modifier = 1
                }
                
                pixel.red = UInt8(max(min(255, Int(round(Double(avgRed) + modifier * Double(redDelta)))), 0))
                rgbaImage.pixels[index] = pixel
            }
        }
        filteredImage = rgbaImage.toUIImage()
    }

}

