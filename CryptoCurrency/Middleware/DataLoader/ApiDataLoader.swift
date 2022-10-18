//
//  ApiDataLoader.swift
//  CryptoCurrency
//
//  Created by Dima on 18.10.22.
//

import Foundation

final class ApiDataLoader: DataLoaderProtocol{
    
    private var parser: ParserProtocol
    private var handler: RequestHandlerProtocol
    private var apiUrl: String
    
    init(apiUrl: String, parser: ParserProtocol, handler: RequestHandlerProtocol) {
        self.apiUrl = apiUrl
        self.parser = parser
        self.handler = handler
    }
    
    public func load() -> [CryptoCoinProtocol] {
        guard let data = handler.getRequest(for: apiUrl) else {return []}
        return parser.parse(data)
    }
}
