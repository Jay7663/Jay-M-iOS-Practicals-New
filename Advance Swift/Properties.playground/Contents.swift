import UIKit
import Foundation
import Darwin

//1 Get Only Properties
class GetOnlyProperties {
    var information: String {
        get {
            return "This is Some Private information stored here"
        }
    }
}
var objGetOnlyProperties = GetOnlyProperties()
print(objGetOnlyProperties.information)
print()

//2, 3
class ComputedProperties {
    var onlyOddNumber: Int = 0
    var portal: Int {
        get {
            return onlyOddNumber
        }
        set(input) {
            if input % 2 != 0 {
                onlyOddNumber = input
            } else {
                print("Number is not ODD !!!")
            }
        }
    }
}
var objComputedProperties = ComputedProperties()
objComputedProperties.portal = 2
print(objComputedProperties.portal)
print()

//4
class PrivateProperties {
    private var data = 10
    
    func getData() -> Int {
        return data
    }
}
var objPrivateProperties = PrivateProperties()
print(objPrivateProperties.getData())
print()

//5
class Person {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
var objPerson1 = Person(id: 1, name: "Jay")
var objPerson2 = Person(id: 2, name: "Yagnik" )
var objPerson3 = Person(id: 3, name: "Meet")

var personCollection: [Person] = []
personCollection.append(objPerson1)
personCollection.append(objPerson2)
personCollection.append(objPerson3)
print(personCollection)
print()

//6 willSet and didSet
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896
print()

//7 Lazy
class Addition {
    init() {
        print("Addition Instance created")
    }
    
    func add(number1: Int, number2: Int) -> Int {
        return number1 + number2
    }
}
class Calculate {
    init() {
        print("Calculate Instance created")
    }
    
    lazy var objAddition = Addition()
}
var objCalculate = Calculate()
print("After Calculate object created")
print(objCalculate.objAddition.add(number1: 4, number2: 4))
print()

//9 Mutating
struct Person1 {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person1 = Person1(name: "Jay")
person1.makeAnonymous()
print(person1.name)
print()
