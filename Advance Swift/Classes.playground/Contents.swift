import UIKit
import Foundation

//1, 2
class Values {
    var college: String?
    var name: String?
    var department: String?
    
    init(college: String, name: String) {
        self.college = college
        self.name = name
    }
    init(name: String, department: String) {
        self.name = name
        self.department = department
    }
    
    func setDetails(college: String, name: String) {
        self.college = college
        self.name = name
    }
    func getDetails() -> (String?, String?, String?) {
        return(name, college, department)
    }
}

var obj = Values(college: "Charusat", name: "Jay")
print(obj.getDetails())
print()

//3
class withoutInit {
    static var id: Int = 1
    static var name: String = "Jay"
}

print(withoutInit.id, withoutInit.name)

//4
class SquareOfNumber {
    var squareOfNumber: Int = 1
    func doSquare(number: Int) {
        squareOfNumber = number * number
    }
}
var operation = SquareOfNumber()
operation.doSquare(number: 2)
print(operation.squareOfNumber)

//5
class ParentClass {
    let pi = 3.14
}

class Child1: ParentClass {
    var radius: Double
    var circumference: Double = 0
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func findCircumference() {
        circumference = 2 * pi * radius
    }
}

class Child2: ParentClass {
    var radius: Double
    var circumference: Double = 0
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func findCircumference() {
        circumference = 2 * pi * radius
    }
}

var child1 = Child1(radius: 5)
child1.findCircumference()
print(child1.circumference)
var child2 = Child2(radius: 10)
child2.findCircumference()
print(child2.circumference)

//6
class Addition {
    func calculate(number1: Int, number2: Int) -> Int {
        return number1 + number2
    }
}
class Substraction: Addition {
    override func calculate(number1: Int, number2: Int) -> Int {
        return number1 - number2
    }
}

var objSubstraction = Substraction()
print(objSubstraction.calculate(number1: 2, number2: 4))
print()

//7
class ValueClass {
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func doPower(power: Double) -> Double {
        return pow(number, power)
    }
}
var objValue = ValueClass(number: 5)
print(objValue.doPower(power: 3))
print()

//8
class Vehicles {
    var tireCount: Int = 0
}

class Bike: Vehicles {
    var vehicleName = ""
    var description: String {
        return "This is \(vehicleName) having \(tireCount) Tires"
    }
}

class Car: Vehicles {
    var vehicalType = ""
    var description: String {
        return "This is Car of Type \(vehicalType) and has \(tireCount) Tires"
    }
}
var objBike = Bike()
objBike.vehicleName = "Splendor"
objBike.tireCount = 2

var objCar = Car()
objCar.vehicalType = "LMV"
objCar.tireCount = 4

print(objBike.description)
print(objCar.description)
print()

//9
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func greet() {
        print("Hello, \(name) !!!")
    }
}
var person = Person(name: "Meet")
person.greet()
print()

//10
class Example {
    var string = ""
}

let objExample1 = Example()
objExample1.string = "Hello"

let objExample2 = objExample1

objExample2.string = "Hi"
print(objExample1.string)
print(objExample2.string)
