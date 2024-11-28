//
//  BaseResponseModel.swift
//  NetworkingX
//
//  Created by 梁光辉 on 2023/12/17.
//  Copyright © 2023 Guanghui Liang. All rights reserved.
//

import Foundation

public struct BaseResponseModel<DataType: Codable & Sendable>: Codable, Sendable {
    public let code: Int
    public let message: String
    public let data: DataType
}
