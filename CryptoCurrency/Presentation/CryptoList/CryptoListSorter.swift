//
//  CryptoListSorter.swift
//  CryptoCurrency
//
//  Created by Dima on 30.10.22.
//

import Foundation

protocol CryptoListSortingStrategyProtocol {
    func sort(_ first: CryptoCoin, _ second: CryptoCoin) -> Bool
}

struct PriceUpSortingStrategy: CryptoListSortingStrategyProtocol {
    func sort(_ first: CryptoCoin, _ second: CryptoCoin) -> Bool {
        return first.priceUsd < second.priceUsd
    }
}

struct PriceDownSortingStrategy: CryptoListSortingStrategyProtocol {
    func sort(_ first: CryptoCoin, _ second: CryptoCoin) -> Bool {
        return first.priceUsd > second.priceUsd
    }
}

struct RankUpSortingStrategy: CryptoListSortingStrategyProtocol {
    func sort(_ first: CryptoCoin, _ second: CryptoCoin) -> Bool {
        return first.rank < second.rank
    }
}

struct RankDownSortingStrategy: CryptoListSortingStrategyProtocol {
    func sort(_ first: CryptoCoin, _ second: CryptoCoin) -> Bool {
        return first.rank > second.rank
    }
}

protocol CryptoListSorterProtocol {
    var sortingStrategy: CryptoListSortingStrategyProtocol? { get }
    mutating func setSortingStrategy(_ describing: String)
    func sortingOptions() -> [String]
}

struct CryptoListSorter: CryptoListSorterProtocol {
    
    private var strategyDict: [String: CryptoListSortingStrategyProtocol] = [
        "Price ↑": PriceUpSortingStrategy(),
        "Price ↓": PriceDownSortingStrategy(),
        "Rank ↑": RankUpSortingStrategy(),
        "Rank ↓": RankDownSortingStrategy()
    ]
    
    private(set) var sortingStrategy: CryptoListSortingStrategyProtocol?
    
    mutating func setSortingStrategy(_ describing: String) {
        self.sortingStrategy = strategyDict[describing]
    }
    
    func sortingOptions() -> [String] {
        var options = [String]()
        for key in self.strategyDict.keys {
            options.append(key)
        }
        return options
    }
    
}
