//
//  Block.swift
//  BlockChain
//
//  Created by shindyu on 2018/01/09.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import Foundation

struct Block: Codable {
    let index: Int
    let timestamp: Double
    let transactions: [Transaction]
    let proof: Int
    let previousHash: String
}

extension Block: Equatable {}

func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.index == rhs.index &&
        lhs.timestamp == rhs.timestamp &&
        lhs.transactions == rhs.transactions &&
        lhs.proof == rhs.proof &&
        lhs.previousHash == rhs.previousHash
}
