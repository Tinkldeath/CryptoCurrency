//
//  CoinTableViewCell.swift
//  CryptoCurrency
//
//  Created by Dima on 20.10.22.
//

import UIKit

protocol CryptoCoinCellView {
    func display(symbol: String, name: String, priceUsd: Double, rank: Int, changePercent24Hr: Double)
}

class CoinTableViewCell: UITableViewCell {
       
    @IBOutlet private weak var symbol: UILabel!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var changePercent24Hr: UILabel!
    @IBOutlet private weak var priceUsd: UILabel!
    @IBOutlet private weak var rank: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

// MARK: - View implementation
extension CoinTableViewCell: CryptoCoinCellView {
    
    func display(symbol: String, name: String, priceUsd: Double, rank: Int, changePercent24Hr: Double) {
        self.symbol.text = symbol
        self.name.text = name
        self.priceUsd.text = "\(Double(round(priceUsd*100)/100)) $"
        self.rank.text = "Rank: \(rank)"
        self.display(changePercent24Hr: changePercent24Hr)
    }
    
    private func display(changePercent24Hr: Double) {
        let tuple = changePercent24Hr < 0 ? (sign: "", color: UIColor.red) : (sign: "+", color: UIColor.green)
        self.changePercent24Hr.text = tuple.sign + "\(Double(round(changePercent24Hr*1000000)/1000000))%"
        self.changePercent24Hr.textColor = tuple.color
    }
    
}
