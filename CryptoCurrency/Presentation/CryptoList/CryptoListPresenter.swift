//
//  CryptoListPresenter.swift
//  CryptoCurrency
//
//  Created by Dima on 20.10.22.
//

import Foundation
import UIKit

protocol CryptoListPresenterProtocol: AnyObject{
    var numberOfCoins: Int { get }
    var router: CryptoListRouterProtocol? { get }
    
    func configure(_ cell: CryptoCoinCellView, _ row: Int)
    func didSelect(_ row: Int)
}

class CryptoListPresenter: CryptoListPresenterProtocol{
    
    private var coins: [CryptoCoin]
    var numberOfCoins: Int
    var router: CryptoListRouterProtocol?
    
    init(){
        self.coins = []
        self.numberOfCoins = 0
        self.router = nil
        generateCoins()
    }
    
    func configure(_ cell: CryptoCoinCellView, _ row: Int) {
        let coin = self.coins[row]
        cell.display(symbol: coin.symbol)
        cell.display(rank: coin.rank)
        cell.display(name: coin.name)
        cell.display(priceUsd: coin.priceUsd)
        cell.display(changePercent24Hr: coin.changePercent24Hr)
    }
    
    func didSelect(_ row: Int) {
        
    }
    
    //MARK: - Test method, delete soon
    private func generateCoins(){
        for i in 0..<20{
            let coin = CryptoCoin(id: "", rank: i+1, symbol: "CRC", name: "Crypto \(i+1)", supply: 0.0, maxSupply: 0.0, marketCapUsd: 0.0, volumeUsd24Hr: 0.0, priceUsd: Double.random(in: 1...200000), changePercent24Hr: Double.random(in: -1.0...1.0), vwap24Hr: 0.0)
            self.coins.append(coin)
        }
        self.numberOfCoins = self.coins.count
    }
}
