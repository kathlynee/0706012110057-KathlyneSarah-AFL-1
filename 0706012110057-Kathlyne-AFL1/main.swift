import Foundation

class Main {
    static func run() {
        openScreen()
    }
    
    static func openScreen() {
        print("""
              Welcome to UC-Walk Cafetaria 👨🏻‍🍳👩🏻‍🍳
              Please choose cafetaria:
              
              """)
        for (i, menu) in Cafetaria.cafetaria.enumerated() {
            print("[\(i+1). \(menu)]")
        }
        print("""
              -
              [S]hopping Cart
              [Q]uit \n
              Your cafetaria choice?
              """, terminator: " ")
        let userInput = readLine()!.lowercased()

        switch userInput{
        case "1":
            Tuku.tuku()
        case "2":
            Gotri.gotri()
        case "3":
            Madam.madam()
        case "4":
            Kopte.kopte()
        case "5":
            Gisoe.gisoe()
        case "s":
            Cart.showCart()
        case "q":
            exit(0)
        default:
            print("Please Input Correctly")
            openScreen()
        }
    }
}

// Run Program
Main.run()
