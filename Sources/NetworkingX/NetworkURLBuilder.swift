//
//  NetworkURLBuilder.swift
//  NetworkingX
//
//  Created by 梁光辉 on 2023/12/17.
//  Copyright © 2023 Guanghui Liang. All rights reserved.
//

import Foundation

/// the propertyWrapper for quickly build a request URL.
///
/// #Example#
///
///     @NetworkURLBuilder(path: "basePath/path") var url: URL
///     let response = await AF.request(url, method: .post, parameters: getParams(withText: text), encoding: JSONEncoding.default)
///                            .serializingDecodable(BaseResponseModel<ResultModel>.self)
///                            .response
///
///     // or:
///     @NetworkURLBuilder(path: "basePath/path", host: "www.apple.com", scheme: "https") var url: URL
///
/// #Note#
///
/// - `path` is required.
/// - `host`, `scheme`, and `port` are optional when initializing. If you don‘t specify them along with the path when initializing the URLs, they will use the default ones in NetworkConfig.
@propertyWrapper
public struct NetworkURLBuilder {
    public var wrappedValue: URL
    
    
    
    public init(path: String, host: String = NetworkConfig.shared.host, scheme: String? = NetworkConfig.shared.scheme, port: Int? = NetworkConfig.shared.port) {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path.hasPrefix("/") ? path : "/\(path)"
        components.port = port
        
        wrappedValue = components.url ?? NetworkConfig.shared.defaultURL
    }
}
