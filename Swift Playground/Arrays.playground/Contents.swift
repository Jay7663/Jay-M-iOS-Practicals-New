import UIKit
import Foundation

var numbers = [1,2,3,4,5,1]

//1
if(numbers.first == numbers.last) {
    print("First and Last is Equal")
}
print()

//2
var initialArray = [1,2,3,4]
var array : [Int] = Array(repeating: 0, count: initialArray.count * 2)
array.insert(initialArray[initialArray.count-1], at: array.count)
print(array)
print()

//3
print(numbers.prefix(upTo: 2))
print()

//4
if let maxNumber = numbers.max() {
    print(maxNumber)
}
print()

//5
print(numbers.sorted() {$0 < $1})
print()

//6
var listOfNumbers = [1,2,3,10,100]
var divisors = [2,5]

for i in 0...listOfNumbers.count - 1  {
    
    for j in 0...divisors.count - 1 {
        
        if listOfNumbers[i] % divisors[j] == 0 {
            print(listOfNumbers[i])
            break
        }
    }
}
print()
