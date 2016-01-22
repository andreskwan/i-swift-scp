//: Playground - noun: a place where people can play

import Cocoa
//import Foundation
//import UIKit

//: Playground - noun: a place where people can play

////////////////////////////////////////////////////////////////////////////////////
//: # Week 2
////////////////////////////////////////////////////////////////////////////////////
// swift tour - book
//: ## let and var

///////////////////////////////////////////
//: ### variables - type inference
let kLabel = "the width is "
let kWidth = 90

///////////////////////////////////////////
//: ### variables - type annotation
//: #### casting to string
let kWidthLabel: String = kLabel + String(kWidth)

///////////////////////////////////////////
//: ### Variables - Type aliases
//: #### define an alternative name for an existing type
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

//: ### Types - everything is a agregate type (enum, struct or class)
//: #### Convertions among types - we need initializers
let answer = Double(42) //From Int to Double

///////////////////////////////////////////
//: # Strings is a collection!!! array of characters

//: ## Defining Strings using string literals
let myFirstString = "mo 💰"
let mySecondString = "mo problems"

//: ## String concatenation
let theTruth = myFirstString + ", " + mySecondString

//: ## Emoji characters
//: ### bring the emoji keyboard by ctrl+command+space bar
let similarTruth = "💰can't buy me 💖"


//: ## String interpolation
// is a way to construct a new String value from a mix of:
// constants, variables, literals an expressions by
//    including their values inside a string literal. 
// Each item that you insert into the string literal 
// is wrapped in a pair of parentheses, prefixed by a backslash
// https://www.weheartswift.com/higher-order-functions-map-filter-reduce-and-more/

let kotherConstant = "\(kLabel) \(kWidth)"
//: ### Plain string
var doggyDiet = "Lulu eats 25lbs of dog food per month"
//: ### String with variables
var dogName = "Ferris"
//var ferrisPic = UIImage(named:"SpringerdoodleFerris.jpg")!
doggyDiet = "\(dogName) eats 25lbs of dog food per month"

//: ### String with variables and expression
var lbsPerDay = 0.75
var daysPerMonth:Double = 30.0
doggyDiet = "\(dogName) eats \(lbsPerDay) of dog food per month"

//var frankiePic = UIImage(named:"frankie.jpeg")!
lbsPerDay = 0.25
dogName = "Lil Frankie"
doggyDiet = "\(dogName) eats \(lbsPerDay) of dog food per month"
//: ### String interpolation and operations
let kDouble = 90.0
let kSecondDouble = 88.0
let kDoubleMessage = "\(kDouble)/\(kSecondDouble) = \(kDouble/kSecondDouble)"


//: ## A String isn't just a String

//: ### A String is an Array of Characters
var password = "Meet me in St. Louis"
for character in password.characters {
    if character == "e" {
        print("found an e!")
    } else {
    }
}

//: ### A String can be treated as an NSString
let newPassword = password.stringByReplacingOccurrencesOfString("e", withString: "3")

///////////////////////////////////////////
//: ## w2.1 Playground
//: ### see optionals w3.1

///////////////////////////////////////////
//: ## w2.2 Control flow - intervals - guard
for i in 0..<10{
    //guard as a break
    //guard as a assert
    guard (i != 2) else { continue }
    if i != 5 {
        print(i)
    }
}


///////////////////////////////////////////
//: ## w2.3 Collections - Arrays & Dictionaries - or Generics
//: #### all collections are "value type" - duplication if inout not used


///////////////////////////////////////////
//: ### Tuples
let tuplas: (String, Int)
tuplas = ("8",8)
print(tuplas)

// is just a string
// just store data - like CGPoint - structures - not associated methods
let tuplina = ("hola")
print(tuplina)

// empty tuple
let tuplaVacia = ()
print(tuplaVacia)

///////////////////////////////////////////
//: ### Tuples - Patern matching 

///////////////////////////////////////////
//: ### Arrays
//
var numbers = Array<Int>(count: 5, repeatedValue: 3)
var numbers2 = [Int](count: 3, repeatedValue: 8)

var concatenatedArray = numbers + numbers2
var sequenceArray = [Int](0...5)

var animals = ["dog", "cat", "bird"]

let array = [1,2,3]
//dropFirst(array)
array.dropFirst()
sequenceArray.dropLast(3)//last three elements
//abs(-1)

///////////////////////////////////////////
//: #### map - array function
let arrayMapModified = animals.map({animal in "\(animal) is cute!"})
arrayMapModified

///////////////////////////////////////////
//: ### Dictionaries
//- add key value

var animalCuteness = ["dogs": "funny",
    "cats": "very cute",
    "birds": "amazing"];

animalCuteness["Pandas"]="Extra cute"
animalCuteness

var namesOfIntegers: [String: Int] = ["One": 1 ,"Two": 2,"Three": 3]

///////////////////////////////////////////
//: #### Dictionaries and map 
let arrayFromDictionary = animalCuteness.map({(animalSpecie,cuteness) in "\(animalSpecie) are \(cuteness)"})
arrayFromDictionary

///////////////////////////////////////////
//: ### Dictionaries and optionals
//: #### Because it is possible to request a key for which no value exists, a dictionary’s
//: #### subscript returns an optional value of the dictionary’s value type.

namesOfIntegers["Four"]   //return "nil"
namesOfIntegers["Four"] = 4
namesOfIntegers
namesOfIntegers.updateValue(8, forKey: "Eight")//create the key:value
namesOfIntegers
namesOfIntegers.updateValue(8, forKey: "Four")//update the value of the key
namesOfIntegers
namesOfIntegers.removeValueForKey("Ten")
namesOfIntegers

///////////////////////////////////////////
//: ## Create empty arrays or dictionaries
let emptyArray = [String]()
let emptyDictionary = [String:Float]()
emptyArray
emptyDictionary

let emptyArray2:[String]
let emptyDictionary2:[String:Float]

//: ### an alterntive when type information can be inferred
emptyArray2 = []
emptyDictionary2 = [:]

///////////////////////////////////////////
//: ## w2. Functions
///////////////////////////////////////////
//: ###  functions - Parameters
//: #### let - parameters are constants by default
//: #### var - value type - parameters are copies and can be modified
//: #### inout - reference type - parameters passed by reference - is the value - take care

///////////////////////////////////////////
//: ## functions - Default parameter values
let gramInOunces:Float = 0.035274
func ouncesToGrams(ounces: Float = 0) -> Float
{
    return Float(ounces)/Float(gramInOunces)
}

ouncesToGrams(1)

///////////////////////////////////////////
// w2.1.2 Functions & switch


///////////////////////////////////////////
//: ## w2.2 For(control flow)

for i in 0...3{
    print(i)
}

for i in 0..<3{
    print(i)
}

var beatifulImage = [[200,3,100],[100,200,4],[25,6,100]]
print(beatifulImage)

///////////////////////////////////////////
//: ## For - Iterating a dictionary
let interestingNumbers: [String:[Int]] = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
var actualKind = ""

//each item in the dictionary is returned as a (key,value) tuple
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
//: ## w2.2.1 functions - inouts pass by reference
// performace - do not copy - pass by reference
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
//: ## functions - return multiple values - Tuples - compound values
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

var coordinates = (54.2667,8.4833)
let (lat,_) = coordinates //just extract the latitud
print("latitud is \(lat)")

var coordinates2 = (lat: 54.2667,lon: 8.4833)
print("latitud is \(coordinates2.lat)")

///////////////////////////////////////////
//: ## w3 function - Closures
//: ### named function
func performMagic(thingy: String) -> String {
    return thingy
}

let magicFunction = performMagic
magicFunction("Abra Cadabra")

///////////////////////////////////////////
//: ### defining an anonymous function
let newMagicFunction = {
    (thingy:String) -> String in //function signature
    return thingy
}

newMagicFunction("Dissapear")

let magicFunctionReturn = performMagic("Spell")
magicFunctionReturn

func printMagic(thingy: String) {
    print(thingy)
}

let magicPrintFunction = printMagic

//let printFunctionReturn() = printMagic("Spell")
//printFunctionReturn

///////////////////////////////////////////
//: ## functions - variable number of arguments


///////////////////////////////////////////
//: ## switch case
// "patter matching"
// - we can match against integers, strings, a range, a tuple, or an enumeration.


// Against a string
var vegetable = "red pepper"
//vegetable = "cucumber"
//vegetable = "watercress"

switch vegetable {
    case "celery":                         //pm - string
        print("celery case")
    case "cucumber", "watercress":         //pm -
        print("cucu and water")
    case let x where x.hasSuffix("pepper")://pm -
        print("Is it a spicy \(x)")
    default:
        print("Everything taste good in soup")
}

///////////////////////////////////////////
//: ## Quiz w2
///////////////////////////////////////////
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
//: ## Week 3 Advanced Swift
////////////////////////////////////////////////////////////////////////////////////

// w3.1 Optional types - swift is a type safe language
//
// Optional is a type, is defined as a enum
// because "enum" can have associated values
//
// enum Optional{
//    case None
//    case Some(T)
//}
//
// Swift - nil is the absence of a value, not a pointer
// Objective-C nil is a pointer to a nonexistent object
//
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

///////////////////////////////////////////
//: ##  Fourced Unwrapping
// safe unwrapping
if (str != nil) { //make it safe
    str!.characters.count //this means "str is not nil! unwrap it"
    //! force unwrap - if unwrap an it is nil - crash
}

///////////////////////////////////////////
//: ## Optional binding
//str = "Hello"
if let definitelyString = str {
    definitelyString.characters.count
} else {
    print("str is nil!")
}

///////////////////////////////////////////
//: ## Optional binding and guard as assertion
func testingOptionalBindingWithGuard(maybeString: String?) -> String
{
    //guard as an assertion
    //conditional biding
    guard let definitelyString = maybeString else { return "" }
    return definitelyString
}


///////////////////////////////////////////
//: ## 9:50/25:25 Implicitly unwrapped optional
// "!" used when
// - I get a value from Objective-C - everything is a pointer/optional nil/obj
// always going to be an optional
// obj-C returns something as an optional
// but I don't want to deal with it as an optional
// then I unwrap it, no matter what (I need to know what it is)
//
// useful in interfaces (known to be bound)
// @IBOutlet weak var tableView: UITableView!


var mostLikelystring: String! //only nil at when declared = "Hey"
// from here I don't neet to do an optional binding or force unwrapping
mostLikelystring = "This is a string"
mostLikelystring.characters.count //unwrapped used as it wasn't an optional

// 14:33/25:25 Optional chaining

///////////////////////////////////////////
//: ## Classes
// default values & initializers

class CupHolder {
    var cups:[String]?
    var pepino: String?
    required init(cups:[String],pepino:String){
        self.cups = cups
        self.pepino = pepino
    }
    
    convenience init() {
        self.init(cups:[],pepino:"")
    }
    
    // dealloc
    deinit {
        
    }
}

class Car {
    var cupHolders:CupHolder?
}

let niceCar = Car()
//niceCar.cupHolders = CupHolder(cups: [], pepino: "")
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



///////////////////////////////////////////
//: ## value types - by value by reference
//by value - copy
var a = 6
var b = a
b = 8
b
a

//by reference
struct StructNumber {
    var n: Int
    init(n: Int){
        self.n = n
    }
}
var aStructNum = StructNumber(n: 8)
var bStructNum = aStructNum

aStructNum.n
bStructNum.n = 106
bStructNum.n
aStructNum.n
// Structs are not ARC

///////////////////////////////////////////
//by reference - pointer
class Number {
    var n: Int
    init(n: Int){
        self.n = n
    }
}

var aNumber = Number(n: 8)
var bNumber = aNumber

aNumber.n
bNumber.n = 106
bNumber.n
aNumber.n

//// Inheritance
//class SupperNumber: NSNumber {
//    override
//}

///////////////////////////////////////////
//: ## String vs NSString
//var nsstring: NSString = "\U0001F496"
//var string: String = "\U0001F496"
//
//nsstring.length
//string.characters.count

///////////////////////////////////////////
// Enumerations
///////////////////////////////////////////

enum CompassPoint
{
    case North
    case South
    case East
    case West
}

var directionToHead = CompassPoint.East //type CompassPoint
directionToHead = .North //type inferred, then use short syntax

///////////////////////////////////////////
//Enumeratons and optionals

enum Optional
{
    //can store associated values of any given type
    //value types can be different for each case
    case None
    case SomeSpecificType(type:String)
}

enum Result
{
    case Success(Int)
    case Error(Int, String)
}

let success = Result.Success(5)
let error = Result.Error(0, "You miss it!")

///////////////////////////////////////////
// Enum - raw values - associated values
// each raw value should be unique
// - You can define Swift enumerations to store associated values of any given type, 
//   and the value types can be different for each case of the enumeration if needed.

// enum types
enum Suit: String
{
    case Heart = "H"
    case Diamond = "d"
    case Spade = "s"
    case Club = "c"
}

Suit.Club
Suit.Diamond

var cardSuit = Suit.Diamond
cardSuit
var cardSuitValue = Suit.Diamond.rawValue

enum TypeOfVeggies: Int {
    case Carrots = 1
    case Tomatoes
}

var veggieValue = TypeOfVeggies.Tomatoes.rawValue
veggieValue = 100

enum HealtyVeggies: String {
    case Carrots
    case Tomatoes
}

var tomatoes = HealtyVeggies.Tomatoes
tomatoes
tomatoes.rawValue

func eatVeggies(veggie: HealtyVeggies) -> String{
    return veggie.rawValue
}

eatVeggies(HealtyVeggies.Tomatoes)

let veggie = HealtyVeggies(rawValue: "Lead")
// I need to unwrap veggie
if let veg = veggie {
    eatVeggies(veg)
}

let carrot = HealtyVeggies(rawValue: "pepino")
let bunnieMeal = carrot?.rawValue

let whatsForDinner = eatVeggies(.Carrots)

///////////////////////////////////////////
//Properties - Ownership - Strong and weak - private and public
// Ownership and memory management ARC
// class are allocated and initialized
// class Legs { // is "internal" by default
// - only can be accessed by entities in the same file
public class Legs {
    var count: Int = 0 //Strong reference
}

// If animal is dealocated so its legs
class Animal {
    
}

class Mammal: Animal {
    
}

class Carnivore: Mammal {
    
}

class Feline: Carnivore {
    
}

class Canine: Carnivore {

}

// what makes a Lion a Lion? 
// roar
// hair
// color
// size
// herd
class Lion: Feline {
    var name: String = ""    //Strong reference
    var legs: Legs = Legs()  //Strong reference - the animal own its legs
    // Property observers and computed properties
    // - a property that depends on another property
    var uppercaseName: String {
        get{
            return name.uppercaseString
        }
        set{
            name = newValue.uppercaseString
        }
    }
}

// legVet don't own the legs - when deallocated - legs are not deallocated
public class LegVet {
    // "weak" attribute - does not increase reference counting
    public weak var legs: Legs? = nil
}

// reference to an Animal
// referenced by one
// let dog = Animal() can't be deallocated!!! I need "var" here
// "nil" can't be assigned to type "Animal"
// so it should be an "optional Animal"
var dog:Lion? = Lion()
dog?.uppercaseName = "Paco"
dog?.legs.count = 4
dog?.name

let vet = LegVet()

// if dog is deallocated vet.legs now are nill
// is not nil yet, if in the future I'll change this
vet.legs = dog?.legs
// when I want to use "nil" I need to start to use optionals ?
// this "nil" force me to add "?" everywhere
dog = nil
    vet.legs = dog?.legs



///////////////////////////////////////////
// Inheritance - overriding - what about abstract and concrete classes???

class SuperNumber: NSNumber {
    override func getValue(value: UnsafeMutablePointer<Void>) {
        super.getValue(value)
    }
}
extension NSNumber {
    func superCoolGetter() -> Int {
        return 5
    }
}

let n = NSNumber(int: 4)
n.superCoolGetter()

///////////////////////////////////////////
// Protocols or interfaces

protocol danceble {
    func dance()
}

// instead of use inheritance, use composition (interface or protocol)
class Person: danceble {
    func dance() {
    }
}

extension NSNumber: danceble {
    func superEvilNumber() -> Int {
        return 666
    }
    func dance() {
        
    }
}

///////////////////////////////////////////
//: ## Property observes - called every time a property's value is set
//: ### Observers
//: ### willSet - value before change
//: ### didSet  - value after change
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newValue) {
            print("About to set totalSteps to \(newValue)")
        }
        didSet {
            print("Added \(totalSteps - oldValue) steps")
        }
    }
}

let steps = StepCounter()
steps.totalSteps = 5
steps

struct Animals {
    var name: String = ""
    var heightInches = 0.0
    var heightCM:Double
}

