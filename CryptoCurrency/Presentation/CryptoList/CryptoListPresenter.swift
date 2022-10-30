//
//  CryptoListPresenter.swift
//  CryptoCurrency
//
//  Created by Dima on 20.10.22.
//

import Foundation
import UIKit

protocol CryptoListPresenterProtocol: AnyObject {
    func presentLoading()
    func endLoading()
    func presentCoins(_ coins: [CryptoCoin])
    func presentError(_ error: Error?)
    func presentCoinDetails(_ index: Int)
    func presentSelectedCoin()
    func presentSortedBy(_ describing: String)
    
    func coinsCount() -> Int
    func sortingOptions() -> [String]
    func configure(_ cell: CryptoCoinCellView, _ row: Int)
}

final class CryptoListPresenter: CryptoListPresenterProtocol {
        
    private weak var view: CryptoListViewProtocol?
    private weak var detailsView: CryptoCoinDetailsViewProtocol?
    private var coins: [CryptoCoin]
    private var selectedCoin: CryptoCoin?
    private var sorter: CryptoListSorterProtocol
    
    init(view: CryptoListViewProtocol? = nil, detailsView: CryptoCoinDetailsViewProtocol? = nil) {
        self.view = view
        self.detailsView = detailsView
        self.coins = []
        self.selectedCoin = nil
        self.sorter = CryptoListSorter()
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
        let coin = self.coins[index]
        self.selectedCoin = coin
    }
    
    func presentSelectedCoin() {
        guard let selectedCoin = self.selectedCoin else { return }
        self.displayDetails(selectedCoin)
    }
    
    private func displayDetails(_ coin: CryptoCoin) {
        self.detailsView?.displayName(coin.name)
        self.detailsView?.displayRank(coin.rank)
        self.detailsView?.displaySupply(coin.supply)
        self.detailsView?.displaySymbol(coin.symbol)
        self.detailsView?.displayMaxSupply(coin.maxSupply)
        self.detailsView?.displayPriceUsd(coin.priceUsd)
        self.detailsView?.displayVwap24Hr(coin.vwap24Hr)
        self.detailsView?.displayChangePrecent(coin.changePercent24Hr)
        self.detailsView?.displayVolumeUsd24Hr(coin.volumeUsd24Hr)
        self.detailsView?.displayMarketCapUsd(coin.marketCapUsd)
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
    
    func presentSortedBy(_ describing: String){
        self.sorter.setSortingStrategy(describing)
        guard let strategy = self.sorter.sortingStrategy else { return }
        self.coins = self.coins.sorted(by: { strategy.sort($0, $1) })
        self.view?.refreshList()
    }
    
    func sortingOptions() -> [String] {
        return self.sorter.sortingOptions()
    }
}
