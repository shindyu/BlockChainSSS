//
//  ResponseStruct.swift
//  SampleServerPackageDescription
//
//  Created by shindyu on 2018/01/11.
//

import Foundation

struct TransactionResponse: Codable {
    let message: String
}

struct MineResponse: Codable {
    let message: String
    let block: Block
}

struct ChainResponse: Codable {
    let chain: [Block]
    let length: Int
}
