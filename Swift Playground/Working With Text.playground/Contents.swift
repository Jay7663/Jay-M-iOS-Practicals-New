import UIKit

import Foundation

var string = "Hello, World"

//1
print(string.count)
string.count > 2 ? print(Array(string)[0], Array(string)[1]) : print(string)
print()

//2
if string.count > 2 {
    string.removeLast()
    string.removeFirst()
    print(string)
} else {
    print("String must be atleast 2 Char long")
}
print()

//3
var string1 = "Hello"
var string2 = "World"

if string1.isEmpty && string2.isEmpty {
    print("Both Strings must be having atleast 1 Character")
} else {
    string1.removeFirst()
    string2.removeFirst()
    print(string1+string2)
}
print()

//4
string = "Hello World"

if string.count > 2 {
    string.append(string.removeFirst())
    string.append(string.removeFirst())
    print(string)
} else {
    print("Length must be atleast 2 Character")
}

//5
string = "Swift"
print(string.starts(with: "Sw"))
print()

//6
string = "Hello World"
var newString : String = ""
var nChars = 3

newString = newString + String(string.prefix(nChars))
newString = newString + String(string.suffix(nChars))

print(newString)
