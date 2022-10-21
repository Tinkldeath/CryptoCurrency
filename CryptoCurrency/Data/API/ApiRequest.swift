//
//  ApiRequest.swift
//  CryptoCurrency
//
//  Created by Dima on 21.10.22.
//

import Foundation

protocol ApiRequestProtocol {
    func generateRequest() -> URLRequest?
}
