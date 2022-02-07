import UIKit
import Foundation

//13
struct WeekDays {
    let weekDaysArray: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    subscript (dayNumber: Int) -> String {
        if dayNumber > 0 && dayNumber < 8 {
            return weekDaysArray[dayNumber - 1]
        } else {
            return "Invalid Input"
        }
    }
}
let objWeekDays = WeekDays()
print(objWeekDays[1])

//14
struct CharAt {
    var string = ""
    
    subscript (index: Int) -> Character {
        return [Character](string)[index]
    }
}

var charAt = CharAt(string: "Jay Modhawadiya")
print(charAt[2])
print()

//15
struct FindCharsInRange {
    var string = ""
    
    subscript (start: Int, end: Int) -> String {
        var result = ""
        for index in start...end {
            result += String([Character](string)[index])
        }
        return result
    }
}

var findCharsInRange = FindCharsInRange(string: "Jay Modhawadiya")
print(findCharsInRange[0, 5])
print()

//16
struct FindIntsInRange {
    var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    
    subscript (start: Int, end: Int) -> [Int] {
        var resultArray: [Int] = []
        
        for index in start...end {
            resultArray.append(numbers[index])
        }
        return resultArray
    }
}

var findIntsInRange = FindIntsInRange()
print(findIntsInRange[5, 8])
print()

//17
struct DictionaryArray {
    var dictionaryArray = [1: "Hello", 2: "Hi"]
    
    subscript (key: Int) -> String {
        if let result = dictionaryArray[key] {
            return result
        } else {
            return "Not Found !!!"
        }
    }
}

var dictionaryArray = DictionaryArray()
print(dictionaryArray[1])
print()

//18
class Person {
    let name: String
    let age: Int
    let birthDate: String
    
    init(name: String, age: Int, birthDate: String) {
        self.name = name
        self.age = age
        self.birthDate = birthDate
    }
}
class PersonCollection {
    var arrayOfPerson: [Person] = []
    
    subscript (name: String) -> Person? {
        for person in arrayOfPerson {
            if person.name == name {
                return person
            }
        }
        return nil
    }
}

var personObj1 = Person(name: "Jay", age: 23, birthDate: "01/01/2000")
var personObj2 = Person(name: "Yagnik", age: 23, birthDate: "01/01/2000")
var personObj3 = Person(name: "Meet", age: 23, birthDate: "01/01/2000")
var objpersonCollection = PersonCollection()
objpersonCollection.arrayOfPerson.append(personObj1)
objpersonCollection.arrayOfPerson.append(personObj2)
objpersonCollection.arrayOfPerson.append(personObj3)

if let result = objpersonCollection["Jay"] {
    print("Name : \(result.name)")
    print("Age : \(result.age)")
    print("BirthDate : \(result.birthDate)")
}
