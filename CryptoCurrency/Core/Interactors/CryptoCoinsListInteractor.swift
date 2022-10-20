//
//  CryptoCoinInteractor.swift
//  CryptoCurrency
//
//  Created by Dima on 20.10.22.
//

import Foundation

protocol CryptoCoinsListInteractorProtocol {
    func displayCoinsList(_ completionHandler: (_ coins: [CryptoCoin], _ error: Error?) -> Void)
}

class CryptoCoinsListInteractor: CryptoCoinsListInteractorProtocol {
    
    private let coinsGateway: CryptoCoinsGatewayProtocol
    
    init(coinsGateway: CryptoCoinsGatewayProtocol) {
        self.coinsGateway = coinsGateway
    }
    
    func displayCoinsList(_ completionHandler: (_ coins: [CryptoCoin], _ error: Error?) -> Void) {
        self.coinsGateway.fetchCoins { coins, error in
            completionHandler(coins, error)
        }
    }
    
}
