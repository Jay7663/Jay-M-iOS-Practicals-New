import UIKit
import Foundation

var string1 : String? = "Hello"
var string2 : String?
var intVar : Int? = 1
let unwrapped : String! = "This is Implicitly unwrapped String"

//Forced Unwrapping
print(string1!)

//implicitly unwrapped optional string
print(unwrapped)

//if let   (Optional binding)
if let name = string2 {
    print(name)
}

//guard let
guard let name1 = intVar else {
    exit(1)
}

print("After Guard let \(name1)")

// nil-coalescing operator
string1 != nil ? print(string1!) : print("Its Null")

print(string2 ?? "It can be Nil")

let defaultColorName = "red"
var userDefinedColorName: String?
var colorNameToUse = userDefinedColorName ?? defaultColorName
print(colorNameToUse)
