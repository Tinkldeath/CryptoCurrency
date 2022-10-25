//
//  CryptoListPresenter.swift
//  CryptoCurrency
//
//  Created by Dima on 20.10.22.
//

import Foundation
import UIKit

protocol CryptoListPresenterProtocol: AnyObject {
    func load()
    func coinsCount() -> Int
    func configure(_ cell: CryptoCoinCellView, _ row: Int)
    func didSelect(_ row: Int)
}

class CryptoListPresenter: CryptoListPresenterProtocol{
    
    private var interactor: CryptoCoinsListInteractorProtocol
    private weak var view: CryptoListView?
    private var coins = [CryptoCoin]()
    
    init(interactor: CryptoCoinsListInteractorProtocol, view: CryptoListView?) {
        self.interactor = interactor
        self.view = view
    }
    
    func load() {
        self.view?.displayLoad()
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            self.interactor.displayCoinsList { coins, error in
                DispatchQueue.main.async {
                    self.view?.displayEndLoad()
                    self.displayCoins(coins)
                    self.displayError(error)
                }
            }
        }
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
        // Coin display logic
    }
    
    func coinsCount() -> Int {
        return self.coins.count
    }
    
    private func displayCoins(_ coins: [CryptoCoin]){
        self.coins = coins
        self.view?.refreshList()
    }
    
    private func displayError(_ error: Error?){
        if let error = error{
            self.view?.displayError(error)
        }
    }
    
//    //MARK: - Test method, delete soon
//    private func generateCoins(){
//        for i in 0..<20{
//            let coin = CryptoCoin(id: "", rank: i+1, symbol: "CRC", name: "Crypto \(i+1)", supply: 0.0, maxSupply: 0.0, marketCapUsd: 0.0, volumeUsd24Hr: 0.0, priceUsd: Double.random(in: 1...200000), changePercent24Hr: Double.random(in: -2.0...2.0), vwap24Hr: 0.0)
//            self.coins.append(coin)
//        }
//    }
    
}
