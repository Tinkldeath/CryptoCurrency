//
//  CoinTableViewCell.swift
//  CryptoCurrency
//
//  Created by Dima on 20.10.22.
//

import UIKit

class CoinTableViewCell: UITableViewCell, CryptoCoinCellView {
   
    override func awakeFromNib() {
        super.awakeFromNib()
        self.frame = self.bounds
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBOutlet weak var symbol: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var changePercent24Hr: UILabel!
    @IBOutlet var priceUsd: UILabel!
    @IBOutlet var rank: UILabel!
    
    func display(symbol: String) {
        self.symbol.text = symbol
    }
    
    func display(name: String) {
        self.name.text = name
    }
    
    func display(priceUsd: Double) {
        self.priceUsd.text = "\(Double(round(priceUsd*100)/100)) USD"
    }
    
    func display(rank: Int) {
        self.rank.text = "Rank: \(rank)"
    }
    
    func display(changePercent24Hr: Double) {
        let tuple = changePercent24Hr < 0 ? (sign: "", color: UIColor.red) : (sign: "+", color: UIColor.green)
        self.changePercent24Hr.text = tuple.sign + "\(Double(round(changePercent24Hr*1000000)/1000000))%"
        self.changePercent24Hr.textColor = tuple.color
    }
    
}
