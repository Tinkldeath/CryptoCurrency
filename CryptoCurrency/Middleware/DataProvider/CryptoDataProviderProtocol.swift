//
//  DataProviderProtocol.swift
//  CryptoCurrency
//
//  Created by Dima on 18.10.22.
//

import Foundation

protocol CryptoDataProviderProtocol{
    func getCrypto() -> [CryptoCoinProtocol]
    func getCryptoByName(_ name: String) -> CryptoCoinProtocol?
}
