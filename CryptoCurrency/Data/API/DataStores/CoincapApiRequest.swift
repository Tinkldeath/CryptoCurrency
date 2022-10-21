//
//  CoincapApiRequest.swift
//  CryptoCurrency
//
//  Created by Dima on 21.10.22.
//

import Foundation

class CoincapApiRequest: ApiRequestProtocol {
    
    private var urlString: String
    private var httpMethod: String
    
    init(urlString: String, httpMethod: String){
        self.urlString = urlString
        self.httpMethod = httpMethod
    }
    
    func generateRequest() -> URLRequest? {
        guard let url = URL(string: self.urlString) else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod
        return request
    }
    
}
