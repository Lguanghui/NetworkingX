//
//  BaseResponseModel.swift
//  NetworkingX
//
//  Created by 梁光辉 on 2023/12/17.
//  Copyright © 2023 Guanghui Liang. All rights reserved.
//

import Foundation
import FoundationX

public struct BaseResponseModel<DataType: Codable & Sendable>: Codable, Sendable {
    @DefaultIntZero public var code: Int
    @DefaultEmptyString public var message: String
    public let data: DataType?
}
