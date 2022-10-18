//
//  DataLoaderProtocol.swift
//  CryptoCurrency
//
//  Created by Dima on 18.10.22.
//

import Foundation

protocol DataLoaderProtocol{
    func load() -> [CryptoCoinProtocol]
}
