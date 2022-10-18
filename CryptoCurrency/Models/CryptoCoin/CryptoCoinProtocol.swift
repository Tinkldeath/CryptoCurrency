//
//  CryptoCoinProtocol.swift
//  CryptoCurrency
//
//  Created by Dima on 18.10.22.
//

import Foundation

protocol CryptoCoinProtocol{
    var id: String { get }
    var rank: Int { get }
    var name: String { get }
    var priceUsd: Double { get }
    var changePercent24h: Double { get }
}
