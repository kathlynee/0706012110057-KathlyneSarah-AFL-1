//
//  Cart.swift
//  0706012110057-Kathlyne-AFL1
//
//  Created by MacBook Pro on 07/04/23.
//

import Foundation
//Menentukan objek item pada cart
protocol CartItem {
    var menu: String { get }
    var shop: String { get }
    var quantity: Int { get }
    var price: Int { get }
}

//Implementasi dari protocol Cart Item
struct CartData: CartItem {
    let menu: String
    let shop: String
    let quantity: Int
    let price: Int
}

class Cart {
    static var items = [CartItem]()
    
    // method menambahkan item baru ke array items
    static func addToCart(menu: String, shop: String, quantity: Int, price: Int) {
        if let index = items.firstIndex(where: { $0.menu == menu && $0.shop == shop }) {
            // Item already exists, increment quantity
            items[index] = CartData(menu: menu, shop: shop, quantity: items[index].quantity + quantity, price: price)
        } else {
            // Item doesn't exist, add new item
            let item = CartData(menu: menu, shop: shop, quantity: quantity, price: price)
            items.append(item)
        }
    }
    
    // menampilkan isi cart
    static func showCart() {
        if items.count > 0 {
            var total = 0
            var shopItems = [String: [CartData]]()
            print("Your Shopping Cart\n")
            for item in items {
                let cartItem = item as! CartData
                if shopItems[cartItem.shop] == nil {
                    shopItems[cartItem.shop] = [cartItem]
                } else {
                    shopItems[cartItem.shop]!.append(cartItem)
                }
            }
            for (shop, cartItems) in shopItems {
                print("Your order from \(shop)")
                var shopTotal = 0
                for cartItem in cartItems {
                    print("- \(cartItem.quantity) x \(cartItem.menu) @ \(cartItem.price.formatted())")
                    shopTotal += cartItem.price
                }
                print("Subtotal: \(shopTotal.formatted())\n")
                total += shopTotal
            }
            print("Total: \(total.formatted())\n")
            print("[C]heckout\n[D]elete Item\n[B]ack to Main Menu\n")
            print("Your choice?", terminator: " ")
            let userInput = readLine()!.lowercased()
            switch userInput {
            case "c":
                checkout()
            case "d":
                deleteItem()
            case "b":
                Main.openScreen()
            default:
                print("Please Input Correctly")
                showCart()
            }
        } else {
            print("Cart is Empty\n")
            Main.openScreen()
        }
    }

    
    // menghapus isi cart yang diinput user
    static func deleteItem() {
        if items.count > 0 {
            print("\n Delete Item \n")
            for (i, item) in items.enumerated() {
                let cartItem = item as! CartData
                print("\(i+1). \(cartItem.menu) @ \(cartItem.price.formatted()) (\(cartItem.shop))")
            }
            print("0. Cancel\n")
            print("\nWhich item do you want to delete? (Input item number)")
            let userInput = readLine()!
            if let itemNumber = Int(userInput), itemNumber >= 0 && itemNumber <= items.count {
                if itemNumber == 0 {
                    showCart()
                } else {
                    items.remove(at: itemNumber-1)
                    showCart()
                }
            } else {
                print("\nPlease Input Correctly\n")
                deleteItem()
            }
        } else {
            print("Cart is Empty\n")
            Main.openScreen()
        }
    }
    
    //pembayaran
    static func checkout() {
        var payment = 0
        if items.count > 0 {
            var total = 0
            for item in items {
                let cartItem = item as! CartData
                print("Your order from \(cartItem.shop)")
                print("- \(cartItem.quantity) x \(cartItem.menu) @ \(cartItem.price.formatted())")
                total += cartItem.price
            }
            print("Your total order: \(total.formatted())")
            repeat {
                print("Enter the amount of your money:", terminator: " ")
                if let input = readLine(), let inputAmount = Int(input) {
                    if inputAmount <= 0 {
                        print("Payment can't be zero.\n")
                    } else if inputAmount < total {
                        print("Please enter a valid amount.\n")
                    } else {
                        payment = inputAmount
                    }
                } else {
                    print("Please enter a valid amount.\n")
                }
            } while payment <= 0 || payment < total
            let change = payment - total
            print("You pay: \(payment.formatted()) Change: \(change.formatted())")
            print("Enjoy your meals!\n")
            items.removeAll()
            print("Press [return] to go back to main screen:", terminator: " ")
            _ = readLine()
            Main.openScreen()
        }
    }
}
// extension agar inputan user bisa menjadi Rp
extension Int {
    func formatted() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
