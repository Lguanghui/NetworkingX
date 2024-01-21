//
//  NetworkConfig.swift
//  NetworkingX
//
//  Created by 梁光辉 on 2023/12/17.
//  Copyright © 2023 Guanghui Liang. All rights reserved.
//

import Foundation
import FoundationX

public final class NetworkConfig: ObservableObject {
    
    private init() {
        
    }
    
    public static let shared: NetworkConfig = NetworkConfig()
    
    public var defaultURL: URL = URL(string: "www.apple.com")!
    
    @Published
    public private(set) var host: String = ""
    
    public private(set) var scheme: Value<String> = .some(value: "https")
    
    public private(set) var port: Value<Int> = .none
    
    /// update current network config. **It is recommended to call it before rendering the view**
    public func updateConfig(host: String, scheme: Value<String> = .some(value: "https"), port: Value<Int> = .none) {
        self.host = host
        self.scheme = scheme
        self.port = port
    }
}
