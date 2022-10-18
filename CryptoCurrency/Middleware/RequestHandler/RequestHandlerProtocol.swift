//
//  RequestHandlerProtocol.swift
//  CryptoCurrency
//
//  Created by Dima on 18.10.22.
//

import Foundation

protocol RequestHandlerProtocol{
    func getRequest(for urlString: String) -> Data?
}
