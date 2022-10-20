//
//  CryptoCoinCellView.swift
//  CryptoCurrency
//
//  Created by Dima on 20.10.22.
//

import Foundation

protocol CryptoCoinCellView{
    func display(symbol: String)
    func display(name: String)
    func display(priceUsd: Double)
    func display(rank: Int)
    func display(changePercent24Hr: Double)
}
