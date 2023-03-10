//
//  main.swift
//  0706012110057-Kathlyne-AFL1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

let symbolsSet = CharacterSet(charactersIn: "=< >`~!@#$%^&*()-_+={}[]|;:'\",.<>?/")
var uc_walk = ["Tuku-Tuku", "Gotri", "Madam Lie", "Kopte", "Gisoe"]
var tuku_menu = ["Tahu isi", "Nasi kuning", "Nasi campur", "Air Mineral"]
var gotri_menu = ["Nasi goreng", "Indomie Kuah", "Jus Alpukat", "Mie Goreng"]
var madam_menu = ["Ayam Geprek", "Bebek Goreng", "Jus Jeruk", "Es Teh"]
var kopte_menu = ["Teh Tarik", "Thai Tea", "Kopi Tarik", "Kopi Vietnam"]
var gisoe_menu = ["Capuccino", "Latte", "Espresso", "Donat Kentang"]
var tuku_price = [5000, 15000, 20000, 5000]
var gotri_price = [25000, 15000, 10000, 15000]
var madam_price = [28000, 30000, 80000, 5000]
var kopte_price = [15000, 18000, 20000, 18000]
var gisoe_price = [20000, 18000, 15000, 10000]
var userInput: String = ""
var item_tuku: String = ""
var item_gotri: String = ""
var item_madam: String = ""
var item_kopte: String = ""
var item_gisoe: String = ""
var cart_menu:[String] = []
var cart_shop: [String] = []
var cart_total_price : Int = 0
var price: Int = 0
var dupe = false
var index = 0
var totalAwal = 0

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
    case"2":
        gotri()
        break
    case"3":
        madam()
        break
    case"4":
        kopte()
        break
    case"5":
        gisoe()
        break
    case"s":
        shoppingCartScreen()
        break
    case"q":
        exit(0)
    default:
        openScreen()
    }
   }


func tuku(){
    dupe = false
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
        
        if !(item_tuku.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(tuku_menu[0])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 0
                }
            }
            let totalAkhir = Int(item_tuku)! + totalAwal
            cart_menu[index] = "\(tuku_menu[0]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(tuku_menu[0]) x\(item_tuku)")
            cart_shop.append("Tuku-Tuku")
        }
        
                
                price = tuku_price[0] * (Int(item_tuku) ?? 0)
                
                cart_total_price += price
                
                tuku()
        break
    case"2":
        print("""
              \(tuku_menu[1]) @ \(tuku_price[1].formatted())
              How many \(tuku_menu[1]) do you want to buy?
              """, terminator: " ")
        item_tuku = readLine()!
        
        if !(item_tuku.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(tuku_menu[1])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 1
                }
            }
            let totalAkhir = Int(item_tuku)! + totalAwal
            cart_menu[index] = "\(tuku_menu[1]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(tuku_menu[1]) x\(item_tuku)")
            cart_shop.append("Tuku-Tuku")
        }
                
                price = tuku_price[1] * (Int(item_tuku) ?? 1)
                
                cart_total_price += price
        
        tuku()
        break
    case"3":
        print("""
              \(tuku_menu[2]) @ \(tuku_price[2].formatted())
              How many \(tuku_menu[2]) do you want to buy?
              """, terminator: " ")
        item_tuku = readLine()!
        
        if !(item_tuku.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(tuku_menu[2])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 2
                }
            }
            let totalAkhir = Int(item_tuku)! + totalAwal
            cart_menu[index] = "\(tuku_menu[2]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(tuku_menu[2]) x\(item_tuku)")
            cart_shop.append("Tuku-Tuku")
        }
                
                price = tuku_price[2] * (Int(item_tuku) ?? 2)
                
                cart_total_price += price
        
        tuku()
        break
    case"4":
        print("""
              \(tuku_menu[3]) @ \(tuku_price[3].formatted())
              How many \(tuku_menu[3]) do you want to buy?
              """, terminator: " ")
        item_tuku = readLine()!
        
        if !(item_tuku.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(tuku_menu[3])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 3
                }
            }
            let totalAkhir = Int(item_tuku)! + totalAwal
            cart_menu[index] = "\(tuku_menu[3]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(tuku_menu[3]) x\(item_tuku)")
            cart_shop.append("Tuku-Tuku")
        }
                
                price = tuku_price[3] * (Int(item_tuku) ?? 3)
                
                cart_total_price += price
        
        tuku()
        break
    case"b":
        openScreen()
    default:
        openScreen()
    }
    
}

func gotri(){
    dupe = false
    print("""
Hi, welcome back to Gotri!
What would you like to order?
""")
    for(i, menu) in gotri_menu.enumerated(){
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
              \(gotri_menu[0]) @ \(gotri_price[0].formatted())
              How many \(gotri_menu[0]) do you want to buy?
              """, terminator: " ")
        item_tuku = readLine()!
        
        if !(item_gotri.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(gotri_menu[0])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 0
                }
            }
            let totalAkhir = Int(item_gotri)! + totalAwal
            cart_menu[index] = "\(gotri_menu[0]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(gotri_menu[0]) x\(item_gotri)")
            cart_shop.append("Tuku-Tuku")
        }
                
                price = gotri_price[0] * (Int(item_gotri) ?? 0)
                
                cart_total_price += price
                
                gotri()
        break
    case"2":
        print("""
              \(gotri_menu[1]) @ \(gotri_price[1].formatted())
              How many \(gotri_menu[1]) do you want to buy?
              """, terminator: " ")
        item_gotri = readLine()!
        
        if !(item_gotri.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(gotri_menu[1])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 1
                }
            }
            let totalAkhir = Int(item_gotri)! + totalAwal
            cart_menu[index] = "\(gotri_menu[1]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(gotri_menu[1]) x\(item_gotri)")
            cart_shop.append("Gotri")
        }
                
                price = gotri_price[1] * (Int(item_gotri) ?? 1)
                
                cart_total_price += price
        
        gotri()
        break
    case"3":
        print("""
              \(gotri_menu[2]) @ \(gotri_price[2].formatted())
              How many \(gotri_menu[2]) do you want to buy?
              """, terminator: " ")
        item_gotri = readLine()!
        
        if !(item_gotri.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(gotri_menu[2])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 2
                }
            }
            let totalAkhir = Int(item_gotri)! + totalAwal
            cart_menu[index] = "\(gotri_menu[2]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(gotri_menu[2]) x\(item_gotri)")
            cart_shop.append("Gotri")
        }
                
                price = gotri_price[2] * (Int(item_gotri) ?? 2)
                
                cart_total_price += price
        
        gotri()
        break
    case"4":
        print("""
              \(gotri_menu[3]) @ \(gotri_price[3].formatted())
              How many \(gotri_menu[3]) do you want to buy?
              """, terminator: " ")
        item_gotri = readLine()!
        
        if !(item_gotri.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(gotri_menu[3])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 3
                }
            }
            let totalAkhir = Int(item_gotri)! + totalAwal
            cart_menu[index] = "\(gotri_menu[3]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(gotri_menu[3]) x\(item_gotri)")
            cart_shop.append("Gotri")
        }
                
                price = gotri_price[3] * (Int(item_gotri) ?? 3)
                
                cart_total_price += price
        
        gotri()
        break
    case"b":
        openScreen()
    default:
        openScreen()
    }
}

func madam(){
    dupe = false
    print("""
Hi, welcome back to Madam Lie!
What would you like to order?
""")
    for(i, menu) in madam_menu.enumerated(){
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
              \(madam_menu[0]) @ \(madam_price[0].formatted())
              How many \(madam_menu[0]) do you want to buy?
              """, terminator: " ")
        item_madam = readLine()!
        
        
        if !(item_madam.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(madam_menu[0])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 0
                }
            }
            let totalAkhir = Int(item_gotri)! + totalAwal
            cart_menu[index] = "\(madam_menu[0]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(madam_menu[0]) x\(item_madam)")
            cart_shop.append("Madam Lie")
        }
                
                price = madam_price[0] * (Int(item_madam) ?? 0)
                
                cart_total_price += price
                
                madam()
        break
    case"2":
        print("""
              \(madam_menu[1]) @ \(madam_price[1].formatted())
              How many \(madam_menu[1]) do you want to buy?
              """, terminator: " ")
        item_madam = readLine()!
        
        if !(item_madam.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(madam_menu[1])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 0
                }
            }
            let totalAkhir = Int(item_gotri)! + totalAwal
            cart_menu[index] = "\(madam_menu[1]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(madam_menu[1]) x\(item_madam)")
            cart_shop.append("Madam Lie")
        }
                
                price = madam_price[1] * (Int(item_madam) ?? 1)
                
                cart_total_price += price
        
        madam()
        break
    case"3":
        print("""
              \(madam_menu[2]) @ \(madam_price[2].formatted())
              How many \(tuku_menu[2]) do you want to buy?
              """, terminator: " ")
        item_madam = readLine()!
        
        if !(item_madam.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(madam_menu[2])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 2
                }
            }
            let totalAkhir = Int(item_madam)! + totalAwal
            cart_menu[index] = "\(madam_menu[2]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(madam_menu[2]) x\(item_madam)")
            cart_shop.append("Madam Lie")
        }
                
                price = madam_price[2] * (Int(item_madam) ?? 2)
                
                cart_total_price += price
        
        madam()
        break
    case"4":
        print("""
              \(madam_menu[3]) @ \(madam_price[3].formatted())
              How many \(gotri_menu[3]) do you want to buy?
              """, terminator: " ")
        item_madam = readLine()!
        
        if !(item_madam.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(madam_menu[3])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 3
                }
            }
            let totalAkhir = Int(item_madam)! + totalAwal
            cart_menu[index] = "\(madam_menu[3]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(madam_menu[3]) x\(item_madam)")
            cart_shop.append("Madam Lie")
        }
                
                price = madam_price[3] * (Int(item_madam) ?? 3)
                
                cart_total_price += price
        
        madam()
        break
    case"b":
        openScreen()
    default:
        openScreen()
    }
}

func kopte(){
    dupe = false
    print("""
Hi, welcome back to Kopte!
What would you like to order?
""")
    for(i, menu) in kopte_menu.enumerated(){
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
              \(kopte_menu[0]) @ \(kopte_price[0].formatted())
              How many \(kopte_menu[0]) do you want to buy?
              """, terminator: " ")
        item_kopte = readLine()!
        
        if !(item_kopte.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(kopte_menu[0])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 0
                }
            }
            let totalAkhir = Int(item_kopte)! + totalAwal
            cart_menu[index] = "\(kopte_menu[0]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(kopte_menu[0]) x\(item_kopte)")
            cart_shop.append("Kopte")
        }
                
                price = kopte_price[0] * (Int(item_kopte) ?? 0)
                
                cart_total_price += price
                
                kopte()
        break
    case"2":
        print("""
              \(kopte_menu[1]) @ \(kopte_price[1].formatted())
              How many \(kopte_menu[1]) do you want to buy?
              """, terminator: " ")
        item_kopte = readLine()!
        
        if !(item_kopte.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(kopte_menu[1])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 1
                }
            }
            let totalAkhir = Int(item_kopte)! + totalAwal
            cart_menu[index] = "\(kopte_menu[1]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(kopte_menu[1]) x\(item_kopte)")
            cart_shop.append("Kopte")
        }
                
                price = kopte_price[1] * (Int(item_kopte) ?? 1)
                
                cart_total_price += price
        
        kopte()
        break
    case"3":
        print("""
              \(kopte_menu[2]) @ \(kopte_price[2].formatted())
              How many \(kopte_menu[2]) do you want to buy?
              """, terminator: " ")
        item_kopte = readLine()!
        
        if !(item_kopte.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(kopte_menu[2])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 2
                }
            }
            let totalAkhir = Int(item_kopte)! + totalAwal
            cart_menu[index] = "\(kopte_menu[2]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(kopte_menu[2]) x\(item_kopte)")
            cart_shop.append("Kopte")
        }
                
                price = kopte_price[2] * (Int(item_kopte) ?? 2)
                
                cart_total_price += price
        
        kopte()
        break
    case"4":
        print("""
              \(kopte_menu[3]) @ \(kopte_price[3].formatted())
              How many \(kopte_menu[0]) do you want to buy?
              """, terminator: " ")
        item_kopte = readLine()!
        
        if !(item_kopte.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(kopte_menu[3])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 3
                }
            }
            let totalAkhir = Int(item_kopte)! + totalAwal
            cart_menu[index] = "\(kopte_menu[3]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(kopte_menu[3]) x\(item_kopte)")
            cart_shop.append("Kopte")
        }
                
                price = kopte_price[3] * (Int(item_kopte) ?? 3)
                
                cart_total_price += price
        
        kopte()
        break
    case"b":
        openScreen()
    default:
        openScreen()
    }
}

func gisoe(){
    dupe = false
    print("""
Hi, welcome back to Gisoe!
What would you like to order?
""")
    for(i, menu) in gisoe_menu.enumerated(){
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
              \(gisoe_menu[0]) @ \(gisoe_price[0].formatted())
              How many \(gisoe_menu[0]) do you want to buy?
              """, terminator: " ")
        item_gisoe = readLine()!
        
        if !(item_gisoe.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(gisoe_menu[0])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 0
                }
            }
            let totalAkhir = Int(item_gisoe)! + totalAwal
            cart_menu[index] = "\(gisoe_menu[0]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(gisoe_menu[0]) x\(item_gisoe)")
            cart_shop.append("Gisoe")
        }
                
                price = gisoe_price[0] * (Int(item_gisoe) ?? 0)
                
                cart_total_price += price
                
                gisoe()
        break
    case"2":
        print("""
              \(gisoe_menu[1]) @ \(gisoe_price[1].formatted())
              How many \(gisoe_menu[1]) do you want to buy?
              """, terminator: " ")
        item_gisoe = readLine()!
        
        if !(item_gisoe.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(gisoe_menu[1])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 1
                }
            }
            let totalAkhir = Int(item_gisoe)! + totalAwal
            cart_menu[index] = "\(gisoe_menu[1]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(gisoe_menu[1]) x\(item_gisoe)")
            cart_shop.append("Gisoe")
        }
                
                price = gisoe_price[1] * (Int(item_gisoe) ?? 1)
                
                cart_total_price += price
        
        gisoe()
        break
    case"3":
        print("""
              \(gisoe_menu[2]) @ \(gisoe_price[2].formatted())
              How many \(gisoe_menu[2]) do you want to buy?
              """, terminator: " ")
        item_gisoe = readLine()!
        
        if !(item_gisoe.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(gisoe_menu[2])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 2
                }
            }
            let totalAkhir = Int(item_gisoe)! + totalAwal
            cart_menu[index] = "\(gisoe_menu[2]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(gisoe_menu[2]) x\(item_gisoe)")
            cart_shop.append("Gisoe")
        }
                
                price = gisoe_price[2] * (Int(item_gisoe) ?? 2)
                
                cart_total_price += price
        
        gisoe()
        break
    case"4":
        print("""
              \(gisoe_menu[3]) @ \(gisoe_price[3].formatted())
              How many \(gisoe_menu[3]) do you want to buy?
              """, terminator: " ")
        item_gisoe = readLine()!
        
        if !(item_gisoe.range(of: #"^\d+$"#, options: .regularExpression) != nil) {
            print("\nYou can only input number\n")
            tuku()
        }
        
        print("Thankyou for ordering.\n")
        
        for (indexItem, item) in cart_menu.enumerated(){
            if item.contains("\(gisoe_menu[3])"){
                dupe = true
                index = indexItem
            }
        }
        
        if dupe{
            let dupe_menu = cart_menu[index].split(separator: " ")
            for item in dupe_menu{
                if item.contains("x"){
                    totalAwal = Int(item.dropFirst()) ?? 3
                }
            }
            let totalAkhir = Int(item_gisoe)! + totalAwal
            cart_menu[index] = "\(gisoe_menu[3]) x\(totalAkhir)"
        }else{
            cart_menu.append("\(gisoe_menu[3]) x\(item_gisoe)")
            cart_shop.append("Gisoe")
        }
                
                price = gisoe_price[3] * (Int(item_gisoe) ?? 3)
                
                cart_total_price += price
        
        gisoe()
        break
    case"b":
        openScreen()
    default:
        openScreen()
    }
}

func shoppingCartScreen() {
    if cart_menu.isEmpty {
        print("Your cart is empty.")
    } else {
        print("Your order:")
        for i in 0..<cart_menu.count {
            print("- \(cart_menu[i]) from \(cart_shop[i])")
        }
    }
    print("""
          [B]ack to Main Menu
          [P]ay / Checkout
          Your choice?
          """, terminator: " ")
    userInput = readLine()!.lowercased()

    switch userInput{
    case"b":
        openScreen()
    case"p":
        checkout()
    default:
        shoppingCartScreen()
    }
}

func checkout() {
    print("Your total order: \(cart_total_price.formatted())")
    var payment = 0
    repeat {
        print("Enter the amount of your money:", terminator: " ")
        if let input = readLine(), let inputAmount = Int(input) {
            if inputAmount <= 0 {
                print("Payment can't be zero.")
            } else {
                payment = inputAmount
            }
        } else {
            print("Please enter a valid amount.")
        }
    } while payment <= 0
    let change = payment - cart_total_price
    print("You pay: \(payment.formatted()) Change: \(change.formatted())")
    print("Enjoy your meals!")
    cart_menu = []
    cart_shop = []
    cart_total_price = 0
    print("Press [return] to go back to main screen:", terminator: " ")
    _ = readLine()
    openScreen()
}

extension Int {
    func formatted() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "id_ID")
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}


