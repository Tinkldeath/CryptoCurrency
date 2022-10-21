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

class CoincapApiDataStore: RawDataStoreCoinsProtocol {
    
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
                guard let data = data else {
                    self.handleError(NetworkingError(description: "Empty data"), completionHandler)
                    return
                }
                if let error = error{
                    self.handleError(error, completionHandler)
                }
                do{
                    let coins = try self.parser.parse(data)
                    completionHandler(coins, nil)
                }catch{
                    self.handleError(error, completionHandler)
                }
            }
        }else{
            self.handleError(NetworkingError(description: "Incorrect request"), completionHandler)
        }
    }
    
    private func handleError(_ error: Error, _ completionHandler: (_ data: [RawDataCoinsEntity], _ error: Error?) -> Void ){
        completionHandler([], error)
    }
}
