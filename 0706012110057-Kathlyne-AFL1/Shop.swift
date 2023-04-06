//
//  Shop.swift
//  0706012110057-Kathlyne-AFL1
//
//  Created by MacBook Pro on 07/04/23.
//

import Foundation

protocol ShopProtocol {
    var name: String { get }
    var menu: [String] { get }
    var price: [Int] { get }
    func showMenu()
}

// implementasi dari ShopProtocol yang sudah diinisialisasi
class Shop: ShopProtocol {
    let name: String
    let menu: [String]
    let price: [Int]
    
    init(name: String, menu: [String], price: [Int]) {
        self.name = name
        self.menu = menu
        self.price = price
    }
    
    func showMenu() {
        print("""
              Hi, welcome back to \(name)!
              What would you like to order?
              
              """)
        for (i, item) in menu.enumerated() {
            print("[\(i+1). \(item)]")
        }
        print("""
              -
              [B]ack to Main Menu \n
              Your menu choice?
              """, terminator: " ")
        let userInput = readLine()!.lowercased()
        switch userInput {
        case "b":
            Main.openScreen()
        case let input where Int(input) != nil && Int(input)! <= menu.count:
            let menuChoice = Int(input)! - 1
            print("""
                  \(menu[menuChoice]) @ \(price[menuChoice].formatted())
                  How many \(menu[menuChoice]) do you want to buy?
                  """, terminator: " ")
            let item = readLine()!
            guard let quantity = Int(item) else {
                print("\nYou can only input number\n")
                showMenu()
                return
            }
            print("Thank you for ordering.\n")
            let chosenMenu = menu[menuChoice]
            let chosenPrice = price[menuChoice] * quantity
            Cart.addToCart(menu: chosenMenu, shop: name, quantity: quantity, price: chosenPrice)
            showMenu()
        default:
            print("Please Input Correctly")
            showMenu()
        }
    }
}

// Class turunan Shop
class Tuku: Shop {
    init() {
        super.init(name: "Tuku-Tuku", menu: ["Nasi Uduk", "Nasi kuning", "Nasi campur", "Air Mineral"], price: [5000, 15000, 20000, 5000])
    }
    
    static func tuku() {
        let tuku = Tuku()
        tuku.showMenu()
    }
}

class Gotri: Shop {
    init() {
        super.init(name: "Gotri", menu: ["Nasi Goreng", "Indomie Kuah", "Jus Alpukat", "Mie Goreng"], price: [25000, 15000, 10000, 15000])
    }
    
    static func gotri() {
        let gotri = Gotri()
        gotri.showMenu()
    }
}

class Madam: Shop {
    init() {
        super.init(name: "Madam Lie", menu: ["Ayam Geprek", "Bebek Goreng", "Kerupuk", "Es Teh"], price: [28000, 30000, 80000, 5000])
    }
    
    static func madam() {
        let madam = Madam()
        madam.showMenu()
    }
}

class Kopte: Shop {
    init() {
        super.init(name: "Kopte", menu: ["Teh Tarik", "Thai Tea", "Kopi Tarik", "Kopi Vietnam"], price: [15000, 18000, 20000, 18000])
    }
    
    static func kopte() {
        let kopte = Kopte()
        kopte.showMenu()
    }
}

class Gisoe: Shop {
    init() {
        super.init(name: "Gisoe", menu: ["Capuccino", "Latte", "Espresso", "Donat Kentang"], price: [20000, 18000, 15000, 10000])
    }
    
    static func gisoe() {
        let gisoe = Gisoe()
        gisoe.showMenu()
    }
}
