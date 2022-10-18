//
//  JsonParser.swift
//  CryptoCurrency
//
//  Created by Dima on 18.10.22.
//

import Foundation

final class JsonParser: ParserProtocol{
    func parse(_ data: Data) -> [CryptoCoinProtocol] {
        do {
            let decodedData = try JSONDecoder().decode(JSONCryptoCoinsTemplate.self, from: data)
            return decodedData.data
        }
        catch{
            return []
        }
    }
}
