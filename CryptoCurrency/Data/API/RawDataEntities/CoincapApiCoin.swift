//
//  CoincapApiCoin.swift
//  CryptoCurrency
//
//  Created by Dima on 21.10.22.
//

import Foundation

struct CoincapApiResponse: Decodable {
    var data: [CoincapApiCoin]
}

struct CoincapApiCoin: Decodable {
    var id: String
    var rank: String
    var symbol: String
    var name: String
    var supply: String
    var maxSupply: String?
    var marketCapUsd: String
    var volumeUsd24Hr: String
    var priceUsd: String
    var changePercent24Hr: String
    var vwap24Hr: String?
}

extension CoincapApiCoin : RawDataCoinsEntity {
    
    func toEntity() -> CryptoCoin {
        return CryptoCoin(
            id: self.id,
            rank: Int(self.rank) ?? 0,
            symbol: self.symbol,
            name: self.name,
            supply: Double(self.supply) ?? 0.0,
            maxSupply: Double(self.maxSupply ?? "") ?? 0.0,
            marketCapUsd: Double(self.marketCapUsd) ?? 0.0,
            volumeUsd24Hr: Double(self.volumeUsd24Hr) ?? 0.0,
            priceUsd: Double(self.priceUsd) ?? 0.0,
            changePercent24Hr: Double(self.changePercent24Hr) ?? 0.0,
            vwap24Hr: Double(self.vwap24Hr ?? "") ?? 0.0)
    }
    
}
