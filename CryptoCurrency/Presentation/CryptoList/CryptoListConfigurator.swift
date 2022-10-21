//
//  CryptoListConfigurator.swift
//  CryptoCurrency
//
//  Created by Dima on 20.10.22.
//

import Foundation

protocol CryptoListCofiguratorProtocol {
    func configure(_ view: CryptoListView)
}

class CryptoListConfigurator: CryptoListCofiguratorProtocol {
    func configure(_ view: CryptoListView) {
        let apiClient = CoincapApiClient()
        let apiRequest = CoincapApiRequest(urlString: "https://api.coincap.io/v2/assets", httpMethod: "GET")
        let dataStore = CoincapApiDataStore(parser: CoincapApiCoinsParser(), apiClient: apiClient, apiRequest: apiRequest)
        let gateway = CoincapApiGateway(dataStore: dataStore)
        let interactor = CryptoCoinsListInteractor(coinsGateway: gateway)
        let presenter = CryptoListPresenter(interactor: interactor, view: view)
        view.setPresenter(presenter)
    }
}
