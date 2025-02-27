//
//  ViewController.swift
//  CashRegister
//
//  Created by Sobha Khadka on 2025-02-14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var productQuantity: UILabel!
    
    @IBOutlet weak var productType: UILabel!
    
    @IBOutlet weak var productTotalPrice: UILabel!
    
    var productClass : ProductManager?
    var purchaseClass : PurchaseHistoryManager?
    var quantity : Int = 0
    var selectedIndex: Int = -1
    
    @IBOutlet weak var productTable: UITableView!
    
    var productPerItemPrice : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productClass = ((UIApplication.shared.delegate) as! AppDelegate).ProductModel
        purchaseClass = ((UIApplication.shared.delegate) as! AppDelegate).PurchaseHistory
        productTable.dataSource = self
        productTable.delegate = self
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (productClass?.ProductList.count)!
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell")!
        if let goodProduct = productClass?.ProductList[indexPath.row] {
            cell.textLabel?.text = "\(goodProduct.name)"
            cell.detailTextLabel?.text = "\(goodProduct.quantity)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        productType.text = (productClass?.ProductList[indexPath.row])?.name
        productPerItemPrice = (productClass?.ProductList[indexPath.row].pricePerItem)!
        selectedIndex = indexPath.row
    }
    
    
    @IBAction func numClicked(_ sender: UIButton) {
        //check productitemprice 0 if yes throw alert
        if(productPerItemPrice == 0){
            let alert = UIAlertController(title: "Product not selected!", message: "You Have to select a product before you enter quantity", preferredStyle: .actionSheet)
                            
                            alert.addAction(UIAlertAction(title: "OK", style: .default))
                            present(alert, animated: true)
        } else {
            quantity = quantity * 10 + sender.tag
            productQuantity.text = "\(quantity)"
            productTotalPrice.text = "\(productPerItemPrice*Double(quantity))"
        }
        
    }
    
    
    @IBAction func buyClicked(_ sender: Any) {
        //check qunatity
        if(quantity <= 0){
            let alert = UIAlertController(title: "Invalid Quantity", message: "Qunatity needs to be greater than 0", preferredStyle: .actionSheet)
                            
                            alert.addAction(UIAlertAction(title: "OK", style: .default))
                            present(alert, animated: true)
        } else if((productClass?.ProductList[selectedIndex].quantity)! < quantity){
            let alert = UIAlertController(title: "Not enough products!", message: "Sorry!! We don't have enough in stock", preferredStyle: .actionSheet)
                            
                            alert.addAction(UIAlertAction(title: "OK", style: .default))
                            present(alert, animated: true)
        } else {
            productClass!.ProductList[selectedIndex].quantity -= quantity
            var newPurchase = Purchase(name: productType.text, quantity: quantity, totalPrice: productPerItemPrice*Double(quantity))
            purchaseClass?.addNewPurchase(newPurchase: newPurchase)
            productType.text = "Product Type"
            productQuantity.text = "Quantity"
            productTotalPrice.text = "Total"
            productTable.reloadData()
        }
    }
    
}

