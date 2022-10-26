//
//  CryptoListPresenter.swift
//  CryptoCurrency
//
//  Created by Dima on 20.10.22.
//

import Foundation

protocol CryptoListPresenterProtocol: AnyObject {
    func presentLoading()
    func endLoading()
    func presentCoins(_ coins: [CryptoCoin])
    func presentError(_ error: Error?)
    func presentCoinDetails(_ index: Int)
    
    func coinsCount() -> Int
    func configure(_ cell: CryptoCoinCellView, _ row: Int)
}

final class CryptoListPresenter: CryptoListPresenterProtocol{
        
    private weak var view: CryptoListViewProtocol?
    private weak var detailsView: CryptoCoinDetailsViewProtocol?
    private var coins: [CryptoCoin]
    
    init(view: CryptoListViewProtocol? = nil, detailsView: CryptoCoinDetailsViewProtocol? = nil) {
        self.view = view
        self.detailsView = detailsView
        self.coins = []
    }
    
    func configure(_ cell: CryptoCoinCellView, _ row: Int) {
        let coin = self.coins[row]
        cell.display(symbol: coin.symbol, name: coin.name, priceUsd: coin.priceUsd, rank: coin.rank, changePercent24Hr: coin.changePercent24Hr)
    }
    
    func coinsCount() -> Int {
        return self.coins.count
    }
    
    func presentCoins(_ coins: [CryptoCoin]) {
        self.coins = coins
        self.view?.refreshList()
    }
    
    func presentCoinDetails(_ index: Int) {
        let _ = self.coins[index]
        self.detailsView?.displayCoin()
    }
    
    func presentError(_ error: Error?) {
        if let error = error {
            self.view?.displayError(error)
        }
    }
    
    func presentLoading() {
        self.view?.displayLoad()
    }
    
    func endLoading() {
        self.view?.displayEndLoad()
    }
}
