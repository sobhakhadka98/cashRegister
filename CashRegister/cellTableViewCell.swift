//
//  cellTableViewCell.swift
//  CashRegister
//
//  Created by Sobha Khadka on 2025-02-28.
//

import UIKit

class cellTableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var quantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
