//
//  RawDataStore.swift
//  CryptoCurrency
//
//  Created by Dima on 21.10.22.
//

import Foundation

protocol RawDataStoreCoinsProtocol {
    func requestData(_ completionHandler: @escaping (_ data: [RawDataCoinsEntity], _ error: Error?) -> Void)
}
