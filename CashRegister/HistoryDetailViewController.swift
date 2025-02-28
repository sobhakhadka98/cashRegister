//
//  HistoryDetailViewController.swift
//  CashRegister
//
//  Created by Sobha Khadka on 2025-02-28.
//

import UIKit

class HistoryDetailViewController: UIViewController {
    
    var selectedIndex : Int = -1
    var purchaseClass : PurchaseHistoryManager?
    let dateFormatter = DateFormatter();
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var quantity: UILabel!
    
    @IBOutlet weak var timeOfPurchase: UILabel!
    
    @IBOutlet weak var totalAmountPaid: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        purchaseClass = ((UIApplication.shared.delegate) as! AppDelegate).PurchaseHistory
        // Do any additional setup after loading the view.
        if let goodPurchase = purchaseClass?.purchaseHistoryList[selectedIndex] {
            productName.text = "\(goodPurchase.name)"
            quantity.text = "\(goodPurchase.quantity)"
            timeOfPurchase.text = "\(goodPurchase.purchaseDate.formatted(date: .abbreviated, time: .shortened))"
            totalAmountPaid.text = "Total Amount: \(goodPurchase.totalPrice)"
        }
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
