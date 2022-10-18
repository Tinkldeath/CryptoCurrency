//
//  CryptoCoin.swift
//  CryptoCurrency
//
//  Created by Dima on 18.10.22.
//

import Foundation

struct CryptoCoin: CryptoCoinProtocol, Codable{
    var id: String
    var rank: Int
    var symbol: String
    var name: String
    var priceUsd: Double
    var changePercent24h: Double
}
