//
//  NetworkURL.swift
//  NetworkingX
//
//  Created by 梁光辉 on 2023/12/17.
//  Copyright © 2023 Guanghui Liang. All rights reserved.
//

import Foundation
import FoundationX

/// The property wrapper for quickly building a request URL.
///
/// Example:
///
///     @NetworkURL(path: "basePath/path") var url: URL
///     let response = await AF.request(url, method: .post, parameters: getParams(withText: text), encoding: JSONEncoding.default)
///                            .serializingDecodable(BaseResponseModel<ResultModel>.self)
///                            .response
///
///     // or:
///     @NetworkURL(path: "basePath/path", host: "www.apple.com", scheme: "https") var url: URL
///
/// Note:
///
/// - `path` is required.
/// - `host`, `scheme`, and `port` are optional when initializing. If you don‘t specify them along with the path when initializing the URLs, they will use the default ones in NetworkConfig.
@propertyWrapper
public struct NetworkURL {
    
    public enum SchemeType {
        case http
        case https
        case none
        case custom(scheme: String)
        
        fileprivate func schemeValue() -> String {
            switch self {
            case .http:
                return "http"
            case .https:
                return "https"
            case .none:
                return ""
            case .custom(let scheme):
                return scheme
            }
        }
    }
    
    public var wrappedValue: URL {
        get {
            var components = URLComponents()
            let scheme = scheme.isEmpty ? NetworkConfig.shared.scheme.schemeValue() : scheme
            components.scheme = scheme
            components.host = host ?? NetworkConfig.shared.host
            components.path = path.hasPrefix("/") ? path : "/\(path)"
            let port = port == .none ? NetworkConfig.shared.port : port
            components.port = if case let Value<Int>.some(value) = port {
                value
            } else { nil }
            return components.url ?? NetworkConfig.shared.defaultURL
        }
    }
    
    private var path: String
    
    private var host: String?
    
    private var scheme: String
    
    private var port: Value<Int>
    
    public init(path: String, host: String? = nil, scheme: SchemeType = .https, port: Value<Int> = .none) {
        self.host = host
        self.scheme = scheme.schemeValue()
        self.port = port
        self.path = path
    }
}
