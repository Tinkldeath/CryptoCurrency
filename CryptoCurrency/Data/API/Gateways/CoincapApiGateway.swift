//
//  CoincapApiGateway.swift
//  CryptoCurrency
//
//  Created by Dima on 21.10.22.
//

import Foundation

class CoincapApiGateway: CryptoCoinsGatewayProtocol{
    
    private let dataStore: RawDataStoreCoinsProtocol
    
    init(dataStore: RawDataStoreCoinsProtocol) {
        self.dataStore = dataStore
    }
    
    func fetchCoins(_ completionHandler: @escaping (_ data: [CryptoCoin], _ error: Error?) -> Void) {
        self.dataStore.requestData { data, error in
            var array = [CryptoCoin]()
            for entity in data{
                array.append(entity.toEntity())
            }
            completionHandler(array, error)
        }
    }
}
