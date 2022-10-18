//
//  CryptoViewDelegate.swift
//  CryptoCurrency
//
//  Created by Dima on 18.10.22.
//

import Foundation

protocol CryptoViewDelegate: NSObjectProtocol{
    func displayCrypto()
    func displayDetails(for crypto: CryptoCoinProtocol)
}
