//
//  CoinDetailsViewController.swift
//  CryptoCurrency
//
//  Created by Dima on 26.10.22.
//

import UIKit

protocol CryptoCoinDetailsViewProtocol: AnyObject {
    func displayName(_ name: String)
    func displaySymbol(_ symbol: String)
    func displayChangePrecent(_ changePercent24Hr: Double)
    func displayPriceUsd(_ priceUsd: Double)
    func displayRank(_ rank: Int)
    func displaySupply(_ supply: Double)
    func displayMaxSupply(_ maxSupply: Double)
    func displayMarketCapUsd(_ marketCapUsd: Double)
    func displayVolumeUsd24Hr(_ volumeUsd24Hr: Double)
    func displayVwap24Hr(_ vwap24Hr: Double)
}

class CryptoCoinDetailsViewController: UIViewController {
    
    @IBOutlet private weak var symbolLabel: UILabel!
    @IBOutlet private weak var changePercent24HrLabel: UILabel!
    @IBOutlet private weak var priceUsdLabel: UILabel!
    @IBOutlet private weak var rankLabel: UILabel!
    @IBOutlet private weak var supplyLabel: UILabel!
    @IBOutlet private weak var maxSupplyLabel: UILabel!
    @IBOutlet private weak var marketCapUsdLabel: UILabel!
    @IBOutlet private weak var volume24HrLabel: UILabel!
    @IBOutlet private weak var vwap24HrLabel: UILabel!
    
    private var titleValue: String = ""
    private var symbol: String = ""
    private var changePercent24Hr: String = ""
    private var changePercentColor: UIColor = .tintColor
    private var priceUsd: String = ""
    private var rank: String = ""
    private var supply: String = ""
    private var maxSupply: String = ""
    private var marketCapUsd: String = ""
    private var volume24Hr: String = ""
    private var vwap24Hr: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setupView() {
        self.title = self.titleValue
        self.symbolLabel.text = self.symbol
        self.changePercent24HrLabel.text = self.changePercent24Hr
        self.changePercent24HrLabel.textColor = self.changePercentColor
        self.priceUsdLabel.text = self.priceUsd
        self.rankLabel.text = self.rank
        self.supplyLabel.text = self.supply
        self.maxSupplyLabel.text = self.maxSupply
        self.marketCapUsdLabel.text = self.marketCapUsd
        self.volume24HrLabel.text = self.volume24Hr
        self.vwap24HrLabel.text = self.vwap24Hr
    }
}

extension CryptoCoinDetailsViewController: CryptoCoinDetailsViewProtocol {
        
    func displayName(_ name: String) {
        self.titleValue = name
    }
    
    func displaySymbol(_ symbol: String) {
        self.symbol = symbol
    }
    
    func displayChangePrecent(_ changePercent24Hr: Double) {
        let tuple = changePercent24Hr < 0 ? (sign: "", color: UIColor.red) : (sign: "+", color: UIColor.green)
        self.changePercent24Hr = tuple.sign + "\(changePercent24Hr)%"
        self.changePercentColor = tuple.color
    }
    
    func displayPriceUsd(_ priceUsd: Double) {
        self.priceUsd = "\(priceUsd)$"
    }
    
    func displayRank(_ rank: Int) {
        self.rank = "Rank: \(rank)"
    }
    
    func displaySupply(_ supply: Double) {
        self.supply = "Supply: \(supply)"
    }
    
    func displayMaxSupply(_ maxSupply: Double) {
        let display = maxSupply > 0.0 ? "\(maxSupply)" : "No data"
        self.maxSupply = "Max supply: \(display)"
    }
    
    func displayMarketCapUsd(_ marketCapUsd: Double) {
        self.marketCapUsd = "Market cap: \(marketCapUsd)$"
    }
    
    func displayVolumeUsd24Hr(_ volumeUsd24Hr: Double) {
        self.volume24Hr = "Volume (24 hr): \(volumeUsd24Hr)$"
    }
    
    func displayVwap24Hr(_ vwap24Hr: Double) {
        self.vwap24Hr = "VWAP (24 hr): \(vwap24Hr)"
    }
    
}
