//
//  ApiClient.swift
//  CryptoCurrency
//
//  Created by Dima on 21.10.22.
//

import Foundation

protocol ApiClientProtocol {
    func executeRequest(_ request: URLRequest, _ completionHandler: @escaping (Data?, Error?) -> Void)
}
