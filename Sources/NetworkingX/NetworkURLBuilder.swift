//
//  NetworkURLBuilder.swift
//  NetworkingX
//
//  Created by 梁光辉 on 2023/12/17.
//  Copyright © 2023 Guanghui Liang. All rights reserved.
//

import Foundation

/// The propertyWrapper for quickly build a request URL.
///
/// Example:
///
///     @NetworkURLBuilder(path: "basePath/path") var url: URL
///     let response = await AF.request(url, method: .post, parameters: getParams(withText: text), encoding: JSONEncoding.default)
///                            .serializingDecodable(BaseResponseModel<ResultModel>.self)
///                            .response
///
///     // or:
///     @NetworkURLBuilder(path: "basePath/path", host: "www.apple.com", scheme: "https") var url: URL
///
/// Note:
///
/// - `path` is required.
/// - `host`, `scheme`, and `port` are optional when initializing. If you don‘t specify them along with the path when initializing the URLs, they will use the default ones in NetworkConfig.
@propertyWrapper
public struct NetworkURLBuilder {
    
    public var wrappedValue: URL {
        get {
            var components = URLComponents()
            components.scheme = scheme ?? NetworkConfig.shared.scheme
            components.host = host ?? NetworkConfig.shared.host
            components.path = path.hasPrefix("/") ? path : "/\(path)"
            components.port = port
            return components.url ?? NetworkConfig.shared.defaultURL
        }
    }
    
    private var path: String
    
    private var host: String?
    
    private var scheme: String?
    
    private var port: Int?
    
    public init(path: String, host: String? = nil, scheme: String? = nil, port: Int? = nil) {
        self.host = host
        self.scheme = scheme
        self.port = port
        self.path = path
    }
}
