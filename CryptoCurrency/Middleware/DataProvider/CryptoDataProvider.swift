//
//  DataProvider.swift
//  CryptoCurrency
//
//  Created by Dima on 18.10.22.
//

import Foundation

final class CryptoDataProvider: CryptoDataProviderProtocol{
    
    private var crypto: [CryptoCoinProtocol]
    private var dataLoader: DataLoaderProtocol
    
    private static var _instance = CryptoDataProvider()
    
    private init() {
        self.dataLoader = ApiDataLoader(apiUrl: "https://docs.coincap.io/#ee30bea9-bb6b-469d-958a-d3e35d442d7a", parser: JsonParser(), handler: ApiRequestHandler())
        self.crypto = self.dataLoader.load()
    }
    
    public static var shared = {
        return _instance
    }()
    
    public func getCrypto() -> [CryptoCoinProtocol]{
        return self.crypto
    }
    
    public func getCryptoByName(_ name: String) -> CryptoCoinProtocol?{
        return self.crypto.first(where: { $0.name == name })
    }
}
