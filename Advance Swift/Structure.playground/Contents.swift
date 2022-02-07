import UIKit
import Foundation

//1, 2, 3
struct Work {
    var workLocation: String = "Vadodara"
    var workHours: Int = 10
    var projectNames: [String] = ["Food Delievery", "Inventory", "Apointment", "Tikit Booking"]
    
    func getProjectNames() -> [String] {
        return projectNames
    }
}

//Automatically generated memberwise initializer
var person = Work (workLocation: "Ahemdabad", workHours: 5)
print(person.projectNames, person.workHours, person.workLocation)

//With default Values
var person1 = Work()
print(person1.projectNames, person1.workHours, person1.workLocation)

//4
struct findOddEven {
    var numbers: [Int]
    var evenArray: [Int] {
        return numbers.filter { $0 % 2 == 0 }
    }
    var oddArray: [Int] {
        return numbers.filter { $0 % 2 != 0 }
    }
}
var result = findOddEven(numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
print(result.evenArray)
print(result.oddArray)
print()

//5
struct Person: Decodable {
    var name: String
    var gender: String
    var age: Int
}
var objPerson1 = Person(name: "Jay", gender: "Male", age: 23)
var objPerson2 = Person(name: "Yagnik", gender: "Male", age: 23)
var objPerson3 = Person(name: "Meet", gender: "Male", age: 23)

var personCollection: [Person] = []
personCollection.append(objPerson1)
personCollection.append(objPerson2)
personCollection.append(objPerson3)
print(personCollection)
print()

//6
struct Example {
    var string = ""
}

var objExample1 = Example(string: "Hello")

var objExample2 = objExample1

objExample2.string = "Hi"
print(objExample1.string)
print(objExample2.string)
objExample1.string = "Hi"
objExample2.string = "Hello"
print(objExample1.string)
print(objExample2.string)

var objExample3 = objExample2
print(objExample3.string)
