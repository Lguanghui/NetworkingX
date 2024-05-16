//
//  NetworkConfig.swift
//  NetworkingX
//
//  Created by 梁光辉 on 2023/12/17.
//  Copyright © 2023 Guanghui Liang. All rights reserved.
//

import Foundation
import FoundationX
import Alamofire

public extension Alamofire.HTTPHeaders {
    static var commonHeaders: HTTPHeaders {
        NetworkConfig.shared.commonHeaders
    }
}

public final class NetworkConfig: ObservableObject {
    
    private init() {
        
    }
    
    public static let shared: NetworkConfig = NetworkConfig()
    
    public var defaultURL: URL = URL(string: "www.apple.com")!
    
    @Published
    public private(set) var host: String = ""
    
    public private(set) var scheme: Value<String> = .some(value: "https")
    
    public private(set) var port: Value<Int> = .none
    
    public private(set) var commonHeaders: HTTPHeaders = .default
    
    /// update current network config. **It is recommended to call it before rendering the view**
    public func updateConfig(host: String, scheme: Value<String> = .some(value: "https"), port: Value<Int> = .none) {
        self.host = host
        self.scheme = scheme
        self.port = port
    }
}

// MARK: - Headers

public extension NetworkConfig {
    func commonHeadersAppend(_ headers: HTTPHeaders) {
        headers.forEach { header in
            commonHeaders.add(header)
        }
    }
    
    func commonHeadersAppend(_ header: HTTPHeader) {
        commonHeaders.add(header)
    }
    
    func commonHeadersUpdate(name: String, value: String) {
        commonHeaders.update(name: name, value: value)
    }
    
    func commonHeadersUpdate(_ header: HTTPHeader) {
        commonHeaders.update(header)
    }
    
    func commonHeadersRemove(_ name: String) {
        commonHeaders.remove(name: name)
    }
}
