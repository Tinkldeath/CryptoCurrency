//
//  Parser.swift
//  CryptoCurrency
//
//  Created by Dima on 21.10.22.
//

import Foundation

protocol RawDataCoinsParser {
    func parse(_ data: Data) throws -> [RawDataCoinsEntity]
}
