import UIKit
import Foundation

//1
var code = [
    "a" : "b",
    "b" : "c",
    "c" : "d",
    "d" : "e",
    "e" : "f",
    "f" : "g",
    "g" : "h",
    "h" : "i",
    "i" : "j",
    "j" : "k",
    "k" : "l",
    "l" : "m",
    "m" : "n",
    "n" : "o",
    "o" : "p",
    "p" : "q",
    "q" : "r",
    "r" : "s",
    "s" : "t",
    "t" : "u",
    "u" : "v",
    "v" : "w",
    "w" : "x",
    "x" : "y",
    "y" : "z",
    "z" : "a"
]

var encodedMessage = "uijt nfttbhf jt ibse up sfbe"
var result = ""

for character in encodedMessage {
    
    if character == " " {
        result = result + String(character)
    }
    
    for (key,value) in code {
        if(String(character) == value) {
            result = result + key
        }
    }
}

print(result)
print()

//2
var people: [[String:String]] = [
    [
    "firstName": "Calvin",
    "lastName": "Newton"
    ],
    [
    "firstName": "Garry",
    "lastName": "Mckenzie"
    ],
    [
    "firstName": "Leah",
    "lastName": "Rivera"
    ],
    [
    "firstName": "Sonja",
    "lastName": "Moreno"
    ],
    [
    "firstName": "Noel",
    "lastName": "Bowen"
    ]
]

var firstNameArray = [String]()
for (object) in people {
    if let tempName = object["firstName"] {
        firstNameArray.append(tempName)
    }
}
print(firstNameArray)
print()

//3
var fullName = [String]()
for object in people {
    if let fName = object["firstName"] , let lName = object["lastName"] {
        fullName = fullName + ["\(fName) \(lName)"]
    }
}
print(fullName)
print()

//4
var peopleScore: [[String:Any]] = [
    [
        "firstName": "Calvin",
        "lastName": "Newton",
        "score": 13
    ],
    [
        "firstName": "Garry",
        "lastName": "Mckenzie",
        "score": 12
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera",
        "score": 10
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno",
        "score": 3
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen",
        "score": 16
    ]
]

var smallest = 1234567890

for object in peopleScore {
    if let score = object["score"] {
        var temp : Int
        temp = score as! Int
        if temp < smallest {
            smallest = temp
        }
    }
}
for object in peopleScore {
    if let temp = object["score"] , let firstName = object["firstName"] ,
        let lastName = object["lastName"] {
            if temp as! Int == smallest {
                print("\(firstName) \(lastName)")
            }
    }
}
print()

//5
var scoreValue = [Int]()

for object in peopleScore {
    if let score = object["score"]{
        scoreValue = scoreValue + [(score as! Int)]
    }
}

var reversedScoreValue = Array(scoreValue.sorted().reversed())

for i in 0...reversedScoreValue.count - 1 {
    let dictionaryIndex = scoreValue.firstIndex(of: reversedScoreValue[i])
    
    if let firstnameLowScore = peopleScore[dictionaryIndex!]["firstName"] {
        print(i + 1,".",firstnameLowScore ,terminator: " ")
    }
    
    if let lastnameLowScore = peopleScore[dictionaryIndex!]["lastName"] {
        print(lastnameLowScore,terminator: " ")
    }
    
    if let scoreLow = peopleScore[dictionaryIndex!]["score"] {
        print("-",scoreLow)
    }
}
print()

//6
var numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]
var dictionary: [Int : Int] = [:]
numbers.sort()
var counter = 0
var compareElement = numbers[0]

for number in numbers {
    if number == compareElement {
        counter += 1
        dictionary[number] = counter
    } else {
        compareElement = number
        counter = 1
        dictionary[number] = counter
    }
}

var keys = dictionary.keys.sorted()

for key in keys {
    if let counts = dictionary[key] {
        print("\(key) \(counts)")
    }
}
