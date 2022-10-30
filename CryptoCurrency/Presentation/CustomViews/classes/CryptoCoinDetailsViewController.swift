//
//  CoinDetailsViewController.swift
//  CryptoCurrency
//
//  Created by Dima on 26.10.22.
//

import UIKit

protocol CryptoCoinDetailsViewProtocol: AnyObject {
    func setPresenter(_ presenter: CryptoListPresenterProtocol)
    
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
    
    private var presenter: CryptoListPresenterProtocol!
    
    @IBOutlet private weak var symbol: UILabel!
    @IBOutlet private weak var changePercent24Hr: UILabel!
    @IBOutlet private weak var priceUsd: UILabel!
    @IBOutlet private weak var rank: UILabel!
    @IBOutlet private weak var supply: UILabel!
    @IBOutlet private weak var maxSupply: UILabel!
    @IBOutlet private weak var marketCapUsd: UILabel!
    @IBOutlet private weak var volume24Hr: UILabel!
    @IBOutlet private weak var vwap24Hr: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.presentSelectedCoin()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.presenter.presentSelectedCoin()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension CryptoCoinDetailsViewController: CryptoCoinDetailsViewProtocol {
    
    func setPresenter(_ presenter: CryptoListPresenterProtocol) {
        self.presenter = presenter
    }
    
    func displayName(_ name: String) {
        self.title = name
    }
    
    func displaySymbol(_ symbol: String) {
        self.symbol.text = symbol
    }
    
    func displayChangePrecent(_ changePercent24Hr: Double) {
        let tuple = changePercent24Hr < 0 ? (sign: "", color: UIColor.red) : (sign: "+", color: UIColor.green)
        self.changePercent24Hr.text = tuple.sign + "\(changePercent24Hr)%"
        self.changePercent24Hr.textColor = tuple.color
    }
    
    func displayPriceUsd(_ priceUsd: Double) {
        self.priceUsd.text = "\(priceUsd)$"
    }
    
    func displayRank(_ rank: Int) {
        self.rank.text = "Rank: \(rank)"
    }
    
    func displaySupply(_ supply: Double) {
        self.supply.text = "Supply: \(supply)"
    }
    
    func displayMaxSupply(_ maxSupply: Double) {
        let display = maxSupply > 0.0 ? "\(maxSupply)" : "No data"
        self.maxSupply.text = "Max supply: \(display)"
    }
    
    func displayMarketCapUsd(_ marketCapUsd: Double) {
        self.marketCapUsd.text = "Market cap: \(marketCapUsd)$"
    }
    
    func displayVolumeUsd24Hr(_ volumeUsd24Hr: Double) {
        self.volume24Hr.text = "Volume (24 hr): \(volumeUsd24Hr)$"
    }
    
    func displayVwap24Hr(_ vwap24Hr: Double) {
        self.vwap24Hr.text = "VWAP (24 hr): \(vwap24Hr)"
    }
    
}
