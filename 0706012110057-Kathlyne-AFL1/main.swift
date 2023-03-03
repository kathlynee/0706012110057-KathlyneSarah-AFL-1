//
//  main.swift
//  0706012110057-Kathlyne-AFL1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

var uc_walk = ["Tuku-Tuku", "Gotri", "Madam Lie", "Kopte", "Gisoe"]
var tuku_menu = ["Tahu isi", "Nasi kuning", "Nasi campur", "Air Mineral"]
var tuku_price = [5000, 15000, 20000, 5000]
var userInput: String = ""
var item_tuku: String = ""
var cart_menu:[String] = []
var cart_shop: [String] = []
var cart_total_price : Int = 0
var price: Int = 0

openScreen()

func openScreen(){
    print("""
      Welcome to UC-Walk Cafetaria 👨🏻‍🍳👩🏻‍🍳
      Please choose cafetaria:
      
""")
    for(i, menu) in uc_walk.enumerated(){
        print("[\(i+1)\(". ")\(menu)]")
    }
    print("""
            -
            [S]hopping Cart
            [Q]uit
            Your cafetaria choice?
            """, terminator: " ")
      
      
      userInput = readLine()!.lowercased()
    
    switch userInput{
    case"1":
        tuku()
        break
    case"s":
        openScreen()
        break
    case"q":
        exit(0)
    default:
        openScreen()
    }
   }


func tuku(){
    print("""
Hi, welcome back to Tuku-Tuku!
What would you like to order?
""")
    for(i, menu) in tuku_menu.enumerated(){
        print("[\(i+1)\(". ")\(menu)]")
    }
    print("""
            -
            [B]ack to Main Menu
            Your menu choice?
            """, terminator: " ")
      userInput = readLine()!.lowercased()
   
    
    switch userInput{
    case"1":
        print("""
              \(tuku_menu[0]) @ \(tuku_price[0].formatted())
              How many \(tuku_menu[0]) do you want to buy?
              """, terminator: " ")
        item_tuku = readLine()!
        print("Thankyou for ordering.\n")
        
        cart_menu.append("\(tuku_menu) x\(item_tuku)")
        cart_shop.append("Tuku-Tuku")
                
                price = tuku_price[0] * (Int(item_tuku) ?? 0)
                
                cart_total_price += price
                
                tuku()
        break
    case"2":
        print("""
              \(tuku_menu[0]) @ \(tuku_price[0].formatted())
              How many \(tuku_menu[0]) do you want to buy?
              """, terminator: " ")
        item_tuku = readLine()!
        print("Thankyou for ordering.\n")
        tuku()
        break
    case"3":
        print("""
              \(tuku_menu[0]) @ \(tuku_price[0].formatted())
              How many \(tuku_menu[0]) do you want to buy?
              """, terminator: " ")
        item_tuku = readLine()!
        print("Thankyou for ordering.\n")
        tuku()
        break
    case"4":
        print("""
              \(tuku_menu[0]) @ \(tuku_price[0].formatted())
              How many \(tuku_menu[0]) do you want to buy?
              """, terminator: " ")
        item_tuku = readLine()!
        print("Thankyou for ordering.\n")
        tuku()
        break
    case"b":
        openScreen()
    default:
        openScreen()
    }
    
}




