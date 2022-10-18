//
//  CryptoPresenter.swift
//  CryptoCurrency
//
//  Created by Dima on 18.10.22.
//

import Foundation

final class CryptoPresenter{
    private var dataSource: CryptoDataProviderProtocol?
    private weak var delegate: CryptoViewDelegate?
    
    init(dataSource: CryptoDataProviderProtocol? = nil, delegate: CryptoViewDelegate? = nil) {
        self.dataSource = dataSource
        self.delegate = delegate
    }
    
    func didSelectCrypto(named: String){
        if let crypto = self.dataSource?.getCryptoByName(named){
            self.delegate?.displayDetails(for: crypto)
        }
    }
    
    func presentCrypto(){
        self.delegate?.displayCrypto()
    }
}
