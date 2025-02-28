//
//  RestockViewController.swift
//  CashRegister
//
//  Created by Sobha Khadka on 2025-02-28.
//

import UIKit

class RestockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var newQuantity: UITextField!
    
    var productClass : ProductManager?
    var selectedIndex : Int = -1
    var selectedIndexPath : IndexPath = []

    @IBOutlet weak var productTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        productClass = ((UIApplication.shared.delegate) as! AppDelegate).ProductModel
        productTable.dataSource = self
        productTable.delegate = self
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
        selectedIndex = indexPath.row
        selectedIndexPath = indexPath
    }
    
    @IBAction func Restock(_ sender: Any) {
        if selectedIndex == -1 {
            let alert = UIAlertController(title: "Product not selected", message: "Please select product first", preferredStyle: .alert)
                            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        } else if newQuantity.text!.isEmpty {
            let alert = UIAlertController(title: "Invalid Quantity", message: "Quantity cannot be empty", preferredStyle: .alert)
                            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        } else if let goodQuantity = newQuantity.text {
            
            if Int(goodQuantity) == nil {
                let alert = UIAlertController(title: "Invalid Quantity", message: "Quantity has to be a number", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            } else if Int(goodQuantity)! < 0 {
                let alert = UIAlertController(title: "Invalid Quantity", message: "Quantity has to be greater than 0", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            } else {
                productClass!.ProductList[selectedIndex].quantity += Int(newQuantity.text!)!
                newQuantity.text = ""
                productTable.deselectRow(at: selectedIndexPath, animated: true)
                selectedIndex = -1
                productTable.reloadData()
            }
        }
    }
    
    
    @IBAction func cancelRestock(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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
