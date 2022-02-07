import UIKit

enum ErrorsList: Error {
    case passwordTooShort
    case emptyPassword
}

class PasswordValidation {
    static func checkPassword(password: String) throws {
        if password.isEmpty {
            throw ErrorsList.emptyPassword
        } else if password.count < 8 {
            throw ErrorsList.passwordTooShort
        } else {
            print("Password can be used.")
        }
    }
}

do {
    try PasswordValidation.checkPassword(password: "Jay Modhawadiya")
} catch ErrorsList.emptyPassword {
    print("Password is Empty ! Please enter valid Password.")
} catch ErrorsList.passwordTooShort {
    print("Password is too Short ! Needs atleast 8 Characters.")
}
print()

//2
enum ShoppingCartErrors: Error {
    case itemNotFound
    case outOfStock
}

struct Item {
    var price: Int
    var quantity: Int
}
class ShoppingCart {
    var inventory = [
        "Shirt": Item(price: 123, quantity: 0),
        "Pant": Item(price: 123, quantity: 2),
        "Top": Item(price: 123, quantity: 1)
    ]
    func buyItem(itemName: String, quantityToBuy: Int) throws {
        guard let item = inventory[itemName] else {
            throw ShoppingCartErrors.itemNotFound
        }
        if item.quantity >= quantityToBuy {
            print("Items are available to buy.")
        } else {
            throw ShoppingCartErrors.outOfStock
        }
    }
}

var shoppingCart = ShoppingCart()
do {
    try shoppingCart.buyItem(itemName: "Pant", quantityToBuy: 2)
} catch ShoppingCartErrors.itemNotFound {
    print("Item is not available in store.")
} catch ShoppingCartErrors.outOfStock {
    print("Not available enough Items.")
} catch {
    print("Unknown Exception Occured")
}
