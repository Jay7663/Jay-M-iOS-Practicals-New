import UIKit
import Foundation

//1
var number = 100

for i in 1...number/15 {
    let temp = (pow(2, i) as NSDecimalNumber).intValue
    
    if temp > number {
        break
    } else {
        print(temp)
    }
}
print()

//2
number = 3

for _ in 1...number {
    for _ in 1...number{
        print("*",terminator: " ")
    }
    print()
}
print()

//3
number = 4

for i in 1...number {
    for _ in 1...i {
        print("*",terminator: " ")
    }
    print()
}
print()

//4
number = 5
var i = 1
var counter = 0

while true{
    
    if i % 2 != 0 {
        for _ in stride(from: number * 2, to: i ,by: -1) {
            print(" " , terminator: "")
        }
    }
    
    for _ in 1...i {
        if i % 2 != 0 {
            print("*", terminator: "")
        }
    }
    
    if i % 2 != 0 {
        print()
        counter = counter + 1
    }
    
    if number == counter {
        break
    }
    
    i = i + 1
}
print()

//5
number = 17
var flag = true

for i in 2...number-1 {
    if number % i == 0 {
        flag = false
        break
    }
}
if flag {
    print("Number \(number) is Prime")
} else {
    print("Number \(number) is Not Prime")
}
