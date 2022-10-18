//
//  ParserProtocol.swift
//  CryptoCurrency
//
//  Created by Dima on 18.10.22.
//

import Foundation

protocol ParserProtocol{
    func parse(_ data: Data) -> [CryptoCoinProtocol]
}
