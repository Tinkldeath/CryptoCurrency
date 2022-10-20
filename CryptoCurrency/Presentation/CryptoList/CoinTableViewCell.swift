//
//  CoinTableViewCell.swift
//  CryptoCurrency
//
//  Created by Dima on 20.10.22.
//

import UIKit

protocol CryptoCoinCellView {
    func display(symbol: String)
    func display(name: String)
    func display(priceUsd: Double)
    func display(rank: Int)
    func display(changePercent24Hr: Double)
}

class CoinTableViewCell: UITableViewCell {
       
    @IBOutlet weak var symbol: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var changePercent24Hr: UILabel!
    @IBOutlet weak var priceUsd: UILabel!
    @IBOutlet weak var rank: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

// MARK: - View implementation
extension CoinTableViewCell: CryptoCoinCellView {
    
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
