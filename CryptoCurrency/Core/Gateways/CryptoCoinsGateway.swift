//
//  CryptoCoinsRepository.swift
//  CryptoCurrency
//
//  Created by Dima on 20.10.22.
//

import Foundation

protocol CryptoCoinsGatewayProtocol {
    func fetchCoins(_ completionHandler: (_ coins: [CryptoCoin], _ error: Error?) -> Void)
}
