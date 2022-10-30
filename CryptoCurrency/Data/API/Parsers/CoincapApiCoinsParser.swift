//
//  CoincapApiCoinsParser.swift
//  CryptoCurrency
//
//  Created by Dima on 21.10.22.
//

import Foundation

class CoincapApiCoinsParser: RawDataCoinsParser {
    
    func parse(_ data: Data) throws -> [RawDataCoinsEntity] {
        do{
            let parsed = try JSONDecoder().decode(CoincapApiResponse.self, from: data)
            return parsed.data
        }catch{
            throw NetworkingError(description: "Parsing error: \(String(describing: error))")
        }
    }
    
}
