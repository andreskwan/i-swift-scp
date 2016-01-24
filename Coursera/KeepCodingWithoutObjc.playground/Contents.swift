//: ### Arrays
var words = ["uno", "dos"]
//words = words + "tres"
words = words + ["tres"]
words.description

//: ### Dictionaries
var numberNamesDic = [1: "one", 2: "two"]
numberNamesDic[1]
numberNamesDic[2]
numberNamesDic[3]

//: ### iterations
for (key,value) in numberNamesDic {
    print("\t\(key)\t\(value)")
}

//: ### Iterate over ranges
for i in Range(start: 1, end: 5){
    print(i)
}

for i in 1...4{
    print(i)
}





