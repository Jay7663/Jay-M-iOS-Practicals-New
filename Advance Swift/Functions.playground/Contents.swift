import UIKit
import Foundation

//with 1 param
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Meet"))
print()

//with multiple params
func greet(person: String, alreadyGreeted: Bool) -> String {
    return alreadyGreeted ? "Hello Nice to meet you again \(person)" : "nice to meet you \(person)"
}
print(greet(person: "Meet", alreadyGreeted: true))
print()

//without return value
func printMessage (name: String) {
    print("Hello thia message is for \(name)")
}
printMessage(name: "Meet")
print()

//multiple return value with optional
func calculate (number1: Int, number2: Int) -> (addition: Int, substraction: Int)? {
    return (number1 + number2, number1 - number2)
}

if let result = calculate(number1: 2, number2: 2) {
    print("Addition is \(result.addition). Substraction is \(result.substraction)")
}
print()

//implicit return, if 1 line expression
func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}

print(greeting(for: "Meet"))

//Argument Labels
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Meet", from: "Ahemdabad"))

// without labels
func greet(_ person: String, _ hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet("Meet", "Ahemdabad"))

//Default Parameter Values
func sumFunction(number1: Int, number2: Int = 12) -> Int {
    return number1 + number2
}
print(sumFunction(number1: 8))

//Variadic Parameters
func arraySum(_ numbers: Int...) -> Int {
    var sum : Int = 0
    for number in numbers {
        sum = sum + number
    }
    return sum
}

print(arraySum(1, 2, 3, 4, 5))
print()

//In-Out Parameters
func swapTwoInts(_ number1: inout Int, _ number2: inout Int) {
    let temporaryA = number1
    number1 = number2
    number2 = temporaryA
}
print()

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
print()

//function type
var mathFunction: (Int, Int) -> Int = sumFunction
print(mathFunction(10, 5))

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(sumFunction, 3, 5)
