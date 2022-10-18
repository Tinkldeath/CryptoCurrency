//
//  ApiRequestHandler.swift
//  CryptoCurrency
//
//  Created by Dima on 18.10.22.
//

import Foundation

final class ApiRequestHandler: RequestHandlerProtocol{
    
    private var data: Data?
    
    func getRequest(for urlString: String) -> Data? {
        guard let url = URL(string: urlString) else { return nil }
        let session = URLSession(configuration: .default).dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data else { return }
            self.data = data
            if let error{
                print(error.localizedDescription)
            }
        }
        return self.data
    }
    
}
