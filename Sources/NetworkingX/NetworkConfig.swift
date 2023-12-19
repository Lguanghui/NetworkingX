//
//  NetworkConfig.swift
//  NetworkingX
//
//  Created by 梁光辉 on 2023/12/17.
//  Copyright © 2023 Guanghui Liang. All rights reserved.
//

import Cocoa

fileprivate let DEFAULT_API: String = "api.liangguanghui.site"

public final class NetworkConfig: ObservableObject {
    
    private init() {
        
    }
    
    public static let shared: NetworkConfig = NetworkConfig()
    
    public var defaultURL: URL = URL(string: DEFAULT_API)!
    
    @Published
    public private(set) var host: String = ""
    
    public private(set) var scheme: String? = "https"
    
    public private(set) var port: Int?
    
    /// update current network config. **It is recommended to call it before rendering the view**
    public func updateConfig(host: String, scheme: String? = "https", port: Int? = nil) {
        self.host = host
        self.scheme = scheme
        self.port = port
    }
}
