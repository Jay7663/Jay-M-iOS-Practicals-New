import UIKit
import Foundation

//11 TypeMethods with static
class Addition {
    static func doAddition (number1: Int, number2: Int) -> Int {
        return number1 + number2
    }
}
print(Addition.doAddition(number1: 2, number2: 2))

//12 TypeMethod with calass
class Parent {
    class func printSomething() {
        print("This is Parent Class method")
    }
}
class Child: Parent {
    override class func printSomething() {
        print("This is Child class method")
    }
}
Child.printSomething()
