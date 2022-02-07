import UIKit
import Foundation

enum Days: Int,CaseIterable {
    case Monday = 1
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
    
    var shortForm: String {
        switch self {
        case .Monday:
            return "mon"
        case .Tuesday:
            return "tue"
        case .Wednesday:
            return "wed"
        case .Thursday:
            return "thu"
        case .Friday:
            return "fri"
        case .Saturday:
            return "sat"
        case .Sunday:
            return "sun"
        }
    }
}
//1, 5, 8
var enterDayNumber = 2
if let day1 = Days(rawValue: enterDayNumber) {
    print(day1.shortForm)
}
print()

//2
enum Months: Int {
    case January = 1
    case February
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
}
var monthNumber = 3
if let month = Months(rawValue: monthNumber) {
    switch month {
    case .January:
        print("\(31) Days in January")
    case .February:
        print("\(28) Days in February")
    case .March:
        print("\(31) Days in March")
    case .April:
        print("\(30) Days in April")
    case .May:
        print("\(31) Days in May")
    case .June:
        print("\(30) Days in June")
    case .July:
        print("\(31) Days in July")
    case .August:
        print("\(31) Days in August")
    case .September:
        print("\(30) Days in September")
    case .October:
        print("\(31) Days in October")
    case .November:
        print("\(30) Days in November")
    case .December:
        print("\(31) Days in December")
    }
}
print()

//4
enum DaysString: String {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}
print(DaysString.Monday.rawValue)
var day = Days.Monday

//5 CaseIterable
print("Number of Days are : \(Days.allCases.count)")
print()
print("All Days in Loop")

for dayOfWeek in Days.allCases {
    print(dayOfWeek)
}
print()

//6 Associated Values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

switch day {
case .Monday:
    print("Monday")
default :
    print("Else")
}
print()

//Raw Value
if let day1 = Days(rawValue: 7) {
    print(day1)
}
print()

//Recursive Enumerations
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
print()
