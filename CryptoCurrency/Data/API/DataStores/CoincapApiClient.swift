//
//  CoincapApiClient.swift
//  CryptoCurrency
//
//  Created by Dima on 21.10.22.
//

import Foundation

class CoincapApiClient: ApiClientProtocol {
    
    func executeRequest(_ request: URLRequest, _ completionHandler: @escaping (Data?, Error?) -> Void) {
        let session = URLSession.shared.dataTask(with: request) { data, _, error in
            completionHandler(data, error)
        }
        session.resume()
    }
}
