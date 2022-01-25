import UIKit
import Foundation

var namesOfIntegers: [Int: String] = [:]
namesOfIntegers = [1: "One", 2 : "Two"]

//Array
var names: [String] = []

print("names is of type [String] with \(names.count) items.")
names.append("Jay")
print(names)

var numbers = Array(repeating: "Yagnik", count: 3)
print("numbers : \(numbers)")

var thirdStringArray = numbers + names
print("numbers + names = \(thirdStringArray)")

if names.isEmpty {
    print("The names list is empty.")
} else {
    print("The names list isn't empty.")
}

names += ["Meet", "Yagnik"]
print("Meet and Yagnik added to names : \(names)")

names.insert("ABC", at: 0)
print("Names added at 0 \(names)")

names.remove(at: 0)
print("Removed 0 index value from names : \(names)")
print()

//Set
var setNames : Set<String> = ["Jay", "Yagnik", "Meet", "Meet"]
print(setNames)

print("setNames contains  \(setNames.count) items.")

setNames.isEmpty ? print("setNames is Empty.") : print("setNames is not Empty.")

setNames.insert("Jeet")

print("Inserted Jeet \(setNames)")

if let removedItem = setNames.remove("Jayesh") {
    print("\(removedItem) Found and removed")
} else {
    print("Not Found")
}
print()

//Set Operations
var firstSet : Set<Int> = [1, 2, 3, 4, 5, 6, 7]
var secondSet : Set<Int> = [1, 3, 4, 6, 7]

//All values from both (Union)
print(firstSet.union(secondSet).sorted())

//Common values (Intersaction)
print(firstSet.intersection(secondSet).sorted())

//Substraction
print(firstSet.subtracting(secondSet).sorted())


