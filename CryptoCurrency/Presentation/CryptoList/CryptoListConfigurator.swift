//
//  CryptoListConfigurator.swift
//  CryptoCurrency
//
//  Created by Dima on 20.10.22.
//

import Foundation

protocol CryptoListCofiguratorProtocol {
    func configure(_ view: CryptoListViewProtocol, _ detailsView: CryptoCoinDetailsViewProtocol)
}

class CryptoListConfigurator: CryptoListCofiguratorProtocol {
    func configure(_ view: CryptoListViewProtocol, _ detailsView: CryptoCoinDetailsViewProtocol) {
        let apiClient = CoincapApiClient()
        let apiRequest = CoincapApiRequest(urlString: "https://api.coincap.io/v2/assets", httpMethod: "GET")
        let dataStore = CoincapApiDataStore(parser: CoincapApiCoinsParser(), apiClient: apiClient, apiRequest: apiRequest)
        let gateway = CoincapApiGateway(dataStore: dataStore)
        let presenter = CryptoListPresenter(view: view, detailsView: detailsView)
        let interactor = CryptoListInteractor(coinsGateway: gateway, presenter: presenter)
        view.setPresenter(presenter)
        view.setListInteractor(interactor)
        detailsView.setPresenter(presenter)
    }
}
