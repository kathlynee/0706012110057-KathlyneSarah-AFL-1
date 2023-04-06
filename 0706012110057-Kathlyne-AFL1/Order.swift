//
//  Order.swift
//  0706012110057-Kathlyne-AFL1
//
//  Created by MacBook Pro on 07/04/23.
//

import Foundation
// constructor sebagai representasi order cafetaria
class Order {
    var shopName: String
    var itemName: String
    var quantity: Int
    var price: Int
    
    init(shopName: String, itemName: String, quantity: Int, price: Int) {
        self.shopName = shopName
        self.itemName = itemName
        self.quantity = quantity
        self.price = price
    }
}
