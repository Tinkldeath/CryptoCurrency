//
//  CryptoCoinInteractor.swift
//  CryptoCurrency
//
//  Created by Dima on 20.10.22.
//

import Foundation

protocol CryptoListInteractorProtocol: AnyObject {
    func fetchCoinsList()
}

class CryptoListInteractor: CryptoListInteractorProtocol {
    
    private let coinsGateway: CryptoCoinsGatewayProtocol
    private let presenter: CryptoListPresenterProtocol
    private let queue = DispatchQueue.global(qos: .utility)

    init(coinsGateway: CryptoCoinsGatewayProtocol, presenter: CryptoListPresenterProtocol) {
        self.coinsGateway = coinsGateway
        self.presenter = presenter
    }
    
    func fetchCoinsList() {
        self.presenter.presentLoading()
        self.queue.async { [weak self] in
            self?.coinsGateway.fetchCoins { coins, error in
                DispatchQueue.main.async { [weak self] in
                    self?.presenter.presentCoins(coins)
                    self?.presenter.presentError(error)
                    self?.presenter.endLoading()
                }
            }
        }
    }
    
}
