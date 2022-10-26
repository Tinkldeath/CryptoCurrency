//
//  CoincapApiDatastore.swift
//  CryptoCurrency
//
//  Created by Dima on 21.10.22.
//

import Foundation

struct NetworkingError: Error{
    var description: String
}

final class CoincapApiDataStore: RawDataStoreCoinsProtocol {
    
    private let parser: RawDataCoinsParser
    private let apiClient: ApiClientProtocol
    private let apiRequest: ApiRequestProtocol
    
    init(parser: RawDataCoinsParser, apiClient: ApiClientProtocol, apiRequest: ApiRequestProtocol) {
        self.parser = parser
        self.apiClient = apiClient
        self.apiRequest = apiRequest
    }
    
    func requestData(_ completionHandler: @escaping (_ data: [RawDataCoinsEntity], _ error: Error?) -> Void) {
        if let request = self.apiRequest.generateRequest() {
            self.apiClient.executeRequest(request) { data, error in
                guard let data = data else { completionHandler([], NetworkingError(description: "No data")); return}
                do{
                    let coins = try self.parser.parse(data)
                    completionHandler(coins, nil)
                }catch{
                    completionHandler([], error)
                }
            }
        }
    }
    
}
