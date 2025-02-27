//
//  Product.swift
//  CashRegister
//
//  Created by Sobha Khadka on 25/02/2025.
//

import Foundation

class Product {
    var id : UUID = UUID()
    var name : String = ""
    var pricePerItem : Double = 0
    var quantity : Int = 0
    
    init(name: String, pricePerItem: Double = 0, quantity: Int = 0) {
        self.name = name
        self.pricePerItem = pricePerItem
        self.quantity = quantity
    }
}

class ProductManager {
    var ProductList : [Product] = [
        Product(name: "Pants", pricePerItem: 9.9, quantity: 37),
        Product(name: "Shoes", pricePerItem: 59.9, quantity: 26),
        Product(name: "Hats", pricePerItem: 14.9, quantity: 57),
        Product(name: "Tshirts", pricePerItem: 19.9, quantity: 47),
        Product(name: "Dresses", pricePerItem: 64.9, quantity: 23)
    ]
    
}
