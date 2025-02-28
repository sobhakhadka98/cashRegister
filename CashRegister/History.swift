//
//  History.swift
//  CashRegister
//
//  Created by Sobha Khadka on 2025-02-28.
//

import Foundation

class Purchase {
    var id : UUID = UUID()
    var name : String = ""
    var quantity : Int = 0
    var totalPrice : Double = 0
    var purchaseDate : Date;
   
    init(name: String, totalPrice: Double = 0, quantity: Int = 0) {
        self.name = name
        self.totalPrice = totalPrice
        self.quantity = quantity
        self.purchaseDate = Date()
    }
}
 
class PurchaseHistoryManager {
    var purchaseHistoryList : [Purchase] = [];
 
    func addNewPurchase(newPurchase: Purchase) {
        purchaseHistoryList.append(newPurchase)
        print("New Purchase: \(newPurchase.purchaseDate)")
    }
   
}
 
