//: Playground - noun: a place where people can play

import Foundation
import UIKit

//w2.1 Playground
var str: String! //is nil at the begining

str = nil

str = "hello"

if (str != nil) {
    print(str)
}

//w2.2 Control flow
for i in 0..<10{
    //guard as a break 
    //guard as a assert
    guard (i != 2) else { continue }
    if i != 5 {
        print(i)
    }
}

//w2.3 Arrays & Dictionaries 
var animals = ["dog", "cat", "bird"]

var cuteness = ["dog": "funny",
                "cat": "very cute",
               "bird": "amazing"];

//w2. Functions
let gramInOunces:Float = 0.035274

func ouncesToGrams(ounces: Float = 0) -> Float
{
    
    return Float(ounces)/Float(gramInOunces)
}

ouncesToGrams(1)

// w2.1.2 Functions & switch 

// w2.2 Arrays & For(control flow)
for i in 0...3{
    print(i)
}

for i in 0..<3{
    print(i)
}

var beatifulImage = [[200,3,100],[100,200,4],[25,6,100]]
print(beatifulImage)

// w2.2.1 inouts and references
func riseLowerValues(inout imageMatrix: [[Int]], value: Int){
    for i in 0 ..< imageMatrix.count {//how many arrays in the imageMatrix
        for j in 0 ..< imageMatrix[i].count {//how many elements in the i array
            if imageMatrix[i][j] < value {
                imageMatrix[i][j] = value
            }
        }
    }
}
riseLowerValues(&beatifulImage, value: 50)
//let array = [1,2,3]
////dropFirst(array)
//array.dropFirst()
//abs(-1)

//Quiz w2
//p2.1
let x = 1

//p2.2
let y:Double = 1

//p2.3
//let z:Int = 1.1

//p2.5
//if true print("true")
//if 1 { print("true")}
if true { print("true")}
if (true) { print("true")}

//p2.7
//ouncesToGrams(ounces: 10)

//p2.8
let arrayOne = [1,2,3,4]
let arrayTwo = [1,2,3.5,4]
//let arrayThree:[Int] = [1,2,3.5,4]
let arrayFour:[Int] = []
let arrayFive = [Int]()

// Week 3 Advanced Swift 
// w3.1 Optionals
