//: Playground - noun: a place where people can play

import Foundation
import UIKit

////////////////////////////////////////////////////////////////////////////////////
// Week 2
////////////////////////////////////////////////////////////////////////////////////
// swift tour - book
// let and var

///////////////////////////////////////////
// type inference
let kLabel = "the width is "
let kWidth = 90

///////////////////////////////////////////
// type annotation
// casting to string
let kWidthLabel: String = kLabel + String(kWidth)


///////////////////////////////////////////
// String interpolation formating
let kotherConstant = "\(kLabel) \(kWidth)"

let kDouble = 90.0
let kSecondDouble = 88.0
///////////////////////////////////////////
// String and operation
let kDoubleMessage = "\(kDouble)/\(kSecondDouble) = \(kDouble/kSecondDouble)"

///////////////////////////////////////////
//w2.1 Playground
// see optionals w3.1

///////////////////////////////////////////
//w2.2 Control flow - intervals - guard
for i in 0..<10{
    //guard as a break 
    //guard as a assert
    guard (i != 2) else { continue }
    if i != 5 {
        print(i)
    }
}


///////////////////////////////////////////
//w2.3 Arrays & Dictionaries 
var animals = ["dog", "cat", "bird"]

let array = [1,2,3]
//dropFirst(array)
array.dropFirst()
//abs(-1)


var cuteness = ["dog": "funny",
                "cat": "very cute",
               "bird": "amazing"];
///////////////////////////////////////////
//Dictionary 
//- add key value
cuteness["Panda"]="Extra cute"
cuteness

///////////////////////////////////////////
//Create empty arrays or dictionaries
let emptyArray = [String]()
let emptyDictionary = [String:Float]()
emptyArray
emptyDictionary

let emptyArray2:[String]
let emptyDictionary2:[String:Float]

// an alterntive when type information can be inferred
emptyArray2 = []
emptyDictionary2 = [:]

///////////////////////////////////////////
//w2. Functions
let gramInOunces:Float = 0.035274

func ouncesToGrams(ounces: Float = 0) -> Float
{
    
    return Float(ounces)/Float(gramInOunces)
}

ouncesToGrams(1)

///////////////////////////////////////////
// w2.1.2 Functions & switch 


///////////////////////////////////////////
// w2.2 For(control flow)

for i in 0...3{
    print(i)
}

for i in 0..<3{
    print(i)
}

var beatifulImage = [[200,3,100],[100,200,4],[25,6,100]]
print(beatifulImage)

let interestingNumbers: [String:[Int]] = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
var actualKind = ""

for (kind, numbers) in interestingNumbers {
    actualKind = kind
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
// Print
print("largest value: \(largest) belongs to the kind: \(actualKind)")
print(interestingNumbers["Prime"],interestingNumbers["Fibonacci"], separator:"----", terminator:"**--**")

///////////////////////////////////////////
// w2.2.1 functions - inouts and references
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

///////////////////////////////////////////
// functions - Tuples - compound values - return multiple values
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}

let statistics = calculateStatistics(interestingNumbers["Fibonacci"]!)
// expected output: (.0 1, .1 8, .2 20)
print(statistics.min)
print(statistics.max)
print(statistics.sum)

///////////////////////////////////////////
// functions - variable number of arguments



///////////////////////////////////////////
// switch case 
var vegetable = "red pepper"
//vegetable = "cucumber"
//vegetable = "watercress"

switch vegetable {
    case "celery":
        print("celery case")
    case "cucumber", "watercress":
        print("cucu and water")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)")
    default:
        print("Everything taste good in soup")
}

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

////////////////////////////////////////////////////////////////////////////////////
// Week 3 Advanced Swift 
////////////////////////////////////////////////////////////////////////////////////

// w3.1 Optional types - swift is a type safe language
// - Similar to using "nil" with pointers in Objective-c,
// - They work for any type, not just classes
// - an optional value either contains a value or contains nil.
//
// Problem that they are trying to solve is
// when you access a value but it doesn't exits the program crashes
// because instead a value you get a nil pointer
//
// 1) "!" it brings a value, unwrap automatically
//    - could fail if value is nil and we are not prepare
//    - used when we know it's going to be nil at the begining
// like a property 
// 2) "?" we don't know, so unwrap manually (is it nil? is an optional, unwrap yourself)
//    - f value is nil, just keep going 

var str: String? = nil //it is nil at the begining
str
str?.characters.count //this means "is str nil?" do not force unwrap - it is safe
print(str == nil)

// safe unwrapping 
if (str != nil) { //make it safe
    str!.characters.count //this means "str is not nil! unwrap it"
                          //! force unwrap - if unwrap an it is nil - crash
}

// Optional binding
//str = "Hello"
if let definitelyString = str {
    definitelyString.characters.count
} else {
    print("str is nil!")
}

// Optional binding and guard as assertion 
func testingOptionalBindingWithGuard(maybeString: String?) -> String
{
    //guard as an assertion
    //conditional biding
    guard let definitelyString = maybeString else { return "" }
    return definitelyString
}

// 9:50/25:25 Implicitly unwrapped optional
// "!" used when
// - I get a value from Objective-C - everything is a pointer/optional nil/obj
// always going to be an optional
// obj-C returns something as an optional
// but I don't want to deal with it as an optional 
// then I unwrap it, no matter what
// useful in interfaces

var mostLikelystring: String! = "Hey"
mostLikelystring.characters.count //unwrapped used as it wasn't an optional 

// 14:33/25:25 Optional chaining 

class CupHolder {
    var cups:[String]?
}

class Car {
    var cupHolders:CupHolder?
}

let niceCar = Car()
niceCar.cupHolders = CupHolder()
niceCar.cupHolders?.cups

// this is annoying
if var cupHolder = niceCar.cupHolders { //validate if cupHolders is nil
    if var cups = cupHolder.cups { //validate if cups is nil
        //change
        cups.append("Ginger Ale")
    } else {
        //assign
        niceCar.cupHolders?.cups = ["Milk", "Watter"]
    }
}

// what we want is something like this
// if statements are replaced by "?"
niceCar.cupHolders?.cups?.append("Ginger Ale")
let firstCup = niceCar.cupHolders?.cups?[0]

//w3 Closures
//named function
func performMagic(thingy: String) -> String {
    return thingy
}

let magicFunction = performMagic
magicFunction("Abra Cadabra")

//anonymous definition
let newMagicFuntion = {
    (thingy:String) -> String in
    return thingy
}

let magicFunctionReturn = performMagic("Spell")

func printMagic(thingy: String) {
    print(thingy)
}

let magicPrintFunction = printMagic

let printFunctionReturn = printMagic("Spell")














